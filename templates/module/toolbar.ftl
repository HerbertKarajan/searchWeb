<#if (searchObj.content.toolBar)??>
    <#assign instock = searchObj.content.toolBar.instock><#--是否为有货商品-->
    <#assign deliv = searchObj.content.toolBar.deliv><#--是否为国美自营商品-->
    <#assign market = searchObj.content.toolBar.market><#--是否为海外购商品-->
    <#assign discountQiang = searchObj.content.toolBar.sale.grabGroup><#--是否为聚划算商品-->
    <#assign discountPromo = searchObj.content.toolBar.sale.promo><#--是否为促销活动商品-->
    <#assign discountRebate = searchObj.content.toolBar.sale.rebate><#--是否为返利活动商品-->
    <#--定义页面排序综合、销量、新品、评价、价格规则-->
    <#assign sort = searchObj.content.toolBar.sort>
</#if>
<#assign modelId = "9000000600"/>
<#--初始页面为综合排序-->
<#if (sort)?? && (sort.default.isDefault)??>
    <#assign defaultClassName = "cur">
</#if>
<#--初始页面为销量排序-->
<#if (sort)?? && (sort.sale.isDefault)??>
    <#assign saleClassName = "cur">
</#if>
<#--初始页面为新品排序-->
<#if (sort)?? && (sort.startDate.isDefault)??>
    <#assign startDateClassName = "cur">
</#if>
<#--初始页面为评价排序-->
<#if (sort)?? && (sort.evaluateCount.isDefault)??>
    <#assign evaluateCountClassName = "cur">
</#if>
<#--初始页面为价格排序-->
<#if (sort)?? && (sort.price.isDefault)??>
    <#if sort.price.sort == "21">
        <#assign priceClassName = "cur price-up">
        <#assign priceSort = 20>
    <#else>
        <#assign priceClassName = "cur price-down">
        <#assign priceSort = 21>
    </#if>
<#else>
    <#assign priceSort = 21>
