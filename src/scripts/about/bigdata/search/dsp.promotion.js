var tpl_normal = require("../template.dsp.normal").tpl;
$.ajax({
    type:"get",
    dataType:"jsonp",
    url:dspData.url.dsp_url_s,
    data:{
        "p":10044,
        "catid":dspData.dsp_gome_c3id,
        "searchkey":pageData.searchkey,
        "c":"dsp_tg",
        "width_height":"210-210",
        "area":pageData.regionId,
        "requestType":3
    },
    jsonpName:"dsp_tg",
    success:function(data){
        var _dataShow = [];
        var data_left = {
            "data": data.splice(0,8)
        };
        var data_bottom = {
            "data": data.length >= 6?data.splice(0,6):[]
        };
        if(data_left.data.length > 0){
            var listTpl = templateSimple.compile(tpl_normal)(data_left);
            $("#prdRight-1").append('<div class="prd-right-normal"><h3 class="hd"><i class="dsp-tuiguangIdentifi">广告</i>店铺精选</h3><ul class="bd" id="dsp_tuiguang">'+listTpl+'</ul></div>');
            _dataShow = _dataShow.concat(data_left.data)
        }
        if(data_bottom.data.length > 0){
            var listTpl = templateSimple.compile(tpl_normal)(data_bottom);
            $("#prdBottom-1").append('<dl class="nSearch-bottomTuiGuang"><dt class="hd"><i class="dsp-tuiguangIdentifi">广告</i>推广商品</dt><dd class="bd"><ul class="clearfix" id="dsp_bottomTuiGuang">'+listTpl+'</ul></dd> </dl>');
            _dataShow = _dataShow.concat(data_bottom.data)
        }
        if (_dataShow.length > 0) {
            for(var i=_dataShow.length-1;i>=0;i--){
                new Image().src = _dataShow[i].pm;
            }
        }
    }
});