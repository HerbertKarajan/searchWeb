<#if (searchObj.content.seoData)??>
<#assign TDK = searchObj.content.seoData>
</#if>
<#assign quession = "${(TDK.question)?if_exists}${(TDK.catName)?if_exists}">
<#if (searchObj.content.selectData)??>
<#assign pageSelectData = searchObj.content.selectData>
</#if>
<#assign isCatId = "${(isCatId)!}">
<#if isCatId=="Y">
    <#assign brandName = "${(pageSelectData.keywords)!}${(pageSelectData.category.third.name)!}">
<#else>
    <#assign brandName = "${(pageSelectData.keywords)!}">
</#if>
<#if TDK.XSearch??>
        <#assign title = "${brandName!}官网提供${brandName!}大全及${brandName!}官网报价-国美">
        <#assign description ="国美${brandName!}官网提供${brandName!}最新商品,查看最新${brandName!}官网报价,网购就到国美${brandName!}大全产品专区"  >
        <#assign keywords = "${brandName!},${brandName!}大全,${brandName!}官网,${brandName!}官网报价">
</#if>

<#if pageSelectData.facets.catfacets?? && pageSelectData.facets.catfacets.id??>
    <#assign href_url = "//m${(storeConfiguration.cookieDomain)!}/brand/${pageSelectData.brandId!}-${pageSelectData.facets.catfacets.id!}.html">
<#else>
    <#assign href_url = "//m${(storeConfiguration.cookieDomain)!}/brand/${pageSelectData.brandId!}-0.html">
</#if>
<#include "module/variable.ftl" >
<#assign varHostName = "//search${(storeConfiguration.cookieDomain)!}">
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
    <meta name="mobile-agent"  content="format=html5; url=${href_url!}">
<#if isCatId=="Y">
    <link rel="canonical" href="//brand${(storeConfiguration.cookieDomain)!}/${(pageSelectData.brandId)?if_exists}-${(searchObj.content.seoData.catId)!}.html"/>
<#else>
    <link rel="canonical" href="//brand${(storeConfiguration.cookieDomain)!}/${(pageSelectData.brandId)?if_exists}-0.html"/>
</#if>
    <link rel="alternate" media="only screen and(max-width:640px)" href="${href_url!}"/>
    <link rel="shortcut icon" href="//app.gomein.net.cn/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href='<!--# include virtual="/n/common/a18/style.html"-->,/css/n/detail/gCity.min.css,/search/search2017/css/style.min.css?${jsCssVersion!}'>
<!--# include virtual="/n/common/global/global.html"-->
</head>
<body data-page="brand">
<div id="delscript">
    <script type="text/javascript">
        var winWidth = window.screen.width,objb = document.body;if (winWidth<=1024) {objb.className += " " +"w990"; }else {objb.className=objb.className.replace("w990", '');};
    </script>
</div>
<div style="display:none" id="severInfolist">
    server:${(searchObj.header.serverInfo.serverIp)!}<br/>
    from:${(searchObj.header.serverInfo.from)!}<br/>
    thread:${(searchObj.header.serverInfo.thread)!}<br/>
    job:${(searchObj.header.serverInfo.job)!}<br/>
    time:${(searchObj.header.serverInfo.time)!}<br/>
