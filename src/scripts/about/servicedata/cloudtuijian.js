/**
 * pagename 接口标识，判断请求来源
 * */

var tpl_list = '\
<div class="hot-cuxiao-list-box">\
    <span class="icon_tj">促销<br>活动</span>\
    <ul class="hot-cuxiao-list" id="hot-cuxiao-list">\
    {{each activity as value}}\
        <li><i></i><a href="{{value.url}}" target="_blank" data-code="9000000001-{{index+1}}">{{value.title}}</a></li>\
    {{/each}}\
    </ul>\
</div>'

var tpl_item = '\
{{each products as value}}\
<li class="item asynPriceBox" from="云眼">\
<p class="pic"><a target="_blank" href="{{value.sUrl}}" title="{{value.alt}}" data-code="9000000000-{{index}}"><img src="{{value.sImg}}" alt=""></a></p>\
<p class="name"><a target="_blank" href="{{value.sUrl}}" title="{{value.alt}}" data-code="9000000000-{{index}}">{{value.name}}</a></p>\
<p class="price asynPrice" pid="{{value.id}}" skuid="{{value.skuId}}"><span></span></p>\
<p class="btn"><a target="_blank" class=" buy" href="{{value.sUrl}}" data-code="9000000000-{{index}}">立即抢购</a></p>\
</li>\
{{/each}}'

function getData(){
    $.ajax({
        type:"get",
        dataType:"jsonp",
        url:"//apis"+window.cookieDomain+"/p/hotRecommend",
        jsonpName:"recentViewed",
        data:{module:"recommendActivity",from:"recommend",catId:dspData.dsp_gome_c3id}
    }).done(function(data){
        if (data.activity.length>4){
            var listTpl_a = templateSimple.compile(tpl_list)(data);
            $(".hot-tj").append(listTpl_a)
        }
        if(data.products.length>3){
            var listTpl_b = templateSimple.compile(tpl_item)(data);
            $("#hot-list").append(listTpl_b)
        }else{
            if(isHyg){
                require("../bigdata/mcategory/bigdata.recommend").getData("#hot-list")
            }else{
                require("../bigdata/category/bigdata.recommend").getData("#hot-list")
            }
        }

    }).fail(function(){
        console.log("请求失败")
    });
}
module.exports = {
    getData:getData
};

