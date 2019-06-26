<#--聚合分类结构-->
<dl class="category-syn ${displayType!}">
    <dt class="category-syn-tit">${facetsItem.label!}<i></i></dt>
    <dd class="category-syn-con">
        <ul class="category-syn-list clearfix">
            <#list facetsItem.items as item>
            <li><a class="facet" data-code="9000002400-${(item_index)!}" href="${varHostName!}${(item.url)!}" facetsId="${item.id!}"><i></i>${item.value!}${item.name!}</a></li>
            </#list>
        </ul>
        <p class="category-syn-btn">
            <a href="javascript:void(0)" class="fc-btn-ok  fc-disable">确定</a>
            <a href="javascript:void(0)" class="fc-btn-cancel">取消</a>
        </p>
    </dd>
</dl>