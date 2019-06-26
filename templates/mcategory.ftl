<#assign TDK = searchObj.content.seoData />
<#if (searchObj.content.seoData.dispStr)??>
    <#assign TDKcateame = "进口"+(searchObj.content.seoData.dispStr)! />
<#else>
    <#assign TDKcateame = "进口"+(searchObj.content.seoData.catName)! />
</#if>
<#assign isGomeDeliv = "" />
<#assign isMarket = "海外购" />
<#assign priceRange=""/>
<#if (searchObj.content.toolBar.deliv.delivGome.isDefault)?? && searchObj.content.toolBar.deliv.delivGome.isDefault>
    <#assign isGomeDeliv = "国美配送" />
</#if>
<#if (searchObj.content.selectData.price)??>
    <#assign isPriceRange=(searchObj.content.selectData.price.lowPrice!)+"到"+(searchObj.content.selectData.price.highPrice!)+"元" />
</#if>

<#if TDK.sortNo = 10>
    <#assign title = "销量最好的${isPriceRange!}${TDKcateame!}价格,${isPriceRange!}${TDKcateame!}销量排行榜【报价、品牌、正品行货】${isGomeDeliv!}${isMarket!}-国美">
    <#assign keywords = "销量最好的${isPriceRange!}${TDKcateame!},最好的${isPriceRange!}${TDKcateame!}价格,${isPriceRange!}${TDKcateame!}销量排行榜,最好的${isPriceRange!}${TDKcateame!}报价,${isGomeDeliv!}${isMarket!}">
    <#assign description = "国美提供销量最好的${isPriceRange!}${TDKcateame!}价格告诉您${isPriceRange!}${TDKcateame!}销量排行榜,并为您购买销量最好的${isPriceRange!}${TDKcateame!}提供最新报价、价格、促销、评价、排行、图片等选购信息。">
<#elseif TDK.sortNo = 21>
    <#assign title = "最便宜的${isPriceRange!}${TDKcateame!}价格_最便宜的${isPriceRange!}${TDKcateame!}多少钱_最便宜的${isPriceRange!}${TDKcateame!}报价大全${isGomeDeliv!}${isMarket!}-国美">
    <#assign keywords = "最便宜的${isPriceRange!}${TDKcateame!},最便宜的${isPriceRange!}${TDKcateame!}价格,最便宜的${isPriceRange!}${TDKcateame!}多少钱,最便宜的${isPriceRange!}${TDKcateame!}报价,${isGomeDeliv!}${isMarket!}">
    <#assign description = "国美提供最便宜的${isPriceRange!}${TDKcateame!}价格告诉您最便宜的${isPriceRange!}${TDKcateame!}多少钱,并为您购买最便宜的${isPriceRange!}${TDKcateame!}报价大全提供最新报价、价格、促销、评价、排行、图片等选购信息。">
<#elseif TDK.sortNo = 20>
    <#assign title = "最贵的${isPriceRange!}${TDKcateame!}价格_最贵的${isPriceRange!}${TDKcateame!}多少钱_最贵的${isPriceRange!}${TDKcateame!}报价大全${isGomeDeliv!}${isMarket!}-国美">
    <#assign keywords = "最贵的${isPriceRange!}${TDKcateame!},最贵的${isPriceRange!}${TDKcateame!}价格,最贵的${isPriceRange!}${TDKcateame!}多少钱,最贵的${isPriceRange!}${TDKcateame!}报价,${isGomeDeliv!}${isMarket!}">
    <#assign description = "国美提供最贵的${isPriceRange!}${TDKcateame!}价格告诉您最贵的${isPriceRange!}${TDKcateame!}多少钱,并为您购买最便贵的${isPriceRange!}${TDKcateame!}报价大全提供最新报价、价格、促销、评价、排行、图片等选购信息。">
