<#if (searchObj.content.seoData)??>
    <#assign TDK = searchObj.content.seoData>
</#if>
<#if (searchObj.content.selectData)??>
    <#assign selectD = searchObj.content.selectData>
</#if>
<#assign quession = "${(selectD.keywords)?if_exists}">
<#assign prdBrand = "">
<#assign hotFacet = "">
<#if (TDK.hasBrand)??>
    <#list selectD.facets.brand.items as item>
        <#assign prdBrand = prdBrand + "${(item.value)!}">
    </#list>
</#if>
<#if (selectD.facets.selectCat)?? && (selectD.facets.selectCat?string == "true")>
    <#assign hotFacet = "${(selectD.facets.catfacets.name)!}">
</#if>
<#assign title = "${prdBrand!}${hotFacet!}${(TDK.otherFacet)!}${quession!}性价比_${prdBrand!}${hotFacet!}${(TDK.otherFacet)!}${quession!}规格_${prdBrand!}${hotFacet!}${(TDK.otherFacet)!}${quession!}系列_导购_国美">
<#assign keywords = "${prdBrand!}${hotFacet!}${(TDK.otherFacet)!}${quession!}性价比,${prdBrand!}${hotFacet!}${(TDK.otherFacet)!}${quession!}规格,${prdBrand!}${hotFacet!}${(TDK.otherFacet)!}${quession!}系列,${prdBrand!}${hotFacet!}${(TDK.otherFacet)!}${quession!}导购">
<#assign description =  "国美搜索为您提供${prdBrand!}${hotFacet!}${(TDK.otherFacet)!}${quession!}性价比最高的商品信息,包含了${prdBrand!}${hotFacet!}${(TDK.otherFacet)!}${quession!}规格,${prdBrand!}${hotFacet!}${(TDK.otherFacet)!}${quession!}系列等内容,了解更多${prdBrand!}${hotFacet!}${(TDK.otherFacet)!}${quession!}导购信息,就上国美!正品行货，价格更低,24小时按需配送,为您提供便捷、诚信的服务.">
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
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
    <link rel="shortcut icon" href="//app.gomein.net.cn/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href='<!--# include virtual="/n/common/a18/style.html"-->,/css/n/detail/gCity.min.css,/search/search2017/css/style.min.css?${jsCssVersion!}'>
    <!--# include virtual="/n/common/global/global.html"-->
</head>

