var tpl = '{{each lst as value}}\
    <li class="buy-items">\
        <div class="item-pic"><a class="bigD_item" track="{{value.maima_param}}" href="{{value.purl}}" target="_blank"><img gome-src="{{value.iurl}}" src="//img.gomein.net.cn/images/grey.gif"></a></div>\
        <div class="item-name"><a class="bigD_item" track="{{value.maima_param}}" href="{{value.purl}}" target="_blank">{{value.pn}}</a></div>\
        <div class="item-price"><b>¥{{value.price}}</b></div>\
    </li>\
{{/each}}'
function getData(domId){
$.get(
    dspData.url.bigdata_url,
    {
        boxid: "box05",
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
            var _length = data.lst.length;
            $(domId).append('<dl class="nSearch-bottom-advertisement" id="nSearch-quessYouLike"><dt class="hd"><span id="quessYouLike-refresh" class="bottom-advertisement-refresh" curp="0">换一组</span>根据浏览猜你喜欢</dt><dd class="bd"><ul class="bottom-advertisement-lists clearfix" id="bigD_quessLike">' + listTpl + '</ul></dd></dl>');

            if (_length <= 6) {
                $("#quessYouLike-refresh").hide()
            }
            var totlnum = (_length % 6 == 0) ? (parseInt(_length / 6, 10) - 1) : parseInt(_length / 6, 10);
            var _i = 0;
            $("#bigD_quessLike").find(".buy-items").each(function () {
                if ($(this).index() < 6) {
                    $(this).addClass("cShow");
                }
                $(this).addClass("item" + parseInt($(this).index() / 6, 10))
            })
            $("#quessYouLike-refresh").bind("click", function () {
                $("#bigD_quessLike").find(".buy-items").removeClass("cShow");
                if (_i++ == totlnum || _i == 3) {
                    _i = 0;
                }
                $("#bigD_quessLike").find(".item" + _i).addClass("cShow")
            })
        }
    },
    "jsonp"
);
}
module.exports = {
    getData:getData
}