</#if>
<div style="height:74px">
<div id="filter-box" modelid="${modelId!}">
    <div id="filter-top" class="filter-top clearfix">
        <ul class="filter-order-box" id="filter-order-box">
            <li id="sort-general" class="${defaultClassName!}" data-sort="00"><a href="${(sort.default.url)!}" data-href="${(sort.default.url)!}">综合</a></li>
            <li class="${saleClassName!}" data-sort="10"><a href="${(sort.sale.url)!}" data-href="${(sort.sale.url)!}">销量</a></li>
            <li class="${startDateClassName!}" data-sort="30"><a href="${(sort.startDate.url)!}" data-href="${(sort.startDate.url)!}">新品</a></li>
            <li class="${evaluateCountClassName!}" data-sort="50"><a href="${(sort.evaluateCount.url)!}" data-href="${(sort.evaluateCount.url)!}">评价</a></li>
            <li id="sort-price" class="${priceClassName!}" data-sort="${priceSort!}" prdUrl1="${(sort.price.url1)!}" prdUrl2="${(sort.price.url2)!}"><a data-href ="${(sort.price.url1)!}">价格</a><i class="icon-up-down"></i></li>
        </ul>
        <#--价格区间-->
        <#if searchObj.content.selectData.price??>
            <#assign highPrice = searchObj.content.selectData.price.highPrice?replace('*','¥')>
            <#assign lowPrice = searchObj.content.selectData.price.lowPrice>
        </#if>
        <ul class="filter-priceRange-box clearfix">
            <li class="priceRange-input"><input id="fc-lowPrice" maxlength="6" type="text" value="${lowPrice?default('¥')}" /></li>
            <li class="priceRange-link">-</li>
            <li class="priceRange-input"><input id="fc-highPrice" type="text" maxlength="6" value="${highPrice?default('¥')}" /></li>
            <li class="priceRange-btn"><a id="fc-btn-cancel" class="fc-btn-cancel" href="javascript:void(0)">清除</a></li>
            <li class="priceRange-btn"><a id="fc-btn-ok" class="fc-btn-ok" href="javascript:void(0)">确定</a></li>
        </ul>
        <#--在结果中搜素哦-->
        <#assign et = (searchReq.et)! />
        <div class="filter-resultSearch-box">
            <input type="text" value="${et!}" class="filter-resultSearch-input" />
            <a data-code="${modelId!}-0" href="javascript:void(0)" class="filter-resultSearch-btn">确定</a>
        </div>
        <#--小分页-->
        <div class="min-pager-box">
            <a href="javascript:void(0)" class="min-pager-next <#if searchObj.content.pageBar.totalPage == 1>mp-disable</#if>" id="mp-next">&gt;</a>
            <a href="javascript:void(0)" class="min-pager-prev mp-disable" id="mp-prev">&lt;</a>
            <span class="min-pager-number" id="min-pager-number">${(searchObj.content.pageBar.pageNumber)!}/${(searchObj.content.pageBar.totalPage)!}</span>
        </div>
    </div>
    <div id="filter-bottom" class="filter-bottom">
        <div class="filter-adress-box">
            <span class="filter-adress-tit">送至：</span>
            <span id="address" class="filter-adress-stock">
                <a id="stockaddress" href="javascript:void(0);">请选择</a>
                <i class="filter-adress-icon"></i>
                <em class="space"></em>
            </span>
            <div class="gCity clearfix"></div>
        </div>
        <div class="filter-label-box">
            <#if (instock)?? && instock.isDefault>
                <#assign instoclChecked = "checke">
            </#if>
            <#if (deliv)?? && (deliv.delivGome.isDefault)??>
                <#assign delivUrl = deliv.delivAll.url>
                <#assign delivChecked = "checke">
            <#elseif (deliv)??>
                <#assign delivUrl = deliv.delivGome.url>
            </#if>
            <#if (market)?? && market.isDefault>
                <#assign marketChecked = "checke">
            </#if>
            <#if (discountPromo)?? && (discountPromo.isDefault)??>
                <#assign discountPromoChecked = "checke">
            </#if>
            <#if (discountQiang)?? && (discountQiang.isDefault)??>
                <#assign discountQiangChecked = "checke">
            </#if>
            <#if (discountRebate)?? && (discountRebate.isDefault)??>
                <#assign discountRebateChecked = "checke">
            </#if>
            <#if isGomehigo>
                <#assign hideDom = "hide-dom">
            </#if>
            <#if (searchObj.content.toolBar.aggHwg)?? && (searchObj.content.toolBar.aggHwg == 0)>
                <#assign hidegwg = "hide-dom">
            </#if>
            <a class="gmform-label ${delivChecked!} ${hideDom!}" id="deliv" data-code="${modelId!}-10" href="${varHostName!}${delivUrl!}"><i class="iic"></i>国美自营</a>
            <a class="gmform-label ${instoclChecked!}" id="instock" data-code="${modelId!}-11" data-href="${varHostName!}" href="${varHostName!}${(instock.url)!}"><i class="iic"></i>仅显示有货</a>
            <#--<a class="gmform-label ${discountPromoChecked!} ${hideDom!}" id="discountPromo" data-code="${modelId!}-12" href="${(discountPromo.url)!}"><i class="iic"></i>促销商品</a>-->
            <a class="gmform-label ${discountQiangChecked!} ${hideDom!}" id="discountQiang" data-code="${modelId!}-13" href="${varHostName!}${(discountQiang.url)!}"><i class="iic"></i>真划算</a>
            <#if (searchObj.content.selectData.isSearch)>
            <a class="gmform-label ${marketChecked!} ${hideDom!} ${hidegwg!}" id="market" data-code="${modelId!}-14" href="${varHostName!}${(market.url)!}"><i class="iic"></i>海外购</a>
            </#if>
            <a class="gmform-label ${discountRebateChecked!} ${hideDom!}" id="discountRebate" data-code="${modelId!}-15" href="${varHostName!}${(discountRebate.url)!}"><i class="iic"></i>返利</a>
            <#if ((searchObj.content.promoInfo)?? && searchObj.content.promoInfo[0]??)>
                <label class="gmform-label filter-label-specialScreening ${hideDom!}" for="specialScreening" id="specialScreening" data-code="${modelId!}-15"><i class="iic"></i>
                    <#if (searchObj.content.promoInfo[0].imgUrl !="")>
                        <img src="${(searchObj.content.promoInfo[0].imgUrl)!}" style="height:23px;">
                    <#else>
                    ${(searchObj.content.promoInfo[0].text)!}
                    </#if>
                </label>
            </#if>
        </div>
    </div>
</div>
</div>
<div class="product-showmore" style="display: none">已为您智能筛选出热门品类商品 <a href="javascript:;" title="查看更多商品">查看更多商品</a></div>