</div>
<!--# include virtual="/n/common/default/head.html"-->
<#if searchObj.content.pageBar.totalCount != 0>
    <#--facets展示 -->
    <div class="layout crumb">
        <ul class="crumb-list crumb-list-brand" modelid="9000000100">
            <li><a href="//brand${(storeConfiguration.cookieDomain)!}" data-code="9000000100-0">全部品牌</a><i class="crumbArrow">&nbsp;&gt;&nbsp;</i></li>
            <#if isCatId=="Y">
                <li><a href="//brand${(storeConfiguration.cookieDomain)!}/${(pageSelectData.brandId)?if_exists}-0.html" data-code="9000000100-1">${(pageSelectData.keywords)?if_exists}</a><i class="crumbArrow">&gt;</i></li>
                <li>${brandName!}</li>
            <#else>
                <li>${brandName!}</li>
            </#if>
        </ul>
        <script>
            document.getElementById("keyLabel").setAttribute("default","${brandName!},1",1);
            document.getElementById("keyLabel").innerHTML = "${brandName!}";
        </script>
        <div style="display:none">
            <#if (searchObj.content.selectData.category.fir)??>
                <span class="firstmenu" style="display:none">${(pageSelectData.category.fir.name)!}</span>
            </#if>
            <#if (searchObj.content.selectData.category.third)??>
                <span class="thirdmenu" style="display:none">${(pageSelectData.category.third.name)!}</span>
            </#if>
        </div>
    </div>
    <div class="brand-wrap layout">
        <#if isCatId=="Y">
            <div class="brand-info">
                <h1 class="title">${(pageSelectData.keywords)?if_exists}${(pageSelectData.category.third.name)?if_exists}</h1>
                <div class="brand-detail">
                    <span>国美${(pageSelectData.keywords)?if_exists}品牌专区，为您购买${brandName!}相关商品提供报价、评价信息。</span>
                    <#if (pageSelectData.ecBrandId)?? && isCatId=="Y">
                        <span class="link"><a target="_blank" href="//offer${(storeConfiguration.cookieDomain)!}/price-${(pageSelectData.category.third.id)?if_exists}-${(pageSelectData.ecBrandId)?if_exists}.html"><em>${brandName!}</em>报价</a><a target="_blank" href="//comment${(storeConfiguration.cookieDomain)!}/comment-${(pageSelectData.category.third.id)?if_exists}-${(pageSelectData.ecBrandId)?if_exists}.html"><em>${brandName!}</em>评价</a></span>
                    <#else>
                        <span class="link"><a target="_blank" href="//offer${(storeConfiguration.cookieDomain)!}/price-${(pageSelectData.category.third.id)?if_exists}.html"><em>${brandName!}</em>报价</a><a target="_blank" href="//comment${(storeConfiguration.cookieDomain)!}/comment-${(pageSelectData.category.third.id)?if_exists}.html"><em>${brandName!}</em>评价</a></span>
                    </#if>
                </div>
            </div>
        <#else>
            <div class="brand-info">
                <h1 class="title">${brandName!}</h1>
                <div class="brand-detail">国美${(pageSelectData.keywords)?if_exists}品牌专区，为您购买${brandName!}品牌相关商品提供报价、评价信息。</div>
            </div>
        </#if>
    </div>
    <#--facets展示 -->
    <div class="nSearchWarp nSearch-facets" id="module-facet">
        <#assign showThreshold = 4 />
        <#assign showThresholdText = "" />
        <#if isCatId=="N">
            <#--【facet】分类 -->
            <#if (searchObj.content.facets.hotCategory)??>
                <#assign facetsHot = (searchObj.content.facets.hotCategory)!>
                <#assign displayType = "facets-hot">
                <#assign facethotitem = "facets-hot-item">
                <#list facetsHot as facetsItem>
                    <#assign thisFacets = facetsItem>
                    <#include "module/facet/facet_common.ftl">
                </#list>
                <#assign displayType = "">
                <#assign facethotitem = "">
            </#if>
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
        <div class="nSearchWarp-main">
            <div class="product-right-box">
                <div id="prdRight-1"><#--店铺精选商品 dsp--></div>
                <div id="prdRight-2"><#--热销推荐商品 bigdata--></div>
                <div id="prdRight-3"><#--搜了还还购买了 bigdata--></div>
            </div>
            <div class="product-left-list" id="product-left">
                <#include "module/toolbar.ftl">
                <#include "module/prdlist.ftl">
            </div>
        </div>
    </div>
<#else>
    <div class="brandNoResult layout" style="height:150px; text-align:center;border:1px solid #e0e0e0; margin:10px auto; line-height:150px; color:#5e5e5e">非常抱歉，此页面无<b style="color:#06c">${brandName!}</b>相关商品，更多内容请访问：<a href="//brand.gome.com.cn/" style="color:#06c;">品牌大全</a></div>
    <div class="nSearchWarp">
        <div id="related-list" style="display: none"><div id="prd-right-hot"></div></div>
        <div id="product-left"><div id="filter-box"></div><div id="filter-bottom"></div></div>
        <div id="personrecommend-warp" style="display:none"><div id="personrecommend" class="personrecommend prd-right-normal"></div></div>
    </div>
</#if>
<div id="lazyajaxloadareaBox"><div id="lazyajaxloadarea"></div></div>
<div class="nSearchWarp">
    <#--猜你喜欢的商品-->
    <div id="prdBottom-1"><#--猜你喜欢 bigdata--></div>
    <#--最近浏览商品-->
    <div id="prdBottom-recent"><#--最近浏览--></div>
</div>
<#--nginx-->
<!--# include virtual="/n/common/default/aside.html"-->
<!--# include virtual="/n/common/default/foot.html"-->
<!--#include virtual="/n/common/default/aside.html"-->
<script>
    var productId_list = "";
    var keyword = "";
    var order = [];
    var orderby="";
</script>
<script type="text/javascript">
    var isHyg = false;//${(storeConfiguration.isHwg)!};
    window.pageName = '品牌商品页';
</script>

<#include "module/pagejs.ftl">
<script src="${(storeConfiguration.stageJsServer)!}/search/search2017/js/brand.bundle.js?${jsCssVersion!}"></script>
</body>
</html>