<body data-page="search">
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
<!--# include virtual="/n/common/a18/head.html"-->
<script>
    <#if (varSelectData.keywords)??>
    var keyLabelVal = "${varSelectData.keywords?replace('\\','')?replace('\"','')}";
    keyLabelVal = keyLabelVal.replace(/\"/g,"'");
    document.getElementById("keyLabel").setAttribute("default",keyLabelVal+",1",1);
    document.getElementById("keyLabel").innerHTML = keyLabelVal;
    document.getElementById("keyLabel").style.top = "-50px";
    document.getElementById("searchInput").value = keyLabelVal;
    </#if>
</script>
<#if (searchObj.content.pageBar)??>
<#if searchObj.content.pageBar.totalCount != 0>

    <div class="nSearchWarp">
        <div class="nSearch-crumb nSearch-crumb-search clearfix">
            <span class="nSearch-crumb-keyWord" id="nSearch-crumb-keyWord"><b class="nFont14">${varSearchKeyWords!}</b></span>
            <span class="nSearch-crumb-searchNum" id="nSearch-crumb-searchNum">共 <em id="searchTotalNumber">${searchObj.content.seoData.totalCount!}</em> 个商品</span>
            <#--页面当前已经选择的分类-->
            <#include "module/facet/facet_selected.ftl">
        </div>

        <#assign searchReset=searchObj.content.commonInfo >
        <#if (searchReset.searchLevel)?? && (searchReset.searchLevel) ==2 >
            <#if (searchReset.showWord)?length &gt; 0><#--纠错-->
                <div class="nSearch-crumb-check"><span class="title">非常抱歉，没有找到与"<em class="nHeigh">${varSearchKeyWords!}</em>"相关的商品，为您推荐与"<em class="nHeigh">${searchObj.content.commonInfo.remain!}</em>"相关的商品。</span></div>
            <#else><#--降维-->
                <div class="nSearch-crumb-check"><span class="title">非常抱歉，没有找到与"<em class="nHeigh">${varSearchKeyWords!}</em>"相关的商品，为您推荐与"<em class="nHeigh">${searchObj.content.commonInfo.remain!}</em>"相关的商品。</span></div>
            </#if>
        <#elseif (searchReset.searchLevel)?? && (searchReset.searchLevel) ==3 >
            <div class="nSearch-crumb-check"><span class="title">非常抱歉，根据相关法律法规和政策，无法显示与"<em class="nHeigh">${varSearchKeyWords!}</em>"相关的商品，为您推荐与"<em class="nHeigh">${searchObj.content.commonInfo.remain!}</em>"相关的商品。</span></div>
        <#else>
        </#if>
    </div>

    <#if searchObj.header.isContainsFlow?? && searchObj.header.isContainsFlow>
        <div class="nSearchWarp"><iframe id="xnframe" src="//game${(storeConfiguration.cookieDomain)!}/gamecard/game/searchvms.html?question=${varSearchKeyWords!}" width="100%" frameborder="0" scrolling="no"></iframe></div>
    </#if>
    
    <#--facets分类-->
    <div class="nSearchWarp nSearch-facets searchFacet" id="module-facet">

        <#--如果搜索结果页搜索的是品牌，会展示推荐品牌店铺，隐藏品牌facet筛选项-->
        <#if searchObj.content.banner??>
            <#if (searchObj.content.banner.bannerType)?? && (searchObj.content.banner.bannerType) == 1>
                <#--四个链接活动跳转-->
                <a href="${(searchObj.content.banner.PCUrl)!}" target="_blank" title="${(searchObj.content.banner.name)!}"><img src="${(searchObj.content.banner.img)!}" alt="${(searchObj.content.banner.name)!}" width="1200"> </a>
            <#elseif (searchObj.content.banner.bannerType)?? && (searchObj.content.banner.bannerType) == 0>
                <#--店铺-->
                <#if (searchObj.content.banner.shopTag)?? && (searchObj.content.banner.shopTag) == 2><#--自营-->
                    <#assign shopurl="${searchObj.content.banner.shopurl!}"/>
                <#else>
                    <#assign shopurl="//mall.gome.com.cn/${searchObj.content.banner.id!}"/>
                </#if>
                <div class="search-brand">
                    <div class="brand-info clearfix" modelid="${(searchObj.content.banner.id)!}">
                        <div class="brand-info-logo">
                            <a data-code="${(searchObj.content.banner.id)!}-0" href="${shopurl!}" data-id="aaaa" target="_blank">
                                <#if searchObj.content.banner.shopLogo?? && searchObj.content.banner.shopLogo !="">
                                    <img src="${(searchObj.content.banner.shopLogo)!}">
                                <#elseif (searchObj.content.banner.logo)?? && searchObj.content.banner.logo !="">
                                    <img src="${(searchObj.content.banner.logo)!}">
                                </#if>
                            </a>
                        </div>
                        <div class="brand-info-main">
                            <div class="shop-name" style="margin-top:10px;">
                                <a data-code="${(searchObj.content.banner.id)!}-1" href="${shopurl!}" class="title" target="_blank">${(searchObj.content.banner.name)!}</a>
                                <#if (searchObj.content.banner.shopTag)?? && searchObj.content.banner.shopTag ==2>
                                    <span class="gome-zy">国美自营</span>
                                </#if>
                            </div>
                        </div>
                        <div class="brand-info-pj">
                            <dl class="pj-score">
                                <dt class="score-titl"><span>综合评分</span><span>商品</span><span>服务</span><span>时效</span></dt>
                                <dd class="score-cont">
                                    <span><em class="color-r">${searchObj.content.banner.zhscore?substring(0,3)}</em><i></i></span>
                                    <span ><em class="color-r">${searchObj.content.banner.prdscore?substring(0,3)}</em></span>
                                    <span><em class="color-r">${searchObj.content.banner.srvscore?substring(0,3)}</em></span>
                                    <span><em class="color-r">${searchObj.content.banner.tmsocre?substring(0,3)}</em></span>
                                </dd>
                            </dl>
                            <div class="shop-enter"><a data-code="${(searchObj.content.banner.id)!}-2" target="_blank" href="${shopurl!}">进入店铺</a></div>
                        </div>
                    </div>
                </div>
            <#else>
                <#--品牌-->
                <#if (searchObj.content.banner.zhscore)??>
                    <#if (searchObj.content.banner.type)?? && searchObj.content.banner.type ==1>
                        <#assign shopurl="${searchObj.content.banner.shopurl!}"/>
                    <#else>
                        <#assign shopurl="//mall.gome.com.cn/${searchObj.content.banner.shopId!}"/>
                    </#if>
                    <#assign modelId = "search01001"/>
                    <div class="search-brand">
                        <div class="brand-info clearfix" modelid="${(modelId)!}">
                            <div class="brand-info-logo">
                                <a data-code="${(modelId)!}-0" href="${shopurl!}" target="_blank">
                                    <#if searchObj.content.banner.shopLogo?? && searchObj.content.banner.shopLogo !="">
                                        <img src="${searchObj.content.banner.shopLogo!}">
                                    <#elseif (searchObj.content.banner.logo)?? && searchObj.content.banner.logo !="">
                                        <img src="${(searchObj.content.banner.logo)!}">
                                    <#elseif (searchObj.content.banner.brand.en)?? && searchObj.content.banner.brand.en !="">
                                        <span class="color-r">${(searchObj.content.banner.brand.en)!}</span>
                                    <#elseif (searchObj.content.banner.brand.ch)?? && searchObj.content.banner.brand.ch !="">
                                        <span class="color-r">${(searchObj.content.banner.brand.ch)!}</span>
                                    </#if>
                                </a>
                            </div>
                            <div class="brand-info-main">
                                <div class="shop-name" style="margin-top:10px;">
                                    <a data-code="${(modelId)!}-1" href="${shopurl!}" class="title" target="_blank">${searchObj.content.banner.name!}</a>
                                    <#if (searchObj.content.banner.type)?? && searchObj.content.banner.type ==1>
                                        <span class="gome-zy">国美自营</span>
                                    </#if>
                                </div>
                            </div>
                            <div class="brand-info-pj">
                                <dl class="pj-score">
                                    <dt class="score-titl"><span>综合评分</span><span>商品</span><span>服务</span><span>时效</span></dt>
                                    <dd class="score-cont">
                                        <span><em class="color-r">${searchObj.content.banner.zhscore?substring(0,3)}</em><i></i></span>
                                        <span ><em class="color-r">${searchObj.content.banner.prdscore?substring(0,3)}</em></span>
                                        <span><em class="color-r">${searchObj.content.banner.srvscore?substring(0,3)}</em></span>
                                        <span><em class="color-r">${searchObj.content.banner.tmsocre?substring(0,3)}</em></span>
                                    </dd>
                                </dl>
                                <div class="shop-enter"><a data-code="${(modelId)!}-2" target="_blank" href="${shopurl!}">进入店铺</a></div>
                            </div>
                        </div>
                    </div>
                <#else>
                    <div class="nSearchWarp">
                        <div class="brand-active" modelid="9000002400">
                            <a class="enter-btn" data-code="9000002400-2" target="_blank" href="${(searchObj.content.banner.PCUrl)!}">进入活动</a>
                            <div class="brand-active-main">
                                <a data-code="9000002400-1" href="${(searchObj.content.banner.PCUrl)!}" class="title" target="_blank">${(searchObj.content.banner.name)!}</a>
                                <span class="descrip">${(searchObj.content.banner.disp)!}</span>
                            </div>

                        </div>
                    </div>
                </#if>
            </#if>
        <#else>
            <#--【facet】品牌筛选项-->
            <#assign facetsBrands = (searchObj.content.facets.brand)!>
            <#if !(facetsBrands.selected)?? && (facetsBrands.items??)>
                <#include "module/facet/facet_brand.ftl" >
            </#if>
        </#if>

        <#--设置聚合筛选项的筛选条件 如果小于4个时候用普通分类补位-->
        <#if (searchObj.content.facets.hotCategory)?? && ((searchObj.content.facets.hotCategory)?size <= 6)>
            <#assign facetsCommonIndex= 6 - (searchObj.content.facets.hotCategory)?size />
        <#else>
            <#assign facetsCommonIndex= 6>
        </#if>

        <#--【facet】热门分类  【展示方式】有多少展示多少-->
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

        <#--【facet】普通分类  【展示方式】最多展示4个没，多余的放在聚合分类里面-->
        <#assign facetsCommon = (searchObj.content.facets.commonfacets)!>
        <#if facetsCommon?size &gt; 0>
            <#list facetsCommon as facetsItem>
                <#if facetsItem_index < facetsCommonIndex>
                    <#assign thisFacets = facetsItem>
                    <#include "module/facet/facet_common.ftl">
                </#if>
            </#list>
        </#if>

        <#--【facet】普通分类+相关分类  【展示方式】聚合展示-->
        <#assign facetsRelevant = (searchObj.content.facets.commomCatFacets)!>
        <#assign facetsSelect = (searchObj.content.selectData.facets.selectCat)?default(false)>
        <#if ((facetsCommon?size > facetsCommonIndex) || (facetsRelevant.items?? && facetsRelevant.items?size &gt; 0))>
            <div class="facets-category facets-category-syn clearfix">
                <span class="fc-key">高级筛选：</span>
                <div class="fc-content">
                    <#list facetsCommon as facetsItem>
                        <#if (facetsItem_index >= facetsCommonIndex) && (facetsItem_index &lt; 8)>
                            <#include "module/facet/facet_together.ftl">
                        </#if>
                    </#list>
                    <#--相关分类facets-->
                    <#if (facetsRelevant.items)?? && facetsRelevant.items ?size &gt; 0>
                        <#assign facetsItem = facetsRelevant>
                        <#assign displayType = "facets-rele">
                        <#include "module/facet/facet_together.ftl">
                    </#if>
                </div>
            </div>
        </#if>
    </div>

    <#--页面商品列表主体-->
    <div class="nSearchWarp">
        <div class="nSearchWarp-main clearfix pre">
            <div class="product-right-box">
                <div id="prdRight-1"><#--店铺精选商品 dsp--></div>
                <div id="prdRight-2"><#--热销推荐商品 bigdata--></div>
                <div id="prdRight-3"><#--搜了还还购买了 bigdata--></div>
                <div id="prdRight-4"><#--推广活动位 dsp--></div>
            </div>
            <div class="product-left-list" id="product-left">
                <#include "module/toolbar.ftl" >
                <#include "module/prdlist.ftl" >
            </div>
        </div>
        <#---底部搜索框--->
        <div class="searchBox-bottom">
            <div class="search-box clearfix" modelid="9000000801" style="position:relative">
                <input type="text" class="search-box-input" id="search-box-input" value="${varSearchKeyWords!}" defaultVal="${varSearchKeyWords!}">
                <a href="javascript:void(0)" class="search-box-btn" id="search-box-btn" data-code="9000000801-0">搜索</a>
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
<#else>
<div class="nSearchWarp">
        <#assign searchReset=searchObj.content.commonInfo >
        <#if (searchReset.searchLevel)?? && (searchReset.searchLevel) == 4>
        <div class="listmain">
            <div class="srabox">非常抱歉，根据相关法律法规和政策，无法显示与<span>“${(searchObj.content.commonInfo.illegal)!}”</span>相关的商品。</div>
            <em></em> <i></i>
        </div>
        <#elseif (searchObj.header.searchReq.et)?? && (searchObj.header.searchReq.et) !=''>
        <div class="listmain">
            <div class="srabox">非常抱歉，没有找到与<span>“${(searchObj.header.searchReq.et)!}”</span>相关的商品。</div>
            <em></em> <i></i>
        </div>
        <#elseif (searchObj.content.selectData.keywords)??>
            <#if (searchObj.header.cl)?? && (searchObj.header.cl==10)>
                <div class="nSearch-crumb nSearch-crumb-search clearfix">
                    <span class="nSearch-crumb-keyWord" id="nSearch-crumb-keyWord"><b class="nFont14">${varSearchKeyWords!}</b></span>
                    <span class="nSearch-crumb-searchNum" id="nSearch-crumb-searchNum">共 <em id="searchTotalNumber">${searchObj.content.seoData.totalCount!}</em> 个商品</span>
                <#--页面当前已经选择的分类-->
                    <#include "module/facet/facet_selected.ftl">
                </div>
                <div class="nSearchWarp-main clearfix pre">
                    <div class="product-right-box">
                        <div id="prdRight-2"><#--热销推荐商品 bigdata--></div>
                    </div>
                    <div class="product-left-list" id="product-left">
                        <#include "module/toolbar.ftl" >
                        <div class="nSearch-noProductBox">
                            <div class="noProductBox-content">
                                <h3 style="color:#e3101e">抱歉，没有找到相关的商品</h3>
                                <p>建议您：</p>
                                <p>1、修改筛选条件</p>
                                <p>2、调整价格区间</p>
                                <p>3、使用其他关键字</p>
                                <a href="javascript:void(0)" id="noResultReturnBack" class="nBlue">返回上一步</a>
                            </div>
                            <script>
                                document.getElementById("noResultReturnBack").onclick = function(){
                                    window.history.back()
                                }
                            </script>
                        </div>
                    </div>
                </div>
            <#else>
                <#if searchObj.content.banner??>
                    <#if (searchObj.content.banner.bannerType)?? && (searchObj.content.banner.bannerType) == 1>
                    <#--四个链接活动跳转-->
                        <a href="${(searchObj.content.banner.PCUrl)!}" target="_blank" title="${(searchObj.content.banner.name)!}"><img src="${(searchObj.content.banner.img)!}" alt="${(searchObj.content.banner.name)!}" width="1200"> </a>
                    <#elseif (searchObj.content.banner.bannerType)?? && (searchObj.content.banner.bannerType) == 0>
                    <#--店铺-->
                        <#if (searchObj.content.banner.shopTag)?? && (searchObj.content.banner.shopTag) == 2><#--自营-->
                            <#assign shopurl="${searchObj.content.banner.shopurl!}"/>
                        <#else>
                            <#assign shopurl="//mall.gome.com.cn/${searchObj.content.banner.id!}"/>
                        </#if>
                        <div class="search-brand" style="margin-top:10px;">
                            <div class="brand-info clearfix" modelid="${(searchObj.content.banner.id)!}">
                                <div class="brand-info-logo">
                                    <a data-code="${(searchObj.content.banner.id)!}-0" href="${shopurl!}" data-id="aaaa" target="_blank">
                                        <#if searchObj.content.banner.shopLogo?? && searchObj.content.banner.shopLogo !="">
                                            <img src="${(searchObj.content.banner.shopLogo)!}">
                                        <#elseif (searchObj.content.banner.logo)?? && searchObj.content.banner.logo !="">
                                            <img src="${(searchObj.content.banner.logo)!}">
                                        <#elseif (searchObj.content.banner.brand.en)?? && searchObj.content.banner.brand.en !="">
                                            <span class="color-r">${(searchObj.content.banner.brand.en)!}</span>
                                        <#elseif (searchObj.content.banner.brand.ch)?? && searchObj.content.banner.brand.ch !="">
                                            <span class="color-r">${(searchObj.content.banner.brand.ch)!}</span>
                                        </#if>
                                    </a>
                                </div>
                                <div class="brand-info-main">
                                    <div class="shop-name" style="margin-top:10px;">
                                        <a data-code="${(searchObj.content.banner.id)!}-1" href="${shopurl!}" class="title" target="_blank">${(searchObj.content.banner.name)!}</a>
                                        <#if (searchObj.content.banner.shopTag)?? && searchObj.content.banner.shopTag ==2>
                                            <span class="gome-zy">国美自营</span>
                                        </#if>
                                    </div>
                                </div>
                                <div class="brand-info-pj">
                                    <dl class="pj-score">
                                        <dt class="score-titl"><span>综合评分</span><span>商品</span><span>服务</span><span>时效</span></dt>
                                        <dd class="score-cont">
                                            <span><em class="color-r">${searchObj.content.banner.zhscore?substring(0,3)}</em><i></i></span>
                                            <span ><em class="color-r">${searchObj.content.banner.prdscore?substring(0,3)}</em></span>
                                            <span><em class="color-r">${searchObj.content.banner.srvscore?substring(0,3)}</em></span>
                                            <span><em class="color-r">${searchObj.content.banner.tmsocre?substring(0,3)}</em></span>
                                        </dd>
                                    </dl>
                                    <div class="shop-enter"><a data-code="${(searchObj.content.banner.id)!}-2" target="_blank" href="${shopurl!}">进入店铺</a></div>
                                </div>
                            </div>
                        </div>
                    <#else>
                    <#--品牌-->
                        <#if (searchObj.content.banner.zhscore)??>
                            <#if (searchObj.content.banner.type)?? && searchObj.content.banner.type ==1>
                                <#assign shopurl="${searchObj.content.banner.shopurl!}"/>
                            <#else>
                                <#assign shopurl="//mall.gome.com.cn/${searchObj.content.banner.shopId!}"/>
                            </#if>
                            <#assign modelId = searchObj.content.banner.shopId/>
                            <div class="search-brand" style="margin-top:10px;">
                                <div class="brand-info clearfix" modelid="${(modelId)!}">
                                    <div class="brand-info-logo">
                                        <a data-code="${(modelId)!}-0" href="${shopurl!}" target="_blank">
                                            <#if searchObj.content.banner.shopLogo?? && searchObj.content.banner.shopLogo !="">
                                                <img src="${searchObj.content.banner.shopLogo!}">
                                            <#elseif (searchObj.content.banner.logo)?? && searchObj.content.banner.logo !="">
                                                <img src="${(searchObj.content.banner.logo)!}">
                                            <#elseif (searchObj.content.banner.brand.en)?? && searchObj.content.banner.brand.en !="">
                                                <span class="color-r">${(searchObj.content.banner.brand.en)!}</span>
                                            <#elseif (searchObj.content.banner.brand.ch)?? && searchObj.content.banner.brand.ch !="">
                                                <span class="color-r">${(searchObj.content.banner.brand.ch)!}</span>
                                            </#if>
                                        </a>
                                    </div>
                                    <div class="brand-info-main">
                                        <div class="shop-name" style="margin-top:10px;">
                                            <a data-code="${(modelId)!}-1" href="${shopurl!}" class="title" target="_blank">${searchObj.content.banner.name!}</a>
                                            <#if (searchObj.content.banner.type)?? && searchObj.content.banner.type ==1>
                                                <span class="gome-zy">国美自营</span>
                                            </#if>
                                        </div>
                                    </div>
                                    <div class="brand-info-pj">
                                        <dl class="pj-score">
                                            <dt class="score-titl"><span>综合评分</span><span>商品</span><span>服务</span><span>时效</span></dt>
                                            <dd class="score-cont">
                                                <span><em class="color-r">${searchObj.content.banner.zhscore?substring(0,3)}</em><i></i></span>
                                                <span ><em class="color-r">${searchObj.content.banner.prdscore?substring(0,3)}</em></span>
                                                <span><em class="color-r">${searchObj.content.banner.srvscore?substring(0,3)}</em></span>
                                                <span><em class="color-r">${searchObj.content.banner.tmsocre?substring(0,3)}</em></span>
                                            </dd>
                                        </dl>
                                        <div class="shop-enter"><a data-code="${(modelId)!}-2" target="_blank" href="${shopurl!}">进入店铺</a></div>
                                    </div>
                                </div>
                            </div>
                        <#else>
                            <div class="nSearchWarp">
                                <div class="brand-active" modelid="9000002400">
                                    <a class="enter-btn" data-code="9000002400-2" target="_blank" href="${(searchObj.content.banner.PCUrl)!}">进入活动</a>
                                    <div class="brand-active-main">
                                        <a data-code="9000002400-1" href="${(searchObj.content.banner.PCUrl)!}" class="title" target="_blank">${(searchObj.content.banner.name)!}</a>
                                        <span class="descrip">${(searchObj.content.banner.disp)!}</span>
                                    </div>

                                </div>
                            </div>
                        </#if>
                    </#if>
                </#if>
                <div class="listmain">
                    <div class="srabox">非常抱歉，没有找到与<span>“${varSearchKeyWords!}”</span>相关的商品。</div>
                    <em></em> <i></i>
                </div>
            </#if>
        <#elseif (searchReset.searchLevel)?? && (searchReset.searchLevel) == 5>
        <div class="listmain">
            <div class="srabox">非常抱歉，没有找到与<span>“${varSearchKeyWords!}”</span>相关的商品。</div>
            <em></em> <i></i>
        </div>
        </#if>

</div>
</#if>
</#if>
<div id="lazyajaxloadareaBox"><div id="lazyajaxloadarea"></div></div>
<div class="nSearchWarp">
    <div id="prdBottom-1"><#--推广商品（有搜索结果） dsp 或者 热销推荐商品（无搜索结果） bigdata--></div>
    <div id="prdBottom-2"><#--猜你喜欢 bigdata--></div>
    <div id="prdBottom-recent"><#--最近浏览--></div>
    <div id="prdBottom-4"><#--底部推荐广告 dsp--></div>
</div>
<!--# include virtual="/n/common/default/aside.html"-->
<!--# include virtual="/n/common/default/foot.html"-->
<script>
    var productId_list = "";
    var keyword = "";
    var order = [];
    var orderby="";
    var catid="";
</script>
<script type="text/javascript">
    var isHyg = false;//${(storeConfiguration.isHwg)!};
    window.pageName = '搜索结果页';

    if ( 'addEventListener' in document ) {
        window.addEventListener('message', set_height, false);
    } else if ( 'attachEvent' in document ) {
        window.attachEvent('onmessage', set_height);
    }else{
        document.getElementById("xnframe").style.height = "450px"
    }

    //收到实际数据时的具体处理
    function set_height(msg){
        //根据计划使用msg.data数据
        document.getElementById("xnframe").style.height = msg.data+"px"
    }
</script>
<#include "module/pagejs.ftl">
<script src="${(storeConfiguration.stageJsServer)!}/search/search2017/js/search.bundle.js?${jsCssVersion!}"></script>
<script>
    window.setTimeout(function(){
    var pageCur = $(".page-nav .num em").html();
},2000);
</script>
</body>
</html>
