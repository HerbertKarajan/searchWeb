<div class="product-box">
<div class="product-waiting" id="product-waiting"></div>
    <ul class="product-lists clearfix" id="product-box">
    <#if (searchObj.content.prodInfo.products)??>
        <#list searchObj.content.prodInfo.products as prd>
        <li class="product-item">
            <ul class="arbitrage clearfix"></ul>
            <div class="item-tab-warp">
                <p class="item-pic"><a class="emcodeItem item-link" target="_blank" track="产品列表图片" href="${(prd.sUrl)!}"  title="${(prd.alt)?html}"><img gome-src="${(prd.sImg)!}_210.jpg" alt="${(prd.alt)?html}" src="${greyGif!}"></a></p>
                <div class="item-price-info">
                    <div class="item-price">
                        <span class="price"></span>
                    </div>
                </div>
                <p class="item-name"><a class="emcodeItem item-link"  href="${(prd.sUrl)!}" title="${(prd.alt)?html}" target="_blank">${(prd.name)!}</a></p>
                <p class="item-comment-dispatching">
                    <#--<span class="dispatching">${(prd.skus.cityName)!}有货</span>-->
                    <a href="${(prd.sUrl)!}#j-comment-section" target="_blank" class="comment">${(prd.evaluateCount)!}</a>
                </p>
                <p class="item-shop">
                    <#if (prd.thirdProduct??) && (prd.thirdProduct)>
                        <a class="nname" target="_blank" href="${(prd.mUrl)!}">${(prd.sName)!}</a>
                    <#else>
                        <span class="nnamezy">自营</span>
                    </#if>
                </p>
                <p class="item-option clearfix">
                    <span class="add-contrast display-page-compare-checkbox"><i class="icon"></i></span>
                    <span class="add-collection"><i class="icon"></i></span>
                    <span class="add-cart addTo-cart"><i class="icon"></i></span>
                </p>
            </div>
        </li>
        </#list>
    </#if>
    </ul>
    <div class="clearfix" id="product-pager">
        <div class="pager" id="j-page"></div>
    </div>
</div>