<#elseif TDK.sortNo = 50>
    <#assign title = "最好的${isPriceRange!}${TDKcateame!}价格,口碑最好的${isPriceRange!}${TDKcateame!}报价【大全、品牌、评价、正品行货】${isGomeDeliv!}${isMarket!}-国美">
    <#assign keywords = "最好的${isPriceRange!}${TDKcateame!},口碑最好的${isPriceRange!}${TDKcateame!},最好的${isPriceRange!}${TDKcateame!}价格,口碑最好的${isPriceRange!}${TDKcateame!}报价${isGomeDeliv!}${isMarket!}">
    <#assign description = "国美提供最好的${isPriceRange!}${TDKcateame!}价格告诉您口碑最好的${isPriceRange!}${TDKcateame!}报价,并为您购买最好的${isPriceRange!}${TDKcateame!}提供最新报价、价格、促销、评价、排行、图片等选购信息。">
<#elseif TDK.sortNo = 30>
    <#assign title = "最新${isPriceRange!}${TDKcateame!}价格,最新款${isPriceRange!}${TDKcateame!}报价【大全、品牌】${isGomeDeliv!}${isMarket!}-国美">
    <#assign keywords = "最新${isPriceRange!}${TDKcateame!},新款${isPriceRange!}${TDKcateame!},最新款${isPriceRange!}${TDKcateame!}价格,最新${isPriceRange!}${TDKcateame!}报价大全${isGomeDeliv!}${isMarket!}">
    <#assign description = "国美提供最新${isPriceRange!}${TDKcateame!}价格告诉您最新款${isPriceRange!}${TDKcateame!}报价,并为您购买最新${isPriceRange!}${TDKcateame!}提供最新报价、价格、促销、评价、排行、图片等选购信息。">
<#else>
    <#assign title = "${isPriceRange!}${TDKcateame!}报价,${isPriceRange!}${TDKcateame!}价格表【大全、品牌、行情、正品行货】${isGomeDeliv!}${isMarket!}-国美">
    <#assign keywords = "${isPriceRange!}${TDKcateame!}报价,${isPriceRange!}${TDKcateame!}价格表,${isPriceRange!}${TDKcateame!}报价大全,${isPriceRange!}${TDKcateame!}品牌${isGomeDeliv!}${isMarket!}">
    <#assign description = "国美销售${isPriceRange!}${TDKcateame!},并为你购买${isPriceRange!}${TDKcateame!}提供最新${isPriceRange!}${TDKcateame!}报价、${isPriceRange!}${TDKcateame!}价格、价格表、促销、参数、评价、排行、图片等选购信息.有国美，生活美！">
</#if>
<#include "module/variable.ftl" >
<#assign varHostName = "//higolist.gome.com.cn">
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${title!}</title>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <meta http-equiv="Cache-Control" content="no-transform"/>
    <meta name="applicable-device" content="pc">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta name="description" content="${description!}">
    <meta name="Keywords" content="${keywords!}">
    <meta property="qc:admins" content="2500556177677556375636"/>
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
    <meta http-equiv="mobile-agent" content="format=html5" url= "//m.gome.com.cn/category-${(varSelectData.category.third.id)!}.html">
    <link rel="shortcut icon" href="//app.gomein.net.cn/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href='<!--# include virtual="/n/common/b01/style.html"-->,/css/n/detail/gCity.min.css,/search/search2017/css/style.min.css?${jsCssVersion!}'>
    <!--# include virtual="/n/common/global/global.html"-->
    <#if (searchObj.header.refPage)!?index_of("-00-0-48-1-0-0-0-1-0-0-0-0-0-0-0-0-0")!=-1>
        <link rel="canonical" href="${(storeConfiguration.listSite)!}/${(searchObj.content.seoData.catId)!}.html"/>
    <#else>
        <link rel="canonical" href="${(searchObj.header.refPage)!?replace("/category/","/")}"/>
    </#if>
    <link rel="alternate" media="only screen and(max-width:640px)" href="//m.gome.com.cn/category-${(varSelectData.category.third.id)!}.html">
