function getData(domId){
    $.ajax({
        type:"get",
        dataType:"jsonp",
        url:dspData.url.flight_url+"/flight",
        data:{
            //"slotId":10281,
            "slotId":10086,
            "requestType":3
        },
        jsonpName:"dsp_act_b",
        success:function(data){
            var _content = data[0].adContents || [];
            var listTpl = "";
            var _loopData = {};
            if(_content.length == 0) return;
            
            for(var i=0,j=_content.length;i<j && i<2;i++){
                _loopData = JSON.parse(_content[i].content)
                listTpl += '<a href="'+_loopData.clickUrl+'" target="_blank"><img src="//img.gomein.net.cn/images/grey.gif" gome-src="'+_loopData.resourceUrl+'"/></a>';
                new Image().src= _loopData.impressionUrl;
            }
            $(domId).append('<div class="nSearch-bottomTuiGuangAD" id="dsp_bottomAD">'+listTpl+'</div>');
        }
    });
}
module.exports = {
    getData:getData
}