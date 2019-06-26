<#assign shopReq = shopObj.req>
<#assign quession = shopReq.question>

<#assign title = "${quession!}官网提供${quession!}大全及${quession!}官网报价-国美">
<#assign description ="国美$${quession!}官网提供${quession!}最新商品,查看最新${quession!}官网报价,网购就到国美${quession!}大全产品专区"  >
<#assign keywords = "${quession!},${quession!}大全, ${quession!}官网,${quession!}官网报价">

<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${title!}</title>
    <meta name="description" content="${description!}">
    <meta name="Keywords" content="${keywords!}">
    <link rel="shortcut icon" href="//app.gomein.net.cn/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href='${(storeConfiguration.stageCssServer)!}/??<!--# include virtual="/n/common/a18/css.html"-->'>

    <style type="text/css">
        /*统一样式*/
        body {
            color: #5e5e5e;
        }
        a {
            color: #404040;
            cursor: pointer;
            outline: 0 none;
            text-decoration: none;
        }
        .mb30{
            margin-bottom:30px;
        }
        /*店铺主体*/
        .store-wrap{
            width: 1200px;
            margin: 0 auto;
            position: relative;
        }
        .store-crumb{
            padding: 8px 0 8px 10px;
            border-bottom:1px solid #e6e6e6;
        }
        .store-crumb span{
            float: left;
            height: 22px;
            line-height: 22px;
            color: #5e5e5e;
        }
        .store-crumb .store-keyWord{
            padding: 0 10px;
            font-size: 14px;
            font-weight: bold;
            color: #cc0000;
        }
        .store-box .store-list{
            padding: 22px 0 27px 10px;
            border-bottom: 1px solid #e6e6e6;
        }
        .store-box .store-list .bottom-advertisement-lists{
            margin: 30px 25px 20px;
            display: none;
        }
        .store-box .store-list .bottom-advertisement-lists li{
            display: block;
        }
        .store-info{
            float: left;
            margin-top: 4px;
        }
        .store-info .store-info-logo{
            width: 100px;
            height: 30px;
            margin-right: 24px;
            float: left;
        }
        .store-info .store-info-logo img{
            width: 100%;
            height: 100%;
        }
        .store-info .store-info-name{
            height: 30px;
            float: left;
            margin-right: 5px;
            color: #5e5e5e;
            font: bold 14px/30px "Microsoft YaHei";
        }
        .store-info .store-info-name:hover{
            text-decoration: none;
            color: #e3101e;
        }
        .store-info .store-info-name em{
            color: #ff5757;
        }
        .store-info .store-info-type{
            width: 60px;
            height: 22px;
            border: 1px solid #ffd9dd;
            line-height: 22px;
            float: left;
            margin-top: 2px;
            color: #e3101e;
            text-align: center;
        }
        .store-score{
            width: 396px;
            float: right;
            text-align: center;
        }
        .store-score .store-score-list{
            float: left;
            padding-right: 15px;
            color: #909090;
        }
        .store-score .store-score-list span{
            width: 52px;
            display: inline-block;
            margin-right: 18px;
            float: left;
            font-family: "Microsoft YaHei";
        }
        .store-score-title span{
            height: 22px;
            line-height: 22px;
        }
        .store-score-num span{
            height: 12px;
            margin-top: -2px;
        }
        .store-score .store-enter{
            width: 94px;
            height: 24px;
            float: right;
            line-height: 24px;
            color: #fff;
            background: #ff5757;
            margin-top: 8px;
            font-family: "Microsoft YaHei";
        }
        .store-score .store-enter:hover{
            text-decoration: none;
            background: #f64949;
        }
        .store-score .store-score-list .store-title-diff,
        .store-score .store-score-list .store-num-diff{
            color: #5e5e5e;
            font-size: 13px;
            margin-right: 25px;
            font-weight: bold;
        }
        .store-score .store-score-list .store-num-diff{
            color: #e3101e;
        }

        /*为搜索到店铺样式*/
        .listmain {
            position: relative;
            background-color: #f8f8f8;
            border: 1px solid #e6e6e6;
            /*height: 258px;*/
            padding-left: 60px;
            padding-top: 15px;
            margin: 10px 0;
            padding-bottom: 15px;
        }
        .srabox {
            font: 700 14px/30px simsun;
        }
        .srabox span {
            color: #e3101e;
        }
        .listmain em {
            background: url(//css.gomein.net.cn/search/search2017/image/search.png) 0 -135px no-repeat;
            height: 41px;
            left: 15px;
            position: absolute;
            top: 8px;
            width: 41px;
        }

        /*底部搜索框*/
        .searchBox-bottom{
            display: none;
            clear: both;
            padding: 20px 0 10px 50px;
            margin: 10px 0;
            background-color: #F8F8F8;
        }
        .related-list{
            width: 500px;
            height: 32px;
            margin: 0 auto 10px;
            line-height: 32px;
            /*text-align: center;*/
            /*white-space: nowrap;*/
            overflow: hidden;
        }
        .related-title{
            *float: left;
            margin-right: -5px;
            vertical-align: middle;
            display: inline-block;
        }
        .related-key{
            *float: left;
            overflow: hidden;
            padding-right: 10px;
            vertical-align: middle;
            display: inline-block;
        }
        .related-key a{
            color: #a5a5a5;
            font-family: microsoft yahei
        }
        .related-key:last-child:after{
            display: none;
        }
        .search-box{
            width: 500px;
            height: 34px;
            margin: 0 auto;
            z-index:200;
        }
        .search-box-input{
            float: left;
            width: 425px;
            height: 28px;
            border: 2px solid #e3101e;
            color: #5e5e5e;
            font: 400 14px/28px "Arial";
            text-indent: 70px;
        }

        .searchBox-bottom #search-type-dropdown .search-type-list {
            left: 0
        }

        .searchBox-bottom #search-type-dropdown .search-type-item {
            width: 40px
        }
        .search-box-btn{
            float: left;
            width: 69px;
            height: 32px;
            background-color: #e3101e;
            text-align: center;
            color: #FFF;
            font: 400 16px/32px "microsoft yahei";
        }
        .search-box-btn:hover{
            color: #FFF;
            text-decoration: none;
        }
        #f-compare{
            overflow: hidden;
        }

        /*推广商品*/
        .nSearch-bottomTuiGuang{
            border:1px solid #e0e0e0;
            margin-bottom: 10px;
            display:none;
        }
        .nSearch-bottomTuiGuang .hd{
            padding: 0 10px;
            font: 400 15px/31px "microsoft yahei";
        }
        #dsp_bottomTuiGuang{
            height: 227px;
            margin: 0 28px 20px;
            overflow: hidden;
        }
        #dsp_bottomTuiGuang li {
            float: left;
            margin: 0 15px;
            width: 160px;
        }
        #dsp_bottomTuiGuang .pic{
            margin-bottom: 10px;
            overflow: hidden;
            text-align: center;
            width: 160px;
            height: 160px;
            font-size: 0;
        }
        .item-name a:hover,
        .name a:hover,
        .adver a:hover{
            text-decoration: none;
            color: #e3101e;
        }
        #dsp_bottomTuiGuang .pic img{ width:160px; height: 160px;}
        #dsp_bottomTuiGuang .dsp-tgImg img{ width:160px; height: 232px;}
        #dsp_bottomTuiGuang .price{
            font-weight: 700;
            color: #e3101e;
            font-size: 14px;
            margin-bottom: -57px;
            margin-top: 46px;
        }
        #dsp_bottomTuiGuang .name{
            height: 36px;
            line-height: 18px;
            overflow: hidden;
            word-break: break-all;
            word-wrap: break-word;
        }
        .dsp-tuiguangIdentifi {
            color: #ccc;
            float: right;
            font-size: 12px;
            padding-right: 8px;
        }
        #dsp_tuiguang .pic{ width: 160px; height: 160px;}
        #dsp_tuiguang img{ width: 160px; height: 160px;}
        #dsp_tuiguang .dsp-tgImg img{ width: 176px; height: 232px; }
        #dsp_advertisement a{ display: block; margin-bottom: 10px; width: 196px; overflow: hidden; border: 1px solid #e6e6e6}
        #dsp_advertisement img{ width: 198px; font-size: 0; height:auto;}

        .adver {
            background-color: #fff;
            color: #e3101e;
            height: 18px;
            margin-top: -18px;
            overflow: hidden;
            position: relative;
            text-align: left;
        }
        .adver a{
            color: #e3101e;
        }

        /*猜你喜欢*/
        .nSearch-bottom-advertisement{
            border:1px solid #e0e0e0;
            margin-bottom: 10px;
            display: none;;
        }
        .nSearch-bottom-advertisement .hd{
            padding: 0 10px;
            font: 400 15px/31px "microsoft yahei";
        }
        .bottom-advertisement-lists{
            margin: 0 28px 20px;
            height: 227px;
            overflow: hidden;
        }
        .bottom-advertisement-refresh{
            float: right;
            font-size: 12px;
            cursor: pointer;
        }
        .bottom-advertisement-refresh:hover{
            color: #e3101e;
        }
        .bottom-advertisement-refresh:after{
            content: " ";
            display: inline-block;
            width: 16px;
            height: 16px;
            margin:-2px 0 0 5px;
            vertical-align: middle;
            line-height: 31px;
            background: url(//css.gomein.net.cn/search/search2017/image/search.png) -35px -15px;
        }
        .bottom-advertisement-lists li{
            float: left;
            width: 160px;
            margin: 0 15px;
            *margin-left: 10px;
            *margin-right: 10px;
            _display:inline;
            display: none;
        }
        .bottom-advertisement-lists li.cShow{
            display: block;
        }
        .bottom-advertisement-lists .item-pic{
            width: 160px;
            margin-bottom: 10px;
            overflow: hidden;
            text-align: center;
        }
        .bottom-advertisement-lists .item-name{
            height: 36px;
            line-height: 18px;
            overflow: hidden;
            word-wrap:break-word;
            word-break:break-all;
        }
        .bottom-advertisement-lists .item-comment{
            float: right;
            color: #069;
            line-height: 20px;
            background: url(//css.gomein.net.cn/search/search2017/image/search.png) -51px 5px no-repeat;
            padding-left: 17px;
        }
        .bottom-advertisement-lists .item-price{
            color: #e3101e;
            font-size: 14px;
            font-weight:bold;
        }
        .bigD_item{
            color:#5e5e5e;
        }
        /*加载logo*/
        .product-waiting{
            position: absolute;
            left: 50%;
            top: 50px;
            margin: 0 0 -80px -40px;
            height: 80px;
            width: 80px;
            background: url("//img.gomein.net.cn/gmlib/ui/loading/3.0.0/loading.gif") no-repeat;
            z-index: 3;
            display: none;
        }

        /*分页插件样式*/
        .pager{float:right;height:32px;padding-top: 35px;margin-bottom: 30px;position:relative;margin-right: 19px;}
        .pager a,.pager span,.pager label,.pager button{float:left}
        .pager a,.pager span.cur{position:relative;min-width:4px;height:30px;margin:0 0 0 -1px;padding:0 13px;background:#FFF;border:1px solid #ddd;z-index:0;font:normal 12px/30px arial;color:#5e5e5e}
        .pager span.cur{background:#f8f8f8;border:1px solid #e6e6e6;color:#888;font-weight:500;text-decoration:none;z-index:10;color:#a5a5a5}
        .pager a:hover{color:#e3101e;text-decoration:none}
        .pager a.prev:hover,.pager a.next:hover{font-weight:normal;color:#e3101e;background:#fff}
        .pager s{position:absolute}
        .pager .prev{padding:0 8px 0 21px;font-size:12px;width:40px;}
        .pager .prev s{overflow:hidden;top:10px;left:10px;width:6px;height:10px;background:url(//css.gomein.net.cn/search/search2017/image/search.png) no-repeat -20px 0}
        .pager .disable .icon-prev{background-position:0 0}
        .pager .disable .icon-next{background-position:-10px 0}
        .pager .next{padding:0 21px 0 8px;font-size:12px;width:40px;}
        .pager .next s{overflow:hidden;top:10px;right:10px;width:6px;height:10px;background:url(//css.gomein.net.cn/search/search2017/image/search.png) no-repeat -30px 0}
        .pager .placeholder{overflow:hidden;width:16px;height:16px;margin:0 8px;border-bottom: 1px dotted}
        .pager .txt-wrap{margin:0 5px 0 10px;color:#959595;line-height:30px}
        .pager .txt{width:32px;height:18px;line-height:18px;margin:0 5px 0;padding:4px 0;border:1px solid #ccc;text-align:center;vertical-align:middle;color:#5e5e5e;}
        .pager .btn{width:42px;height:26px;line-height:28px;padding:0;background:#FFF;border:1px solid #ddd;color:#5e5e5e;text-align:center;cursor:pointer;margin-top:2px;background:#f8f8f8;font:normal 12px/26px}
        .pager .btn:hover{border:1px solid #ccc;color:#333}
        .pager .btn:active{background:#f3f3f3}
        .pager .disable{cursor:default;background:#f8f8f8;color:#ccc}
        .pager a.disable:hover{color:#ccc;background:#f8f8f8}
    /*品牌旗舰店*/
    .store-zjd{
    width:1200px;
    margin:10px auto;
    }
        .search-brand{
            overflow: hidden;
            margin-top: -1px;
        }
        .search-brand a:hover{
            text-decoration: none;
        }
        .search-brand .brand-info{
            border: 1px solid #ddd;
            padding: 10px 20px;
        }
        .search-brand .brand-info-logo{
            float: left;
            overflow: hidden;
            margin-right: 10px;
            margin-top: 6px;
        }
        .brand-info-logo img{
            width: 100px;
            height: 30px;
        }
        .brand-info-logo span{
            font-size: 24px;
        }
        .search-brand .brand-info-main{
            float: left;
            margin-top: 3px;
        }
        .search-brand .brand-info-main .title{
            color: #333;
            display: inline-block;
            font: 700 14px/18px "Microsoft YaHei";
            vertical-align: top;
        }
        .search-brand .gome-zy{
            background: #e4393c none repeat scroll 0 0;
            color: #fff;
            display: none;
            font-family: "Microsoft YaHei";
            height: 18px;
            line-height: 18px;
            text-align: center;
            width: 54px;
            margin-left: 5px;
            display: inline-block;
        }
        .search-brand .shop-name{
            margin-bottom: 5px;
        }
        .search-brand .shop-info span{
            color: #999;
        }
        .search-brand .brand-info-pj{
            float: right;
            width: 375px;
        }
        .search-brand .pj-score{
            float: left;
            width: 255px;
        }
        .search-brand .score-titl{
            height: 24px;
        }
        .search-brand .score-titl span,.search-brand .score-cont span{
            color: #999;
            font-weight: bold;
            width: 52px;
            display: inline-block;
            text-align: center;
            float: left;
            margin-right:10px;
        }
        .search-brand .score-titl span{
            font-family: "Microsoft YaHei";
        }
        .search-brand .score-cont span em{
            font-weight: bold;
            display: inline-block;
            vertical-align: top;
        }
        .search-brand .color-r{
            color: #e3101e;
        }
        .search-brand .color-g{
            color: #68b64c;
        }
        .search-brand .score-img{
            width: 7px;
            height: 9px;
            display: inline-block;
            *display: inline;
            zoom:1;
            *vertical-align: top;
            *margin-top: 5px;
            *margin-right:3px;
        }
        .search-brand .score-down{
            background: url(//css.gomein.net.cn/search/search2017/image/search.png) -35px -253px no-repeat ;
        }
        .search-brand .score-up{
            background: url(//css.gomein.net.cn/search/search2017/image/search.png) -45px -253px no-repeat;
        }
        .search-brand .shop-enter{
            margin-top: 10px;
        }
        .search-brand .shop-enter a{
            cursor: pointer;
            font-family: "Microsoft YaHei";
            font-size: 14px;
            padding: 6px 20px;
            background-color: #e3101e;
            color: #fff;
        }
        .search-brand .shop-enter a:hover{
            background-color: #D00;
        }
    </style>

    <!--# include virtual="/n/common/global/global.html"-->
</head>

<body data-page="shop">
<#--nginx  -->
<!--# include virtual="/n/common/a18/head.html"-->
<div id="store-warp" class="store-zjd"></div>
<div id="store-content" class="store-wrap">
    <div id="store-crumb" class="store-crumb clearfix">
        <span class="store-keyWord">${(shopReq.question)!}</span>
        <span class="store-num">
            共
            <em>${(shopObj.totalCount)!}</em>
            个店铺
        </span>
    </div>
    <div id="product-waiting" class="product-waiting"></div>
    <#--店铺主体-->
    <ul id="store-box" class="store-box" modelid="9000000002"></ul>
    <#--底部分页-->
    <div class="clearfix" id="product-pager">
        <div class="pager" id="j-page"></div>
    </div>
    <#---底部搜索框--->
    <div class="searchBox-bottom">
        <div class="search-box clearfix" modelid="9000000801" style="position:relative">
            <input type="text" class="search-box-input" id="search-box-input" value="${quession!}" defaultVal="${quession!}">
            <a href="javascript:void(0)" class="search-box-btn emcodeProp17" id="search-box-btn" data-code="9000000801-0">搜索</a>
            <div id="search-type-dropdown" class="search-type-dropdownbot">
                <div class="search-type" id="searchBotType">
                    <span class="search-type-selected" data-selected="">商品</span>
                    <i></i>
                </div>
                <ul class="search-type-list">
                    <li class="search-type-item" data-selector="goods">商品</li>
                    <li class="search-type-item" data-selector="shop">店铺</li>
                    <li class="search-type-item" data-selector="topic">话题</li>
                    <li class="search-type-item" data-selector="group">圈子</li>
                </ul>
            </div>
        </div>
        <ul class="related-list clearfix" id="related-list" modelid="9000000800"></ul>
    </div>
</div>
<div class="store-wrap">
    <#--推广商品-->
    <dl class="nSearch-bottomTuiGuang" id="nSearch-bottomTuiGuang">
        <dt class="hd"><i class="dsp-tuiguangIdentifi">广告</i>推广商品</dt>
        <dd class="bd">
            <ul class="clearfix" id="dsp_bottomTuiGuang">
            </ul>
        </dd>
    </dl>
    <#--猜你喜欢的商品-->
    <dl class="nSearch-bottom-advertisement" id="nSearch-quessYouLike">
        <dt class="hd"><span id="quessYouLike-refresh" class="bottom-advertisement-refresh" curp="0">换一组</span>根据浏览猜你喜欢</dt>
        <dd class="bd">
            <ul class="bottom-advertisement-lists clearfix" id="bigD_quessLike"></ul>
        </dd>
    </dl>
</div>

<!--# include virtual="/n/common/default/aside.html"-->
<!--# include virtual="/n/common/default/foot.html"-->
<script type="text/javascript">
    var searchkey = "${(shopObj.req.question)!}";
    <#if (shopObj.predictionCatId)??>
        var dsp_c3id ="${(shopObj.predictionCatId)!}";
    <#else>
        var dsp_c3id="";
    </#if>
</script>
<script src='${(storeConfiguration.stageJsServer)!}/??<!--# include virtual="/n/common/default/js.html"-->,/gmlib/unit/g/1.0.0/g.min.js,/gmlib/unit/cart/1.0.0/addCart.js,/gmlib/unit/gcity/1.0.0/gcity.min.js,/gmlib/unit/pager/1.0.0/pager.min.js'></script>
<script type="text/javascript">
    /*获取区域和用户id*/
    var pageData = {
        _bdarea: ($.cookie("atgregion") != undefined && $.cookie("atgregion") != null && $.cookie("atgregion") != "")?$.cookie("atgregion").split("|")[0]:"11010200",
        _cid: $.cookie("__clickidc")
    };
    /*店铺模板  shopTag:1 是联营  2 是自营*/
     var qjd_tpl = '\
    {{if banner}}\
    {{if banner.banner}}\
        <div class="search-brand">\
            <div class="brand-info clearfix" modelid="{{banner.banner.id}}">\
                <div class="brand-info-logo">\
                    <a data-code="9000000002-0" href="{{banner.banner.shopurl}}" target="_blank">\
                    {{if banner.banner.logo && banner.banner.logo !=""}}\
                    <img src="{{banner.banner.logo}}">\
                    {{else if banner.banner.brand.en}}\
                    <span class="color-r">{{banner.banner.brand.en}}</span>\
                    {{else}}\
                    <span class="color-r">{{banner.banner.brand.zh}}</span>\
                    {{/if}}\
                    </a>\
                </div>\
                <div class="brand-info-main">\
                    <div class="shop-name" style="margin-top:10px;">\
                        <a data-code="9000000002-1" href="{{banner.banner.shopurl}}" class="title" target="_blank">{{banner.banner.name}}</a>\
                        <span class="gome-zy">国美自营</span>\
                    </div>\
                </div>\
                <div class="brand-info-pj">\
                        <dl class="pj-score">\
                            <dt class="score-titl"><span>综合评价</span><span>商品描述</span><span>发货速度</span><span>服务质量</span></dt>\
                            <dd class="score-cont">\
                                    <span><em class="color-r">{{banner.banner.zhscore}}</em><i></i></span>\
                                    <span ><em class="color-r">{{banner.banner.prdscore}}</em></span>\
                                    <span><em class="color-r">{{banner.banner.srvscore}}</em></span>\
                                    <span><em class="color-r">{{banner.banner.tmsocre}}</em></span>\
                            </dd>\
                        </dl>\
                        <div class="shop-enter"><a data-code="9000000002-2" target="_blank" href="{{banner.banner.shopurl}}">进入店铺</a></div>\
                </div>\
            </div>\
        </div>\
    {{/if}}\
    {{/if}}\
    ';
    var shopPrd_list = '\
        {{each products as value}}\
        <li class="buy-items asynPriceBox">\
            <div class="item-pic"><a class="bigD_item" href="{{value.sUrl}}" target="_blank"><img gome-src="{{value.sImg}}_160.jpg" src="//img.gomein.net.cn/images/grey.gif"></a></div>\
            <div class="item-name"><a class="bigD_item" href="{{value.sUrl}}" target="_blank">{{value.name}}</a></div>\
            <div class="item-price asynPrice" pid="{{value.pId}}" skuid="{{value.skuId}}"><b></b></div>\
        </li>\
        {{/each}}\
    ';
    var store_tpl = '\
        {{each shopList as store i}}\
            <li class="store-list clearfix" shopId="{{store.shopId}}" already="false">\
            <div class="clearfix">\
                <div class="store-info">\
                    {{if store.shopTag == 1}}\
                    <a class="store-info-logo" href="//mall'+ cookieDomain +'/{{store.shopId}}" target="_blank" data-code="9000000002-{{i+1}}">\
                        <img src="{{store.icon}}" alt="">\
                    </a>\
                    <a class="store-info-name" href="//mall'+ cookieDomain +'/{{store.shopId}}" target="_blank" data-code="9000000002-{{i+1}}">{{store.name}}</a>\
                    {{else if store.shopTag == 2}}\
                    <a class="store-info-logo" href="//pinpai'+ cookieDomain +'/{{store.shopId}}/index.html" target="_blank" data-code="9000000002-{{i+1}}">\
                        <img src="{{store.icon}}" alt="">\
                    </a>\
                    <a class="store-info-name" href="//pinpai'+ cookieDomain +'/{{store.shopId}}/index.html" target="_blank" data-code="9000000002-{{i+1}}">{{store.name}}</a>\
                    {{/if}}\
                    {{if store.isSelf == 1}}\
                        <span class="store-info-type">国美自营</span>\
                    {{/if}}\
                </div>\
                <div class="store-score">\
                    <dl class="store-score-list">\
                        <dt class="store-score-title clearfix">\
                            <span class="store-title-diff">综合评价</span>\
                            <span>商品描述</span>\
                            <span>发货速度</span>\
                            <span>服务质量</span>\
                        </dt>\
                        <dd class="store-score-num clearfix">\
                            <span class="store-num-diff">{{store.score}}</span>\
                            <span>{{store.match}}</span>\
                            <span>{{store.speed}}</span>\
                            <span>{{store.serv}}</span>\
                        </dd>\
                    </dl>\
                    {{if store.shopTag == 1}}\
                    <a class="store-enter" href="//mall'+ cookieDomain +'/{{store.shopId}}" target="_blank" data-code="9000000002-{{i+1}}">进入店铺</a>\
                    {{else if store.shopTag == 2}}\
                    <a class="store-enter" href="//pinpai'+ cookieDomain +'/{{store.shopId}}/index.html" target="_blank" data-code="9000000002-{{i+1}}">进入店铺</a>\
                    {{/if}}\
                </div>\
            </div>\
            <ul class="bottom-advertisement-lists clearfix"></ul>\
            </li>\
        {{/each}}\
    ';

    /*
    ajax异步获取店铺信息
    _curPage：当前请求的页码
    _question：搜索关键词
    */
    function getStore(_curPage,_question) {
        $.get("//apis"+ cookieDomain + "/p/mall/10/"+ _curPage +"/" + _question +"?from=search",$.noop,"jsonp")
         .always(function() {
                    $("#product-waiting").hide();
        })
         .done(function(data) {
            if(data.shopList.length < 6){
                $(".searchBox-bottom").hide();
            }else{
                $(".searchBox-bottom").show()
            };
            if(data.totalCount != 0) {
                var listTpl = templateSimple.compile(store_tpl)(data);
                var qjdTpl = templateSimple.compile(qjd_tpl)(data);
                $("#store-box").empty().append(listTpl);
                $("#store-warp").empty().append(qjdTpl);

                if(data.totalPage > 1) {
                    pageGet(data.currentPage,data.totalPage,data.req.question);
                }
            }else {
                var noStore = '<div class="listmain">\
                    <div class="srabox">非常抱歉，没有找到与<span>'+_question+'</span>相关的店铺。</div>\
                    <em></em>\
                    </div>\
                    ';
                $("#store-content").empty().append(noStore);
            }
        });
    };
    /*底部分页插件调用*/
    function pageGet(_currentPage,_totalPage,_question) {
        $("#j-page").ucPager({
            pageClass: "",
            currentPage: _currentPage,
            totalPage: _totalPage,
            pageSize: 10,
            clickCallback: function(curPage) {
                $("#product-waiting").show();
                getStore(curPage,_question);
                $(window).scrollTop(0);
            }
        });
    };
    getStore(1,searchkey);

    /*底部搜索框数据渲染*/
    $.get('//search'+ cookieDomain + '/cloud/releQuery',{question: searchkey},$.noop,'jsonp')
    .done(function(data) {
        var headKeyword = "";
        var html = '';
        if (data.releData) {
            var _data = data.releData.rList;
            for (var i = 0, j = _data.length; i < j; i++) {
                html += '<li class="related-key"><a track="搜索结果页:相关搜索" class="emcodeProp17" href="/search?question=' + _data[i].key + '&from=releQuery" target="_blank" data-code="9000000800-'+(i+1)+'">' + _data[i].key + '</a></li>';
                headKeyword += '<a track="搜索结果页:相关搜索" href="/search?question=' + _data[i].key + '&from=releQuery" target="_blank">'+ _data[i].key +'</a>';
            }
            $("#topSearch .hotkeyword").empty().append(headKeyword);
            $("#related-list").append(html);
        } else {
            $("#related-list").hide();
        }
    });

    /*底部搜索按钮*/
    $("#search-box-input").bind({
        "keyup": function(event) {
            if (event.which == 13) {
                $("#search-box-btn").click()
            } else {
                if(!(/^[0-9.]*$/.test($(this).val()))) {
                    $(this).val($(this).val().replace(/[`~!@#$%^&*_+=¥￥（）()<>?:"{},\/;'[\]！。......，…——、‘；—【】|？》《“：\\\-”]/g,''));
                }
            }
        },
        "blur": function() {
            if ($(this).val() == "") {
                $(this).val($(this).attr("defaultVal"))
            }
        }
    });
    /*$("#search-box-btn").bind("click",function(){
        var dataPage = $("body").attr("data-page");
        var modelId = $(this).attr("data-code");
        window.location.href = "/search?intcmp="+dataPage+"-"+modelId+"&question="+ $("#search-box-input").val();
    });*/
    var $searchTypeDropdownbot = $('.search-type-dropdownbot'),//搜索类型下拉组件
            $searchBotType= $searchTypeDropdownbot.find('#searchBotType'),//搜索类型
            $searchTypeSelectedbot = $searchTypeDropdownbot.find('.search-type-selected'),//被选中的搜索值
            $searchTypeListbot = $searchTypeDropdownbot.find('.search-type-list'),//搜索类型List
            searchTypebotTimer;

    function showSearchType(){
        var self = this;
        var searchType = self.getQueryString('searchType');
        var keyword = '';

        switch(searchType){
            case 'group':
                keyword = self.getQueryString('word');
                if(keyword){
                    $searchTypeSelectedbot.text('圈子').attr('data-selected','group');
                    //self.$elem.val(keyword);
                }
                break;
            case 'topic':
                keyword = self.getQueryString('word');
                if(keyword){
                    $searchTypeSelectedbot.text('话题').attr('data-selected','topic');
                    //self.$elem.val(keyword);
                }
                break;
            case 'shop':
                keyword = self.getQueryString('shop');
                if(keyword){
                    $searchTypeSelectedbot.text('店铺').attr('data-selected','shop');
                    //self.$elem.val(keyword);
                }
                break;
            default:
                $searchTypeSelectedbot.text('商品').attr('data-selected','goods');
                keyword = self.getQueryString('question');
                if(keyword){
                    //self.$elem.val(keyword);
                }
        }
    };
    function getQueryString(name){
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if(r!=null){
            return decodeURI(r[2]);
        }
        return null;
    };
    showSearchType();
    $searchTypeListbot
            .on('click','li',function(){
                $searchTypeSelectedbot.text($(this).text()).attr('data-selected',$(this).attr('data-selector'));
                $searchTypeListbot.hide();
            });

    $searchTypeListbot.hover(function(){
        searchTypebotTimer && clearTimeout(searchTypebotTimer);
    },function(){
        $searchTypeListbot.hide();
    });

    //为选中的搜索类型绑定点击事件
    $searchBotType.hover(function(){
        $searchTypeListbot.show();
    },function(){
        searchTypebotTimer = setTimeout(function(){
            $searchTypeListbot.hide();
        },50);
    });
    //点击搜索
    $("#search-box-btn").click(function(){
        var currentTypebot = $searchTypeSelectedbot.attr('data-selected');
        var searchbotUrlObj = {
            goods: '//search'+cookieDomain+'/search?intcmp=shop-9000000801-0&question=',
            group: '//group'+cookieDomain+'/search/group?intcmp=shop-9000000801-0&word=',
            topic: '//group'+cookieDomain+'/search/topics?intcmp=shop-9000000801-0&word=',
            shop: '//search'+cookieDomain+'/search?intcmp=shop-9000000801-0&shop='
        };
        var inputbotKey = $("#search-box-input").val();
        if(currentTypebot === 'goods' && $.trim(inputbotKey) === ''){
            var defaultKey = $("#keyLabel").text();
            $("#search-box-input").val(defaultKey);
            inputbotKey = defaultKey;
        }
        if(inputbotKey.length>40){
            inputbotKey = inputbotKey.substring(0,40);
            $("#searchInput").val(inputbotKey);
        }
        if ($.trim(inputbotKey) !== '') {
            location.href = searchbotUrlObj[currentTypebot] + inputbotKey + '&searchType=' + currentTypebot;
        }
        return false;
    });

    /*
        底部大数据模块(推广商品和猜你喜欢)
        tpl_tuiguang：推广商品模板；
        tpl_quessLike：猜你喜欢模板；
    */
    var tpl_tuiguang = '\
        {{each data as value}}\
            <li class="buy-items">\
            {{if !(value.ds) && !(value.skuid) && !(value.productid)}}\
                <a class="dsp-tgImg" href="{{value.ldp}}" target="_blank"><img src="{{value.src}}"></a>\
            {{else}}\
                <div class="pic"><a href="{{value.ldp}}" target="_blank"><img src="{{value.src}}"></a></div>\
                <div class="price">¥<span>{{value.pr}}</span></div>\
                <div class="name"><a href="{{value.ldp}}" target="_blank">{{value.ds}}</a></div>\
                {{if value.adver}}<div class="adver">{{#value.adver}}</div>{{/if}}\
            {{/if}}\
            </li>\
        {{/each}}\
    ';
    if(typeof dsp_c3id!="undefined" && dsp_c3id !=""){
        $.ajax({
            type: "get",
            //url: "//dsp.gome.com.cn/decision/hotword",
            url: "//flight.gome.com.cn/flight",
            dataType: "jsonp",
            jsonpName: "tuiguang",
            data: {
                "p":10044,
                "catid":dsp_c3id,
                "searchkey":searchkey,
                "c":"tuiguang",
                "width_height":"210-210",
                "area": pageData._bdarea,
                "requestType":3
            }
        }).done(function(data) {
            if(data.length > 0){
                $("#nSearch-bottomTuiGuang").show();
                var _data = {data: data.splice(8)};
                var listTpl = templateSimple.compile(tpl_tuiguang)(_data);
                $("#dsp_bottomTuiGuang").append(listTpl);
                for(var i= 0,j=_data.data.length;i<j;i++) {
                    new Image().src = _data.data[i].pm;
                }
            }
        });
    }
    var tpl_quessLike = '\
        {{each lst as value index}}\
            {{if index<18}}\
                <li class="item">\
                    <p class="item-pic"><a class="bigD_item" track="{{value.maima_param}}" href="{{value.purl}}" target="_blank"><img src="{{value.iurl}}"></a></p>\
                    <p class="item-name"><a class="bigD_item" track="{{value.maima_param}}" href="{{value.purl}}" target="_blank">{{value.pn}}</a></p>\
                    <p class="item-price-comment"><b class="item-price">¥{{value.price}}</b></p>\
                </li>\
            {{/if}}\
        {{/each}}\
    ';
    if(typeof dsp_c3id!="undefined" && dsp_c3id !=""){
        $.get("//bigd.gome.com.cn/gome/rec",{boxid: "box92",area: pageData._bdarea,cid: pageData._cid,imagesize: 160,search: searchkey,c1id:"",c3id:dsp_c3id,brid: ""},function(data) {
            var listTpl = templateSimple.compile(tpl_quessLike)(data);//
            $("#nSearch-quessYouLike").show();
            $("#bigD_quessLike").append(listTpl);
        },"jsonp").then(function() {
            var _length = $("#bigD_quessLike").find(".item").length;
            if(_length<=6){$("#quessYouLike-refresh").hide()}
            var totlnum = (_length %6 ==0)?(parseInt(_length /6,10)-1):parseInt(_length /6,10);
            var _i = 0;
            $("#bigD_quessLike").find(".item").each(function(){
                if($(this).index()<6){
                    $(this).addClass("cShow");
                }
                $(this).addClass("item"+parseInt($(this).index()/6,10));
            });
            $("#quessYouLike-refresh").bind("click",function(){
                $("#bigD_quessLike").find(".item").removeClass("cShow");
                if(_i++ == totlnum || _i==3){
                    _i=0;
                }
                $("#bigD_quessLike").find(".item"+_i).addClass("cShow");
            });
        });
    }
    //增加店铺商品
    $("#store-box").on("mouseenter",".store-list",function(){
        var _this=$(this),
            already =$(this).attr("already"),
            shopId=$(this).attr("shopId"),
            liindex=$(this).index();

        if(already=="false" && shopId !=""){
            $.ajax({////apis.gome.com.cn/p/lshop/6/1/50/0/0/80013169/0/0?from=shopprodlist
                type: "get",
                url: "//apis"+cookieDomain+"/p/lshop/6/1/50/0/0/"+shopId+"/0/0?from=shopprodlist",
                dataType: "jsonp",
                jsonpName: "shoplist"+_this.index()
            }).done(function(data) {
                if(data.content.prodInfo){
                    _this.attr("already","true");
                    var _data = data.content.prodInfo;
                    var listTpl = templateSimple.compile(shopPrd_list)(_data);
                    _this.find(".bottom-advertisement-lists").empty().append(listTpl).show();
                }
                //价格和图片
                _this.find(".bottom-advertisement-lists li").each(function(index,elem) {

                    var _pid = $(elem).find(".item-price").attr("pid"),
                        _sid = $(elem).find(".item-price").attr("skuid"),
                        _gomesrc = $(elem).find(".item-pic img").attr("gome-src"),
                        bdarea_2 = $.cookie("atgregion")?$.cookie("atgregion").split("|")[2]:"11010000";

                    $(elem).find(".item-pic img").attr("src",_gomesrc);
                    $.ajax({
                        type: "get",
                        url:"//ss"+cookieDomain+"/search/v1/price/single/"+_pid+"/"+_sid+"/"+bdarea_2+"/flag/item/fn"+liindex+index,
                        jsonpCallback: "fn"+liindex+index,
                        dataType: "jsonp",
                        success: function(data) {
                            if(data && data.success){
                                var priceContent = data.result.price?"¥"+data.result.price:"暂无售价";
                                $(elem).find(".item-price").text(priceContent);
                                //$(elem).prop("hasPrice",true);
                            }
                        }
                    });
                });


                _this.siblings("li").find(".bottom-advertisement-lists").hide();
            });
        }else{
            _this.find(".bottom-advertisement-lists").show();
            _this.siblings("li").find(".bottom-advertisement-lists").hide();
        };
    })
</script>
</body>
</html>