</head>
<body class="marketPage" data-page="list">
<div id="delscript">
    <script type="text/javascript">
        var winWidth = window.screen.width,objb = document.body;if (winWidth<=1024) {objb.className += " " +"w990"; }else {objb.className=objb.className.replace("w990", '');};
    </script>
</div>
<#--nginx -->
<!--# include virtual="/n/common/b01/head.html"-->
<#--热卖分类 推送少于4个的时候会异步请求大数据商品-->
<div class="nSearchWarp">
    <div class="hot-tj">
        <span class="icon_tj">热卖<br/>推荐</span>
        <#assign modelId="9000000000">
        <ul class="hot-list clearfix" id="hot-list" modelid=${modelId}>
        <#if (searchObj.content.recommends.size)?? && (searchObj.content.recommends.size >3)>
            <#assign recommendsPrds=(searchObj.content.recommends.products)!>
            <#list recommendsPrds as item>
                <li class="item" from="云眼">
                    <p class="pic">
                        <a target="_blank" class="bigD_item" href="${(item.skus.sUrl)!}" title="${(item.skus.name)!}" data-code="${modelId}-${item_index}" track="click|热卖推荐|box01|${item_index?if_exists}|${(item.pId)!}|三级列表：${(searchObj.content.selectData.category.third.name )!}|三级列表|${(searchObj.content.selectData.category.third.name )!}|0|0|0">
                            <img src="${(item.skus.sImg)!}_130.jpg" alt="1${(item.skus.alt)!}">
                        </a>
                    </p>
                    <p class="name">
                        <a target="_blank" class="bigD_item" href="${(item.skus.sUrl)!}" target="_blank" title="${(item.skus.name)!}" data-code="${modelId}-${item_index}" track="click|热销推荐|box01|${item_index?if_exists}|${(item.pId)!}|三级列表：${(searchObj.content.selectData.category.third.name )!}|三级列表|${(searchObj.content.selectData.category.third.name )!}|0|0|0">
                        ${(item.skus.name)!}
                        </a>
                    </p>
                    <p class="price">
                        <span>¥${(item.skus.price)!}</span>
                    </p>
                    <p class="btn">
                        <a target="_blank" class="bigD_item" href="${(item.skus.sUrl)!}" data-code="${modelId}-${item_index}" track="click|热销推荐|box01|${item_index?if_exists}|${(item.pId)!}|三级列表：${(searchObj.content.selectData.category.third.name )!}|三级列表|${(searchObj.content.selectData.category.third.name )!}|0|0|0" class="buy">立即抢购</a>
                    </p>
                </li>
            </#list>
        </#if>
        </ul>
    </div>
</div>
<#--面包屑-->
<div class="nSearchWarp">
    <#--分类列表页面包屑-->
    <#assign pageCategory = (searchObj.content.selectData.category)!>
    <div class="nSearch-crumb clearfix">
        <span id="category-first" catgoryId="${(pageCategory.fir.id)!}" data-code="9000000101-1" class="nSearch-crumb-tit-category">${(pageCategory.fir.name)!}</span>

        <dl class="nSearch-crumb-category"  catgoryId="${(pageCategory.sec.id)!}" id="category-second">
            <dt class="category-name">${(pageCategory.sec.name)!}</dt>
            <dd class="category-box clearfix" id="category-box-second" modelid="9000000102"></dd>
        </dl>

        <#if (pageCategory.third)??>
            <dl class="nSearch-crumb-category" catgoryId="${(pageCategory.sec.id)!}" id="category-third">
                <dt class="category-name">${(pageCategory.third.name)!}</dt>
                <dd class="category-box"  id="category-box-third" modelid="9000000103">
                    <#if (pageCategory.sec.childs)?? && (pageCategory.sec.childs?size gt 0)>
                        <#list pageCategory.sec.childs as thirdItem>
                            <a href="${(thirdItem.url)!}" data-code="9000000103-${(thirdItem_index+1)!}">${(thirdItem.name)!}</a>
                        </#list>
                    </#if>
                </dd>
            </dl>
        </#if>
        <#--页面当前已经选择的分类-->
        <#include "module/facet/facet_selected.ftl">
    </div>

    <div class="nSearchWarp nSearch-crumb-category-results">
        <span class="nFont14"><b class="nHeigh">${(pageCategory.third.name)!}</b>商品筛选</span>
        <span>共 <em id="searchTotalNumber">${searchObj.content.seoData.totalCount!}</em> 个商品</span>
    </div>
