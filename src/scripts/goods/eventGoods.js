/*加入购物车*/
$("#product-box").delegate(".addTo-cart", "click", function() {
    var $this = $(this),
        _type = 0,
        _pid = $this.attr("pid"),
        _sid = $this.attr("skuid"),
        _taogType = $this.attr("taoType"),
        _shopFlag = $this.attr("shopFlag");

    if($this.attr("isHyg") == "1" && _shopFlag != 6 && _shopFlag != 5){_type = 16};

    if(_taogType == 2){_type = 24};
    if(_taogType == 3){
        _type = 24;
        _sid = $this.attr("taoSkuId")
    };

    /* 加入购物车美通卡入口*/
    if($this.attr("isMCard")){
        window.open("//card"+cookieDomain+"?intcmp="+$this.attr("data-code")+"&skuType="+$this.attr("isMCard")+"&productId="+_pid+"&skuId="+_sid+"&count=1","_blank")
    }else{
        window.open("//cart"+cookieDomain+"/addsuccess?intcmp="+$this.attr("data-code")+"&homesite=home&type="+_type+"&sid="+_sid+"&pid="+_pid+"&pcount=1&cr=0"+"&_r="+new Date().getTime(),"_blank")
    }
});


/*添加收藏*/
$("#product-box").delegate(".add-collection", "click", function() {
    var $this = $(this),
        _pid = $this.attr("pid"),
        _sid = $this.attr("skuid"),
        _name = $this.attr("pname");
    g.login(function(){
        require('../function/addCollection').addCollect(_pid,_sid,loginData.loginId,_name);
    });
});

/*到货通知*/
$("#product-box").delegate(".next-buy","click",function(){
    var $this = $(this),
        _pid = $this.attr("pid"),
        _sid = $this.attr("skuid");
    g.login(function(){
        require('../function/arriveNotice').arriveNotice(_pid,_sid,loginData.loginId,pageData.regionId);
    });
});
/*套装商品切换*/
$("#product-box").delegate(".arbitrage-num","mouseenter",function(){
    var _this = $(this).parents(".product-item-tao");
    var _index = $(this).index();
    if($(this).hasClass("arbitrage-cur")) return false;
    $(this).addClass("arbitrage-cur").siblings().removeClass("arbitrage-cur")
    if(!_this.data("taoCompate")){
        var _data = {products:[]};
        var tpl_detail = require("./templateGoods").getTemplate("taogou");
        var tpl_taogou = '{{each products}}'+tpl_detail+'{{/each}}';
        var data = _this.attr("id").split("-");
        $.ajax({
            type:"get",
            url:"//apis"+cookieDomain+"/p/taoGou/"+data[1]+"/"+data[2],
            dataType:"jsonp",
            data:{from:"search"},
            timeout:1000
        }).done(function(data){
            _this.data("taoCompate",true);
            _data.products = data;
            var _html = templateSimple.compile(tpl_taogou)($.extend({},_data,{'noSkusStock':pageData.noSkusStock,'modelid':"9000000700",'pageNumber':pageData.currentPage,'productSite':pageData.productSite}));
            _this.find(".item-tab-warp").append(_html).find(".item-tab").eq(_index).show().siblings().hide();
            window.compare_asyn();
        }).fail(function(){
            _this.data("taoCompate",false);
        })
    }else{
        _this.find(".item-tab-warp").find(".item-tab").eq(_index).show().siblings().hide();
    }
});

