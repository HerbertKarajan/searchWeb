var tpl_normal = require("../template.bigdata.normal").tpl;
function getData(domId){
    $.get(
        dspData.url.bigdata_url,
        {
            boxid: "box02",
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
                data.lst.splice(5,data.lst.length)
                var listTpl = templateSimple.compile(tpl_normal)(data);
                $(domId).append('<div class="prd-right-normal"><h3 class="hd">浏览此类商品的用户最终买了</h3><ul class="bd" id="bigD_liulan">'+listTpl+'</ul></div>');
            }
        },
        "jsonp"
    );
}
module.exports = {
    getData:getData
}