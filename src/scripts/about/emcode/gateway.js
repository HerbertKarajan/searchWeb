/**
 * 搜索组埋码事件
 * 【1】商品点击埋码
 * 【2】页面访问量监控
 * */

/*搜索组页面监控*/


function getPrevItemInfo(i){
    var prevItemInfo = [];
    $("#product-box").find(".productInfo").each(function(index,elem){
        var $this = $(elem);
        if(index < parseInt(i)){
            prevItemInfo.push($this.attr("pid")+"-"+$this.attr("skuid"))
        }else{
            return false;
        }
    });
    return JSON.stringify(prevItemInfo)
}


module.exports = {
    googleMonitor_s:function(){
        setTimeout(function(){
            (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
            })(window,document,'script','//www.google-analytics.com/analytics.js','z_ga');
            z_ga('create', 'UA-44955382-1', 'gome.com.cn');
            z_ga('send', 'pageview');
            (function() {
                var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
                ga.src = ('https:' == document.location.protocol ? 'https://ssl' : '//www') + '.google-analytics.com/ga.js';
                var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
            })();
            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', 'UA-44955382-1']);
            _gaq.push(['_trackPageview',window.location.href]);
            _gaq.push(['_trackEvent', 'question', 'load', 'searchPage'])
            z_ga('ec:addPromo', {
                'id': 'gomeSearch',
                'name': 'gome 11.11'
            });
        },3000);
    },
    googleMonitor_c:function(){
        setTimeout(function(){
            (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
            })(window,document,'script','//www.google-analytics.com/analytics.js','z_ga');
            z_ga('create', 'UA-44955382-1', 'gome.com.cn');
            z_ga('send', 'pageview');
            (function() {
                var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
                ga.src = ('https:' == document.location.protocol ? 'https://ssl' : '//www') + '.google-analytics.com/ga.js';
                var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
            })();
            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', 'UA-44955382-1']);
            _gaq.push(['_trackPageview',window.location.href]);
            var p_categoryId = dspData.dsp_gome_c3id;
            _gaq.push(['_trackEvent', p_categoryId, 'load', 'catPage'])
            z_ga('ec:addPromo', {
                'id': 'gomeCat',
                'name': 'gome 11.11'
            });
        },3000);
    },
    cloudClickMonitor: function (element_info,isHover) {
        return $.ajax({
            type:"get",
            dataType:"jsonp",
            url:pageData.cloudSite + "/cloud/log",
            data:{
                module: "logger",
                ts:new Date().getTime(),
                t1:isHover?"1-"+element_info.attr("pid"):element_info.attr("pid"),
                t2:element_info.attr("skuname"),
                t3:element_info.attr("salesVolume"),
                t4:element_info.attr("thirdCat"),
                t5:loggerData.t5,
                t6:pageData.sort,
                t7:loggerData.t7,
                t8:loggerData.t8,
                t9:pageData.currentPage,
                t10:element_info.attr("prd-index"),
                t11:getPrevItemInfo(element_info.attr("prd-index")),//pid-skuid,pid-skuid,pid-skuid
                //t12:客户端ip,
                //t13:params.regionId,
                //t14:用户cookieid,
                t15:"",
                //t16:服务ip,
                //t17:userId,
                t18:element_info.attr("skuid"),
                t19:loggerData.t19,
                t20:loggerData.t20,
                t21:loggerData.t21,//?
                t22:loggerData.t22_s || loggerData.t22_r,
                t23:loggerData.t23,
                t24:element_info.attr("evaluateCount"),
                t25:element_info.attr("promoScore"),
                t26:element_info.attr("pStock"),
                t27:element_info.attr("pWeight"),
                t28:element_info.attr("price"),
                t29:element_info.attr("promoStock"),
                t30:element_info.attr("score"),
                t31:loggerData.t31,
                t32:loggerData.t32,
                t33:loggerData.t33,
                from:pageData.isSearch?"search":"category"
            }
        });
    }

};