/*多sku小图点选*/
$("#product-box").delegate(".icon-prev","click",function(){
    var pars = $(this).parents(".item-pic-small-box");
    var ingList = pars.find(".imgList");
    var nextbtn = pars.find(".icon-next");
    var index = pars.attr("index");
    var curIndex = pars.attr("curindex");
    if (!$(this).hasClass("disable")) {
        if (++curIndex <= index) {
            nextbtn.removeClass("disable");
            pars.attr("curindex", curIndex);
            ingList.animate({
                "left": (curIndex - index) * 37 + "px"
            }, 100)
        } else {
            $(this).addClass("disable");
        }
    }
});
$("#product-box").delegate(".icon-next","click",function(){
    var pars = $(this).parents(".item-pic-small-box");
    var ingList = pars.find(".imgList");
    var prevbtn = pars.find(".icon-prev ");
    var index = pars.attr("index");
    var curIndex = pars.attr("curindex");
    if (!$(this).hasClass("disable")) {
        if (--curIndex >= 5) {
            prevbtn.removeClass("disable");
            pars.attr("curindex", curIndex);
            ingList.animate({
                "left": (curIndex - index) * 37 + "px"
            }, 100)
        } else {
            $(this).addClass("disable");
        }
    }
});
//$("#product-box").delegate(".icon-li","mouseenter",function(){
    function mesgChange(){
        var _o = $(this);            
        var pars = _o.parents(".item-tab");
        var imgSrc = "";
        var links = _o.attr("surl");
        var nSid = _o.attr("sid");
        var nskuNo = _o.attr("skuNo");
        var productInfoObj = pars.parents('.product-item').find(".productInfo");

        if(pars.attr("isBigImg")){
            imgSrc = _o.attr("d_src")+"_275.jpg";
        }else{
            imgSrc = _o.attr("d_src")+"_210.jpg";
        };
        // pars.find(".asynPrice").attr("skuid",nSid);
        pars.find(".item-pic img").attr("src",imgSrc);
        pars.find(".item-pic a").attr("href",links);
        pars.find(".item-name a").attr("href",links);
        pars.find(".item-comment-dispatching a").attr("href",links+"#gm-other-info");
        pars.find(".add-cart").attr("skuid",nSid);
        pars.find(".add-collection").attr("skuid",nSid);
        _o.addClass("current").siblings("li").removeClass("current");
        //价格和促销信息写在demo里，只第一次触发的时候请求
        productInfoObj.attr("skuno",nskuNo);
        productInfoObj.attr("skuid",nSid);
       
        if(_o.hasClass('already')){
            pars.find(".asynPrice").text("¥"+_o.find(".icon-li-price").html());
            pars.find(".item-promotion").html(_o.find(".icon-li-promotion").html());
            pars.find(".asynPrice").attr("skuid",nSid);
            productInfoObj.attr("skuid",nSid);
        }else{
            $("#product-box").undelegate(".icon-li","mouseenter");
            pars.find(".asynPrice").attr("skuid",nSid);               
            $priceDom = pars.find(".asynPrice"),
            $buyMode = pars.hasClass("taoStyle")?"suit":"single";
            var _index = new Date().getTime()+_o.index();
            $.ajax({
                type:"get",
                url:["//ss"+cookieDomain,"search/v1/price/"+$buyMode,$priceDom.attr("pid"),$priceDom.attr("skuid"),pageData.regionId_2,"flag/item","fn"+ _index].join("/"),
                dataType:"jsonp",
                jsonpCallback:"fn"+ _index,
                success:function(data){
                    if(data && data.success){
                        _o.find(".icon-li-price").html(data.result.price?data.result.price:"暂无售价");
                        pars.find(".asynPrice").text(data.result.price?"¥"+data.result.price:"暂无售价");
                        productInfoObj.attr("price",data.result.price?data.result.price:"暂无售价");
                        
                        if(productInfoObj.attr("salestype") =="true"){//联营促销信息
                                var lyarr=[];                           
                                if(!productInfoObj.attr("appointment") && !productInfoObj.attr("tuanqiang")){//排除团抢和预约
                                    var lyobj={};
                                    if(productInfoObj.attr("skuNo") !="" && productInfoObj.attr("skuNo") !=undefined && productInfoObj.attr("price") !="" && productInfoObj.attr("price") !=undefined && productInfoObj.attr("price") != "暂无售价"){
                                        lyobj.sku =productInfoObj.attr("skuNo");
                                        lyobj.price =productInfoObj.attr("price");
                                        lyarr.push(lyobj);
                                    }else{
                                        pars.find(".item-promotion").html("");
                                    }
                                    if(lyarr.length >0){
                                        $.ajax({
                                            type:"get",
                                            traditional:true,
                                            //url:"//10.144.48.19:8282/promotion/promotionLabels",
                                            url:cookieDomain==='.gome.com.cn'?'//npop-front.gome.com.cn/promotion/promotionLabels':'//interfaceuat.coupon.coo8.com/promotion/promotionLabels',
                                            data:{"param":JSON.stringify(lyarr)},
                                            dataType:"jsonp",
                                            //jsonpCallback:"callback"+_index,
                                            success:function(data){
                                                if(data.success){
                                                    var _data=data.data;
                                                    var promotionHtml ="";
                                                    for(var key in _data) {
                                                        for(var i=0;i<_data[key].length;i++){
                                                            if(_data[key][i].promLabelPC){
                                                                promotionHtml +='<span class="promotion-normal">'+_data[key][i].promLabelPC+'</span>'
                                                            };
                                                        }
                                                    }
                                                    _o.find(".icon-li-promotion").html(promotionHtml);
                                                    pars.find(".item-promotion").html(promotionHtml);
                                                }
                                            },
                                            error:function(){
                                                // alert('error')
                                            }
                                        })
                                    }
                                }
                        }else{//自营促销信息
                            var zyarr=[];
                            if(!productInfoObj.attr("appointment") && !productInfoObj.attr("tuanqiang")){//排除团抢和预约
                                var zyobj={};
                                if(productInfoObj.attr("skuid") !="" && productInfoObj.attr("skuid") !=undefined && productInfoObj.attr("skuType") !="" && productInfoObj.attr("skuType") !=undefined && productInfoObj.attr("thirdCat") !="" && productInfoObj.attr("thirdCat") !=undefined && productInfoObj.attr("brandCode") !="" && productInfoObj.attr("brandCode") !=undefined && productInfoObj.attr("price") !="" && productInfoObj.attr("price") !=undefined && productInfoObj.attr("price") != "暂无售价"){
                                    zyobj.skuId =productInfoObj.attr("skuid");
                                    zyobj.unitPrice =productInfoObj.attr("price");
                                    zyobj.site ="homeSite";
                                    zyobj.areaCode =pageData.regionId_2;
                                    zyobj.skuType =productInfoObj.attr("skuType");
                                    zyobj.categoryId =productInfoObj.attr("thirdCat");
                                    zyobj.brandCode =productInfoObj.attr("brandCode");
                                    zyarr.push(zyobj);
                                }else{
                                    pars.find(".item-promotion").html("");
                                }
                            }
                            if(zyarr.length >0){
                                $.ajax({
                                    type:"get",
                                    traditional:true,
                                    url:"//pl"+cookieDomain+"/promLabel/getPromLabels.do",
                                    data:{"json":JSON.stringify(zyarr)},
                                    dataType:"jsonp",
                                    //jsonpCallback:"callback"+_index,
                                    success:function(data){
                                        if(data.success){
                                            var _data=data.data;
                                            var promotionHtml ="";
                                            for(var key in _data) {
                                                for (var i = 0; i < _data[key].length; i++) {
                                                    if (_data[key][i].promLabelPC) {
                                                        promotionHtml += '<span class="promotion-normal">' + _data[key][i].promLabelPC + '</span>'
                                                    }
                                                    ;
                                                }
                                            }
                                            _o.find(".icon-li-promotion").html(promotionHtml);
                                            pars.find(".item-promotion").html(promotionHtml);
                                        }
                                    }
                                })
                            }
                        };
                        _o.addClass('already');
                        $("#product-box").delegate(".icon-li","mouseenter",mesgChange);
                    }
                }
            });
        }   
    }
    $("#product-box").delegate(".icon-li","mouseenter",mesgChange);
