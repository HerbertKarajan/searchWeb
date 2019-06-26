<#--品牌分类facets 分类列表和搜索结果页面都有-->
<#assign brandprofix = (searchObj.content.facets.brandprofix)!>
<#assign brands = (searchObj.content.facets.brand)!>
<div id="facets-category-brand" class="facets-category clearfix">
    <div class="fc-option">
        <span class="fc-option-multiple">多选</span>
        <span class="fc-option-more" <#if brands.items?size &gt; 16>style="visibility: visible"</#if>><i></i>更多</span>
    </div>
    <span class="fc-key"><b>${brands.label!}：</b></span>
    <div class="fc-content">
        <ul class="category-brand-f-letter clearfix" style>
            <li class="all cur" brand-key="all">所有品牌</li>
            <#if brandprofix.blist??>
            <#list brandprofix.blist as item>
                <#if brandprofix.prefixItem[item]??>
                <li brand-key="${item!}">${item!}</li>
                </#if>
            </#list>
            </#if>
        </ul>
        <ul class="category-brand clearfix" style="position: relative;">
            <#if brands.items??>
                <#list brands.items as item>
                    <li class="c-brand <#if (item_index>= 16)>brand-hide</#if>"  brand-value="${item.prefix!}">
                    <#if item.brandImg?? && item.brandImg !="">
                        <#assign brandStyle = "background-image:url(${item.brandImg!})">
                    <#else>
                        <#assign brandStyle = "text-indent:0">
                    </#if>
                        <a id="brandID${item.id!}" data-code="9000000200-${(item_index)!}" facetsId="${item.id!}" href="${varHostName!}${item.url!}" class="facet" name="${item.value!}" style="${brandStyle!}">${item.value!}<i></i></a>
                    </li>
                </#list>
            </#if>
        </ul>
        <ul class="category-brand-hasCheck clearfix" id="category-brand-hasCheck">
            <li class="hasCheckedTit">已选：</li>
        </ul>
        <div class="fc-btn-box">
            <a class="fc-btn-ok  fc-disable" href="javascript:void(0)">确定</a>
            <a class="fc-btn-cancel" href="javascript:void(0)">取消</a>
        </div>
    </div>
</div>