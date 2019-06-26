/**
 * [description]
 * 根据排序pageData.sort，页码pageData.currentPage,异步获取商品,并重组数据（，）
 * 注：区域字段在请求的cookie里面.
 * 【一】pageData.bwsStaus==-1:初始请求，获取推荐的联营商品，
 * 【二】pageData.bwsStaus=='[pid,pid,pid.....pid]':综合排序【大于第一页】，获取以排除推荐联营商品的数据
 * 【三】pageData.bwsStaus==1：默认排序及分页请求，注：当综合排序第一页时需将 底部推荐联营商品 与 请求数据进行合并，
 *      合并规则：倒数查找自营商品 替换为 联营商品
 * 【四】综合第一页时将提前获取的底部推荐联营商品整合到主商品数据
 * 【五】如果请求有推广活动则再次重组主商品数据结构,根据主商品特性clothes，merchandise，isBigImg设置广告活动高度
 * 【function 1】综合排序第一页时，将推荐联营商品整合到异步主商品
 * 【function 2】异步请求如果有推广活动位，将活动数据整合到主商品
 * 【function 3】重新设置迷你分页器，底部分页器
 */
define(function(require,exports,module){
    var tpl_detail = require("./templateGoods").getTemplate("normal");
    /**
     * [description]
     * 商品模板+区域推广活动 art-template
     * {{noSkusStock}}： 无货标识，pagejs.ftl 根据区域设置
     * {{isActive}},是否广告位，
     */
    var tpl_item = '\
    {{each prodInfo.products}}\
    {{if $value.isActive}}\
    <li class="product-item product-ad" style="height:{{$value.height}}px">\
        <a class="activeImg" data-code="{{modelid}}-{{pageNumber}}_activities_{{$index+1}}" href="{{$value.mUrl}}" title="{{$value.title}}" target="_blank">\
        <img src="//img.gomein.net.cn/images/grey.gif" gome-src="{{$value.img}}" alt="{{$value.pTxt}}">\
        </a>\
        <span class="product-ad-info">\
        <em class="product-ad-name">{{$value.title}}</em>\
        <em class="product-ad-title">{{$value.pTxt}}</em>\
        <a class="product-ad-btn" data-code="{{modelid}}-{{pageNumber}}_activities_{{$index+1}}" href="{{$value.mUrl}}" target="_blank">点击进入</a>\
        </span>\
    </li>\
    {{else}}\
    <li class="product-item{{if $value.taoGou}} product-item-tao{{/if}}{{if $value.images.length==0}} hideSmallBox{{/if}}" from="ajax" id="gm-{{$value.pId}}-{{$value.skuId}}">\
        <input appointment="{{if $value.stock==3 || $value.stock==6 || $value.stock==4}}true{{/if}}" class="productInfo" salestype="{{if $value.thirdProduct}}true{{else}}false{{/if}}" type="hidden" pid="{{$value.pId}}" skuid="{{$value.skuId}}" skuname="{{$value.alt}}" prd-index="{{$index+1}}" price="{{$value.price}}" salesVolume="{{$value.salesVolume}}" evaluateCount="{{$value.evaluateCount}}" cateId="{{$value.firstCat}}_{{$value.secondCat}}_{{$value.defCatId}}" brandIds="{{each $value.brandIds as value}}{{if $index==0}}{{value}}{{/if}}{{/each}}" thirdProduct="{{$value.thirdProduct | formatBoolean}}" shopId="{{if $value.shopId}}{{$value.shopId}}{{/if}}"  shopName="{{if $value.sName}}{{$value.sName}}{{/if}}"  promoScore="{{$value.promoScore}}" promoStock="{{$value.promoStock}}" score="{{$value.score}}" pStock="{{$value.stock}}" pWeight="{{$value.promoStock}}" taoType="{{$value.taoType}}" taoSkuId="{{$value.taoSkuId}}" thirdCat="{{$value.defCatId}}" skuType="{{if $value.interFlowType ==1}}G3PP{{else if $value.interFlowType ==5}}3PP{{else if $value.interFlowType ==0}}{{if $value.skuType ==gome_sku}}SMI{{else if $value.skuType == super_market_sku}}SMI_T{{/if}}{{/if}}" brandCode="{{$value.brandCode}}" skuNo="{{$value.skuNo}}"/>\
        <ul class="arbitrage clearfix">\
            <li class="arbitrage-num arbitrage-cur" pId="{{$value.pId}}" sId="{{$value.skuId}}">单件</li>\
            {{each $value.taoGou}}\
            {{if $index < 3}}\
            <li class="arbitrage-num">{{$value}}件套</li>\
            {{/if}}\
            {{/each}}\
        </ul>\
        <div class="item-tab-warp">'+tpl_detail+'</div>\
    </li>\
    {{/if}}\
    {{/each}}\
    ';
    /**
     * [description]
     * 重组主商品和推荐联营商品
     */
    function mixedShopData(mainArray,shopArray){
        if(shopArray.length == 0) return false;
        for(var i = mainArray.length-1,j=shopArray.length;i>0&&j>0;i--){
            if(!mainArray[i].thirdProduct){
                j--;
                mainArray[i] = shopArray[j];
            }
        }
    }
    /**
     * [description]
     * 重组主商品和推广活动位，展示位置自定义
     */
    function mixActiveData(mainArray,activeArray,activeHeight){
        var posArr = [11,19,31];//广告位展示位置
        for(var i= 0;i<posArr.length;i++){
            var forIndex = posArr[i];
            if(activeArray[i] && mainArray[forIndex-1]){
                mainArray.splice(forIndex,0, $.extend({},activeArray[i],{isActive:true,height:activeHeight}));
            }
        }
    }
    /**
     * [description]
     * 异步请求主数据方法，并且渲染页面，主要参数sort，currentPage
     */
    function getGoods(callback){
        var _ajaxData = 0;
        if(pageData.sort === '00' && pageData.currentPage > 1){
            _ajaxData = {page:pageData.currentPage,bws:pageData.dataBW.bwsString,type:"json",aCnt:pageData.aCnt};
        }else {
            _ajaxData = {page:pageData.currentPage,bws:0,type:"json"};
        }
        //首屏商品异步加载增加参数rank
        if(pageData.sort === '00' && pageData.currentPage == 1){
            $.extend(_ajaxData,{rank:tagWightVersion=="A"?0:1});
        }

        $.ajax({
            url:pageData.ajaxURL,
            dataType:"json",
            data:_ajaxData,
            timeout:3000,
            beforeSend:function(){
                $('#product-waiting').show();
            }
        }).always(function () {
            pageData.ajaxStatus = false;
            $('#product-waiting').hide();
        }).done(function (data) {
            if(!data.content) {return false};
            if(data.content.prodInfo.products && data.content.prodInfo.products.length <=16){//小于16个商品
               // console.log('16');
                $("#szSpread,#prdRight-1,#prdRight-3,#prdRight-4").remove();
            };
            //面包屑位置商品总数量保证与实际请求数量同步
            if(window.pageName != "品牌商品页") {
                $("#searchTotalNumber").text(data.content.pageBar.totalCount);
            }
            //alert(data.content.selectData.toolBar.selectedInstock)
            if(data.content.selectData.toolBar.selectedInstock == 1){//排序（不包含综合）默认勾选只显示有货
                $("#instock").addClass("checke");
            }else{
                $("#instock").removeClass("checke")
            };
            $("#instock").attr("href",$("#instock").attr("data-href")+data.content.toolBar.instock.url.replace(/&sort=[0-9]+/,''));
            pageData.currentPage = data.content.pageBar.pageNumber;
            pageData.totalPage = data.content.pageBar.totalPage;
            if(pageData.sort === '00' && pageData.currentPage == 1 && pageData.dataBW.bwsData){
                //如果是综合第一页时，混合推荐联营商品
                mixedShopData(data.content.prodInfo.products,pageData.dataBW.bwsData);
            }
            if(data.content.activities && data.content.activities.length > 0){
                var active_h = 427;
                if(data.content.prodInfo.clothes || data.content.prodInfo.merchandise){

                    if(data.content.prodInfo.products[0].isBigImg){
                        active_h=537
                    }else{
                        active_h= 472;
                    }
                };

                mixActiveData(data.content.prodInfo.products,data.content.activities,active_h);
            }
            //活动推广位
            if(data.content.regionPromoInfo){
                if(!pageData.isfilter){//左侧广告，当筛选无结果的时候隐藏
                    if(data.content.prodInfo.products.length <=16){//当商品数量小于16个时 左侧广告隐藏
                        $("#szSpread").remove();
                    }else{
                        $("#szSpread").remove();
                        $(".product-right-box").prepend("<a id='szSpread' data-code='9000000900-0' target='_blank' href='"+data.content.regionPromoInfo.promUrl+"'><img src='"+data.content.regionPromoInfo.imgUrl+"'></a>");
                    }
                }else{
                    $("#szSpread").remove();
                }
            }else{
                $("#szSpread").remove();
            };
            //如果是价格展示热门分类产品，点击全部才展示全部商品
            if($("#sort-price").hasClass("cur") && (!pageData.isShowALL)){
                if(data.content.toolBar.sort.price.isPriceSort == 1){
                    $(".product-showmore a").attr("href",data.content.toolBar.sort.price.url3);
                    $(".product-showmore").show();
                }
            }else{
                $(".product-showmore").hide();
            }
            //模板渲染
            template.helper("formatBoolean",function(data,format){
                return String(data);
            });
            data.content.gome_sku = "gome-sku";
            data.content.super_market_sku = "super_market_sku";
            var itemHTML = templateSimple.compile(tpl_item)($.extend({},data.content,{'noSkusStock':pageData.noSkusStock,'modelid':"9000000700",'pageNumber':pageData.currentPage,'productSite':pageData.productSite,pageType:$("body").attr("data-page")}));
            if($.trim(itemHTML) !=""){
                $('#product-box').empty().html(itemHTML);
            }

            if(callback && typeof callback == "function"){
                callback();
            }
            window.compare_asyn();
            if(data.content.pageBar.totalPage == 1) {return false};
            require("../plugin/pager");
            $("#j-page").ucPager({
                pageClass: "",
                currentPage: pageData.currentPage,
                totalPage: pageData.totalPage,
                pageSize: 48,
                clickCallback: function(curPage) {
                    pageData.currentPage = curPage;
                    getGoods(goodsTop);
                }
            });
            $("#min-pager-number").text(pageData.currentPage+'/'+pageData.totalPage);

            if(pageData.currentPage > 1 && pageData.currentPage < pageData.totalPage){
                $('#mp-prev').removeClass('mp-disable');
                $('#mp-next').removeClass('mp-disable');
            }else{
                if(pageData.currentPage === 1){
                    $('#mp-prev').addClass('mp-disable');
                }else{
                    $('#mp-next').addClass('mp-disable');
                }
            }
        }).fail(function () {
            console.log("请求错误")
        });
    }
    /**
     * 商品翻页操作时，整体回到商品区域顶部
     */
    function goodsTop() {
        var _top = $("#product-left").offset().top;
        $(window).scrollTop(_top);
    }
    module.exports = {
        getGoods:getGoods,
        goodsTop:goodsTop
    }
});