/*商品点击 搜索云埋码统计*/
$("#product-box").delegate(".item-link","click",function(){
    var element_info = $(this).parents(".product-item").find(".productInfo");
    require('../about/emcode/gateway').cloudClickMonitor(element_info);
    //trackProdClk(tracks, pId, catName, dsp_gome_c3id, isSearch);
});

/*
*商品划过 请求在线客服
*商品悬停3s 搜索云埋码统计
**/
var _onlieTimer = null;
var _loggerTimer = null;
$("#product-box").delegate(".product-item","mouseenter mouseleave",function(e){
    var $this = $(this),
        element_info = $this.find(".productInfo");
    if($this.hasClass("product-ad") || $this.data("hasOnline")) return false;
    if (e.type == "mouseenter") {
        var getOnlineService = require('../function/getOnlineService');

        _onlieTimer = setTimeout(function(){
            $this.data("hasOnline",true);
            if(element_info.attr("thirdProduct") == "0"){
                getOnlineService.selfsell(element_info.attr("cateId"),element_info.attr("brandIds")).done(function(data){
                    var $robotClass = data.flagMark?" online-robot":"";
                    $this.find(".gomekf").html($('<a href="javascript:void(0)" title="咨询小美" class="online-server'+$robotClass+'"><i class="icon"></i></a>').data("customer",{
                        customerHost:data.customerHost,
                        customerID:data.customerID,
                        customerInfo:data.customerInfo,
                        shopName:"",
                        flag:data.flagMark || ""
                    }))
                });
            }else{
                getOnlineService.thirdsell(element_info.attr("shopId")).done(function(data){
                    $this.find(".gomekf").html($('<a href="javascript:void(0)" class="online-server" title="在线客服"><i class="icon"></i></a>').data("customer",{
                        customerHost:data.customerHost,
                        customerID:data.customerID,
                        customerInfo:data.customerInfo,
                        shopName:element_info.attr("shopName"),
                        flag:""
                    }))
                });
            }
        },1000);

        _loggerTimer = setTimeout(function(){
            require('../about/emcode/gateway').cloudClickMonitor(element_info,true);
        },3000);
    }else if(e.type == "mouseleave") {
        clearTimeout(_onlieTimer);
        clearTimeout(_loggerTimer)
    } else {}
});

$("#product-box").delegate(".online-server", "click", function() {
    var $this = $(this);
    var customerData = $this.data("customer");
    window.open(
        customerData.customerHost+'/chatClient/chatbox.jsp?companyID='+customerData.customerID+'&customerID='+customerData.customerID+
        '&info='+customerData.customerInfo+'&page=0&enterurl='+window.location.href+'&areaCode='+pageData.regionId+'&shopname='+ encodeURI(customerData.shopName)+
        '&customerService=' + customerData.customerID+',toolbar=0,scrollbars=0,location=0,menubar=0,resizable=1,width=1120,height=700'+customerData.flag
    );
});
