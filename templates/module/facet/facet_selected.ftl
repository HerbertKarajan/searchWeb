<#if varSelectData.isSearch>
    <#assign cleanURL="${varHostName!}/search?question=${varSearchKeyWords!}">
    <#if isGomehigo>
        <#assign cleanURL="${varHostName!}/search?question=${varSearchKeyWords!}&market=11&marketPage=1">
    </#if>
<#else>
    <#assign cleanURL="${varHostName!}/${varSeoData.catId!}.html">
</#if>
<a id="clearallfacts" class="nSearch-crumb-clearFacets" data-code="9000001100-0" href="${cleanURL!}">全部清空</a>
<div class="nSearch-crumb-facetsCurrent-warp" id="nSearch-crumb-facetsCurrent-warp">
    <ul class="nSearch-crumb-facetsCurrent">
        <#--页面当前已经选择的分类-->
        <#assign pageFacets = (varSelectData.facets)!>
        <#--已选的品牌分类facets-->
        <#if (pageFacets.brand)??>
        <#assign pageFacetsBrand_choose = "" />
        <#assign pageFacetsBrand_choose_id = "" />
        <#list pageFacets.brand.items as childItem>
            <#if childItem_has_next>
                <#assign spaceSplite = "、" />
            <#else>
                <#assign spaceSplite = "" />
            </#if>
            <#assign pageFacetsBrand_choose = pageFacetsBrand_choose+ "${childItem.value!}${spaceSplite!}" />
            <#assign pageFacetsBrand_choose_id = pageFacetsBrand_choose_id+ ",${childItem.id!}" />
        </#list>
        <li id="brandChoose" brandId="${pageFacetsBrand_choose_id!}"><a data-code="9000001100-1" href="${varHostName!}${pageFacets.brand.url!}"><i>×</i><em>${pageFacets.brand.label!}：</em>${pageFacetsBrand_choose!}</a></li>
        </#if>
        <#--已选的分类列表页价格facets-->
        <#if (pageFacets.price)??>
            <#assign pageFacetsPrice_choose = "" />
            <#list pageFacets.price.items as childItem>
                <#if childItem_has_next>
                    <#assign spaceSplite = "、" />
                <#else>
                    <#assign spaceSplite = "" />
                </#if>
                <#assign pageFacetsPrice_choose = pageFacetsPrice_choose+ "${childItem.value!}${spaceSplite!}" />
            </#list>
            <li><a data-code="9000001100-2" href="${varHostName!}${pageFacets.price.url!}"><i>×</i><em>${pageFacets.price.label!}：</em>${pageFacetsPrice_choose!}</a></li>
        </#if>
        <#--搜索结果页 只会有一个 热门或者相关分类facets-->
        <#if (pageFacets.catfacets)??>
            <li><a href="${pageFacets.catfacets.url!}"><i>×</i><em>分类：</em>${pageFacets.catfacets.name!}</a></li>
        </#if>
        <#--普通分类facets-->
        <#if (pageFacets.commonfacets)?? && (pageFacets.commonfacets)?size &gt; 0>
        <#list pageFacets.commonfacets as item>
        <#assign pageFacetsCommon_choose = "" />
        <#list item.items as childItem>
            <#if childItem_has_next>
                <#assign spaceSplite = "、" />
            <#else>
                <#assign spaceSplite = "" />
            </#if>
            <#assign pageFacetsCommon_choose = pageFacetsCommon_choose+ "${childItem.value!}${spaceSplite!}" />
        </#list>
        <li><a  data-code="9000001100-3" href="${varHostName!}${item.url!}"><i>×</i><em>${item.label!}：</em>${pageFacetsCommon_choose!}</a></li>
        </#list>
        </#if>
    </ul>
    <a href="javascript:void(0)" class="facetsCurrent-prev fc-btn"></a>
    <a href="javascript:void(0)" class="facetsCurrent-next fc-btn"></a>
</div>