</div>
<#--facets分类-->
<div class="nSearchWarp nSearch-facets" id="module-facet">
    <#assign showThreshold = 5 />
    <#assign showThresholdText = "" />
    <#--【facet】品牌筛选项-->
    <#assign facetsBrands = (searchObj.content.facets.brand)!>
    <#if !(facetsBrands.selected)?? && (facetsBrands.items??)>
        <#assign showThreshold= showThreshold - 1 />
        <#include "module/facet/facet_brand.ftl" >
    </#if>
    <#--【facet】价格筛选-->
    <#assign facetsPrice = (searchObj.content.facets.price)!>
    <#if (facetsPrice.items)?? && !(facetsPrice.selected)??>
        <#assign thisFacets = facetsPrice>
        <#assign showThreshold= showThreshold - 1 />
        <#include "module/facet/facet_common.ftl">
    </#if>
    <#--【facet】一般筛选  【展示方式】超过showThreshold的分类隐藏，通过更多展示按钮控制-->
    <#assign facetsCommon = (searchObj.content.facets.commonfacets)!>
    <#list facetsCommon as facetsItem>
        <#if (facetsItem_index >=  showThreshold)>
            <#assign showThresholdText =showThresholdText+ "," + (facetsItem.label)!/>
            <#assign displayType ="fc-hide"/>
        </#if>
        <#assign thisFacets = facetsItem>
        <#include "module/facet/facet_common.ftl">
    </#list>
    <#if facetsCommon?size &gt; showThreshold>
        <div class="fccc-control-warp">
            <span class="fccc-control"  id="fc-common-show">更多选项（${showThresholdText?substring(1)}）</span>
            <span class="fccc-up" id="fc-common-hide">收起&nbsp;&nbsp;</span>
        </div>
    </#if>
</div>
<#--页面商品列表主体-->
<div class="nSearchWarp">
    <div class="nSearchWarp-main clearfix">
        <div class="product-right-box">
            <div id="prdRight-1"><#--店铺精选商品 dsp--></div>
            <div id="prdRight-2"><#--一周销量排行榜 bigdata--></div>
            <div id="prdRight-3"><#--浏览此类商品的用户最终买了 bigdata--></div>
            <div id="prdRight-4"><#--购买此类商品的用户还购买了 bigdata--></div>
            <div id="prdRight-5"><#--推广活动位 dsp--></div>
        </div>
        <div class="product-left-list" id="product-left">
            <#include "module/toolbar.ftl" >
            <#include "module/prdlist.ftl" >
        </div>
    </div>
</div>
<div id="lazyajaxloadareaBox"><div id="lazyajaxloadarea"></div></div>
<div class="nSearchWarp">
    <div id="prdBottom-1"><#--推广商品（） dsp--></div>
    <div id="prdBottom-2"><#--猜你喜欢 bigdata--></div>
    <div id="prdBottom-recent"><#--最近浏览--></div>
</div>
<!--# include virtual="/n/common/b01/aside.html"-->
<!--# include virtual="/n/common/b01/foot_new.html"-->
<script>
    var productId_list = "";
    var keyword = "";
    var order = [];
    var orderby= "";
    var catid= "";
    var s_account = "gome-prd,gome-higo-prd";
</script>
<script type="text/javascript">
    var isHyg = true//${(storeConfiguration.isHwg)!};
    window.pageName = '海外购三级列表页';
</script>
<#include "module/pagejs.ftl">
<script src="${(storeConfiguration.stageJsServer)!}/search/search2017/js/mcategory.bundle.js?${jsCssVersion!}"></script>
</body>
</html>