/**
 * 根据cookie--proid120517atg 请求前台组获取最近浏览商品信息
 * pagename 接口标识，判断请求来源
 * */
var tpl = '{{each result as value}}\
            <li class="item">\
                <p class="pic"><a href="{{value.url}}" target="_blank"><img gome-src="{{value.pic}}" src="//img.gomein.net.cn/images/grey.gif"></a></p>\
                <p class="name"><a href="{{value.url}}" target="_blank">{{value.name}}</a></p>\
                <p class="price">¥<span>{{value.price}}</span></p>\
            </li>\
        {{/each}}';
function getData(pagename,domId){
    var product_id = $.cookie("proid120517atg");
    if(product_id == null || product_id ==""){return false;}

    $.ajax({
        type:"get",
        dataType:"jsonp",
        url:"//ss"+window.cookieDomain+"/item/v1/browse/prdreturn/"+$.parseJSON(product_id).join(",")+"/80/flag/"+window.pagename+"/recentViewed",
        jsonpName:"recentViewed"
    }).done(function(data){
        if(data.success && data.result.length>0){
            var listTpl = templateSimple.compile(tpl)(data);
            $(domId).html('<dl class="nSearch-recentVisit"><dt class="hd">最近浏览</dt><dd class="bd"><ul class="recentVisit-lists clearfix" id="recentVisit-lists" modelid="9000002000">'+listTpl+'</ul></dd></dl>');
        }
    }).fail(function(){
        console.log("请求失败")
    });
}
module.exports = {
    getData:getData
}

