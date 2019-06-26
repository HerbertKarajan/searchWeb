<#--横向展示分类结构-->
<div class="facets-category facets-category-common ${displayType!} clearfix">
    <div class="fc-option">
        <span class="fc-option-multiple">多选</span>
        <span class="fc-option-more"><i></i>更多</span>
    </div>
    <span class="fc-key ${facethotitem!}fir" facetsId="${thisFacets.id!}">${thisFacets.label!}${thisFacets.name!}：</span>
    <div class="fc-content">
        <div class="category-normal">
            <ul class="clearfix" modelid="${modelId!}">
                <#list thisFacets.items as item>
                    <li><a class="facet ${facethotitem!}" data-code="9000000500-${(item_index)!}" href="${varHostName!}${(item.url)!}" facetsId="${item.id!}"><i></i>${item.value!}${item.name!}</a></li>
                </#list>
            </ul>
        </div>
        <div class="fc-btn-box">
            <a class="fc-btn-ok fc-disable" href="javascript:void(0)">确定</a>
            <a class="fc-btn-cancel" href="javascript:void(0)">取消</a>
        </div>
    </div>
</div>