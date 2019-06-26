/**
 * [description]
 * 工具栏具体点击事件
 * sort排序筛选项，地址选择，分页按钮-异步获取商品
 * 价格区间，在结果中搜索，特殊活动-跳转新页面
 * 初始化设置，特殊活动是否勾选，分页按钮置灰
 */
define(function(require,exports,module){
    /**
     * sort排序点击事件，使用function.getGoods模块获取商品
     * 【一】价格按钮前置绑定一次事件，设置价格高→低，低→高状态，修改本身sort值
     * 【二】绑定通用事件，修改pageData.sort，重置pageData.currentPage为1
     */
    $('#sort-price').bind('click', function (event) {
        if(!pageData.ajaxStatus){
            var _this = $(this);
            if(_this.attr('data-sort') === "21"){
                _this.attr('data-sort',"20").removeClass("price-down").addClass("price-up");
                _this.find("a").attr("href",_this.attr("prdurl1"));
                _this.find("a").attr("data-href",_this.attr("prdurl1"))
            }else{
                _this.attr('data-sort',"21").removeClass("price-up").addClass("price-down");
                _this.find("a").attr("href",_this.attr("prdurl2"));
                _this.find("a").attr("data-href",_this.attr("prdurl2"))
            }
        }
    });

	$('#filter-order-box li').bind('click', function (event) {
        var _this = $(this),
            sort_target = _this.attr('data-sort');
        if(pageData.sort !== sort_target && !pageData.ajaxStatus){
            pageData.ajaxStatus = true;
            _this.addClass('cur').siblings('.cur').removeClass('cur');
            pageData.sort = sort_target;
            pageData.currentPage=1;
           // pageData.ajaxURL = $(this).find('a').attr("href");
            pageData.ajaxURL = $(this).find('a').attr("data-href");
            if(!(_this.attr("id")=='sort-price')){//价格始终由低到高
                $('#sort-price').attr('data-sort',"21").removeClass("price-up").addClass("price-down");
            }
            if(window.pageName== "品牌商品页"){
                window.location.href = window.location.protocol+"//search"+cookieDomain+$(this).find('a').attr("data-href");
                return false;
            }
            //var _top = $("#product-left").offset().top;
            //$(window).scrollTop(_top);
            $('html, body').animate({
                scrollTop: $("#product-left").offset().top
            }, 1);
            pageData.isShowALL = false;
            require('../goods/getGoods').getGoods();
        }
    }).find('a').click(function(event){
        event.preventDefault();
    });
    //价格里的查看全部商品
    $(".product-showmore").on("click","a",function(event){
        event.preventDefault();
        pageData.ajaxURL = $(this).attr("href");
        pageData.isShowALL = true;
        require('../goods/getGoods').getGoods();
    })
    /**
     * 分页点击事件，仅修改pageData.currentPage，使用function.getGoods模块获取商品
     * 【一】下一页
     * 【二】上一页
     */
    $("#mp-next").bind('click', function (event) {
        event.preventDefault();
        if(pageData.currentPage >= pageData.totalPage || pageData.ajaxStatus){
            return false;
        }else{
            pageData.ajaxStatus = true
        }
        pageData.currentPage++;

        var fnTop = require('../goods/getGoods').goodsTop;
        require('../goods/getGoods').getGoods(fnTop);
    });
    $("#mp-prev").bind('click', function (event) {
        event.preventDefault();
        if(pageData.currentPage == 1 || pageData.ajaxStatus){
            return false;
        }else{
            pageData.ajaxStatus = true
        }
        pageData.currentPage--;

        var fnTop = require('../goods/getGoods').goodsTop;
        require('../goods/getGoods').getGoods(fnTop);
    });
    /**
     * 特殊活动筛选
     * 【一】初始换筛选标签是否勾选
     * 【二】绑定点击事件，调用function.makeHelf模块处理跳转地址*/
    (function(){
        var url = window.location.href;
        if(url.indexOf("promoFlag=1") > 0 || url.split("-")[10] == 1){
            $("#specialScreening").addClass("checke");
        }
    })();
    $("#specialScreening").bind("click",function(){
        if($(this).hasClass("checke")){
            promoFlagVal = 0;
        }else{
            promoFlagVal = 1;
        }
        require('../function/makeHelf').dofacet('promoFlag',promoFlagVal);
    });
    $(window).bind("scroll",function(){
        var productLeftOffsetTop = $("#product-left").offset()!=null?$("#product-left").offset().top:0;
        if($(document).scrollTop() >= productLeftOffsetTop){
            $("#filter-box").addClass("onfixed");
        }else{
            $("#filter-box").removeClass("onfixed");
        }
    });
});