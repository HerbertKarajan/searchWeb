var tpl = '{{each lst as value index}}\
    <li class="active">\
        <p class="num {{if index<3}}num1{{else}}num2{{/if}}">{{index+1}}</p>\
        <p class="pname"><a class="bigD_item" track="{{value.maima_param}}" href="{{value.purl}}" target="_blank">{{value.pn}}</a></p>\
        <div class="pdetail">\
            <p class="pic"><a class="bigD_item" track="{{value.maima_param}}" href="{{value.purl}}" target="_blank"><img gome-src="{{value.iurl}}" src="//img.gomein.net.cn/images/grey.gif"></a></p>\
            <p class="name"><a class="bigD_item" track="{{value.maima_param}}" href="{{value.purl}}" target="_blank">{{value.pn}}</a></p>\
            <p class="price"><em>¥<span>{{value.price}}</span></em></p>\
        </div>\
    </li>\
{{/each}}';
function getData(domId){
    $.get(
        dspData.url.bigdata_url,
        {
            boxid: "box03",
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
                var listTpl = templateSimple.compile(tpl)(data);
                $(domId).append('<div class="prd-right-normal"><h3 class="hd">一周销量排行榜</h3><ul class="sell-product" id="bigD_weekTop">'+listTpl+'</ul></div>');
            }
        },
        "jsonp"
    );
}
module.exports = {
    getData:getData
};