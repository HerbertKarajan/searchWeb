/**
 * 页面级事件，
 * 【一】1.5s定时器,，异步价格盒子asynPriceBox，
 *  (1)获取可视区域内图片，设置src地址
 *  (2)获取可视区域内asynPriceBox盒子，异步获取价格信息，成功调用setAsynPriceBox方法设置相关信息
 *      a,asynPriceBox盒子包括：主体商品，列表页顶部热卖推荐商品（from云眼），底部对比商品，底部最近浏览商品
 */
define(function(require,exports,module){
var getScreenDom = require("../function/getScreenDom");
var itemType = {
    GOMEPRICE:"normal",
    SALEPRICE:"normal",
    AREAPRICE:"normal",
    AREASALEPRICE:"normal",
    TUANPRICE:"tuangou",
    RUSHBUYPRICE:"qianggou"
};
/**
 * [setAsynPriceBox 设置异步价格盒子内方法]根据获取的价格类型重新定义.item-link点击跳转地址，.addTo-cart加入购物车地址，价格标签
 * @param  {[type]} data    [请求的价格相关数据]
 * @param  {[type]} asynPriceBox [异步价格节点]
 */
/***/
function setAsynPriceBox(data,asynPriceBox){
    var _url = "",
        _hash = "",
        propTag = "";
    switch(itemType[data.priceType]){
        case "normal":
            _url = "//item"+cookieDomain+"/"+data.productId+"-"+data.skuId+".html";
            _hash = "#gm-other-info";
            break;
        case "tuangou":
        case "qianggou":
            //_url = "//tuan"+cookieDomain+"/deal/"+data.promotionUrl+".html";
            _url = "//item"+cookieDomain+"/"+data.productId+"-"+data.skuId+".html";
            _hash = "#j-comment-section";
            asynPriceBox.parents('li').find(".productInfo").attr("tuanqiang",true);
            var addCart = asynPriceBox.find(".addTo-cart"),
                cartDataCode = addCart.attr("data-code");
            addCart.undelegate().replaceWith('<a class="add-cart" href="'+_url+'" title="加入购物车" target="_blank" data-code="'+cartDataCode+'"><i class="icon"></i></a>');
            break;
        default:
            break;
    }

    /**
     * 比价需求临时下线10.31
     if(data.smartbuy){
        var dataSmart = data.smartbuy
        var jdDefalut = dataSmart.jingdongPrice?'比京东低'+dataSmart.jingdongLower+'元':'比苏宁低'+dataSmart.suningLower+'元';
        var jdShow = dataSmart.jingdongPrice?'<p>京东价：<span>¥'+dataSmart.jingdongPrice+'</span>比京东低'+dataSmart.jingdongLower+'元</p>':'';
        var snShow = dataSmart.suningPrice?'<p>苏宁价：<span>¥'+dataSmart.suningPrice+'</span>比苏宁低'+dataSmart.suningLower+'元</p>':'';
        var compareHtml = ['<div class="sb-item-price-warp"><ul class="sb-item-price"><li class="defaultLi"><span>¥',data.price,'</span>',jdDefalut,'</li><li class="otherLi">',jdShow,snShow,'</li><li><p class="ti">比价时间：'+dataSmart.smartdate+'</p></li></ul><i class="tiger"></i></div>'].join("");
        priceBox.empty().html(compareHtml)
     }else{
        priceBox.find(".price").text("¥"+data.price)
     }
     */

    if(itemType[data.priceType] == "tuangou"){
        propTag+='<span class="promotion-normal">团购价</span>'
    }else if(itemType[data.priceType] == "qianggou"){
        propTag+='<span class="promotion-normal">抢购价</span>'
    }
    /*if(data.smartbuy){
     propTag+='<span class="promotion-normal">享优惠</span>'
     }*/

    asynPriceBox.find(".asynPrice").text(data.price?"¥"+data.price:"暂无售价").after(propTag);
    if(_url !=""){
        asynPriceBox.find(".item-link").attr("href",_url);
        asynPriceBox.find(".comment").attr("href",_url+_hash);
    };
    asynPriceBox.parents("li").find(".productInfo").attr("price",data.price?data.price:"暂无售价");

}
setInterval(function(){
    var $windows = $(window);
    var areaBottom = $windows.scrollTop() + $windows.height() +300;
    var areaTop = $windows.scrollTop()-300;

    var screenItem = getScreenDom(".asynPriceBox",areaTop,areaBottom);
    var screenImg = getScreenDom(".nSearchWarp img",areaTop,areaBottom);
    //var screenLiitem = getScreenDom(".product-item",areaTop,areaBottom);

    if(screenImg.length > 0){
        $.each(screenImg,function(i){
            $(this).attr("src",$(this).attr("gome-src"));
        })
    };

    if(screenItem.length > 0){
        var dtd = $.Deferred();// 新建一个deferred对象
        var wait = function(){
            var count =0;
            $.each(screenItem,function(i){
                var $dom = $(this),
                    $priceDom = $(this).find(".asynPrice"),
                    $buyMode = $(this).hasClass("taoStyle")?"suit":"single";
                var _index = new Date().getTime()+i;
              $.ajax({
                    type:"get",
                    url:["//ss"+cookieDomain,"search/v1/price/"+$buyMode,$priceDom.attr("pid"),$priceDom.attr("skuid"),pageData.regionId_2,"flag/item","fn"+ _index].join("/"),
                    dataType:"jsonp",
                    jsonpCallback:"fn"+ _index,
                    success:function(data){
                        if(data && data.success){
                            setAsynPriceBox(data.result,$dom);
                            count++;
                            if(count == screenItem.length){
                                dtd.resolve();
                            }
                        }else{
                            $dom.data("success",false);
                        }
                    }
                });

            });
            return dtd;
        };
        $.when(wait(dtd)).done(function(){
            var zyarr=[],
                lyarr=[];
           // var _index = new Date().getTime();
            //促销标签请求
            //促销标签
            $.each(screenItem,function(i){
                var productInfoObj =$(this).parents('li').find(".productInfo");
                if(productInfoObj.attr("salestype") =="true"){//联营
                    if(!productInfoObj.attr("appointment") && !productInfoObj.attr("tuanqiang")){//排除团抢和预约
                        var lyobj={};
                        if(productInfoObj.attr("skuNo") !="" && productInfoObj.attr("skuNo") !=undefined && productInfoObj.attr("price") !="" && productInfoObj.attr("price") !=undefined && productInfoObj.attr("price") != "暂无售价"){
                            lyobj.sku =productInfoObj.attr("skuNo");
                            lyobj.price =productInfoObj.attr("price");
                            lyarr.push(lyobj);
                        }
                    }
                }else{//自营
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
                        }
                    }

                }
            });
            //屏蔽联营
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
                            for(var key in _data){
                                $.each(screenItem,function(){
                                    var $dom =$(this).parents("li");
                                    if($dom.find(".productInfo").attr("skuno") == key){
                                        var promotionHtml ="";
                                        for(var i=0;i<_data[key].length;i++){
                                            if(_data[key][i].promLabelPC){
                                                promotionHtml +='<span class="promotion-normal">'+_data[key][i].promLabelPC+'</span>'
                                            };
                                        }
                                        $dom.find(".item-promotion").html(promotionHtml);
                                        if($dom.find(".item-promotion .promotion-normal").eq(0).width() > 210){
                                            $dom.find(".item-promotion .promotion-normal").eq(0).css("margin-top","20px");
                                        }
                                    }
                                });
                            }
                        }
                    },
                    error:function(){
                        // alert('error')
                    }
                })
            };

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
                            for(var key in _data){
                                $.each(screenImg,function(){
                                    var $dom =$(this).parents("li");
                                    if($dom.find(".productInfo").attr("skuid") == key){
                                        var promotionHtml ="";
                                        for(var i=0;i<_data[key].length;i++){
                                            if(_data[key][i].promLabelPC){
                                                promotionHtml +='<span class="promotion-normal">'+_data[key][i].promLabelPC+'</span>'
                                            };
                                        }
                                        $dom.find(".item-promotion").html(promotionHtml);
                                    }
                                });
                            }
                        }
                    }
                })
            }
        });
    };
},1000);
});
