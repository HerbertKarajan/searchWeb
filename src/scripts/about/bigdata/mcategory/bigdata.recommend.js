/**
 * 列表页面 顶部热销推荐
 * 请求条件，搜索云眼配置的商品少于3个时
 */
var tpl_item = '\
{{each lst as value}}\
    <li class="item">\
        <p class="pic">\
            <a target="_blank" href="{{value.purl}}" title="{{value.pn}}"><img src="{{value.iurl}}" alt="{{value.pn}}"></a>\
        </p>\
        <p class="name">\
            <a target="_blank" href="{{value.purl}}" target="_blank" title="{{value.pn}}">{{value.pn}}</a>\
        </p>\
        <p class="price">¥<span>{{value.price}}</span></p>\
        <p class="btn"><a class="buy" target="_blank" href="{{value.purl}}">立即抢购</a></p>\
    </li>\
{{/each}}\
'
function getData(domId){
    $.get(
        dspData.url.bigdata_url,
        {
            boxid: "box55",
            area: pageData.regionId,
            cid: $.cookie("__clickidc"),
            imagesize: 160,
            c1n: dspData.dsp_gome_c1name,
            c3n: dspData.dsp_gome_c3name,
            c1id: dspData.dsp_gome_c1id,
            c3id: dspData.dsp_gome_c3id,
            brid: dspData.dsp_gome_brid
        },
        function(data){
            if (data.lst && data.lst.length > 0) {
                var listTpl = templateSimple.compile(tpl_item)(data);
                $(domId).append(listTpl);
            }
        },
        "jsonp"
    );
}
module.exports = {
    getData:getData
}