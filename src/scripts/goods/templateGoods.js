/**
 * [getTemplate description] 商品单体模板
 * @param  {[type]} op [description] normal:普通商品 taogou:套装商品 默认隐藏 multi:多sku商品
 * @return {[type]}    [description]
 */
function getTemplate(op){
    return '<div class="item-tab asynPriceBox'+(op == "taogou"?" taoStyle":"")+'" isBigImg="{{if $value.isBigImg}}true{{/if}}" >\
        {{if $value.isBigImg}}\
            <p class="item-pic bigp"><a class="item-link" rel="nofollow"  href="{{$value.sUrl}}" target="_blank" data-code="{{modelid}}-{{pageNumber}}_{{$index+1}}_1" title="{{$value.alt}}"><img gome-src="{{$value.sImg}}_275.jpg" alt="{{$value.alt}}" src="//img.gomein.net.cn/images/grey.gif"></a></p>\
        {{else}}\
            <p class="item-pic"><a class="item-link" rel="nofollow" href="{{$value.sUrl}}" target="_blank" data-code="{{modelid}}-{{pageNumber}}_{{$index+1}}_1" title="{{$value.alt}}"><img gome-src="{{$value.sImg}}_210.jpg" src="//img.gomein.net.cn/images/grey.gif" alt="{{$value.alt}}"></a>{{if $value.energyTag == 1}}<span class="save-energy"></span>{{/if}}</p>\
        {{/if}}\
        {{if $value.isMulti && $value.images.length>0}}\
            <div class="item-pic-small-box" index="{{if $value.images.length > 9}}9{{else}}{{$value.images.length}}{{/if}}" curIndex="{{if $value.images.length > 9}}9{{else}}{{$value.images.length}}{{/if}}">\
                {{if $value.images.length> 5 }}\
                <a href="javascript:void(0);" class="icon-prev disable"></a>\
                <a href="javascript:void(0);" class="icon-next"></a>\
                {{/if}}\
                <div class="item-pic-small-wrap">\
                    <ul class="imgList">\
                    {{each $value.images}}\
                    {{if $index < 10}}\
                        <li class="icon-li" sid="{{$value.skuId}}" d_src="{{$value.sImg}}" sid="{{$value.skuId}}" surl="{{$value.sUrl}}" skuNo="{{$value.skuNo}}">\
                        <img  gome-src="{{$value.sImg}}_30.jpg" alt="{{$value.color}}" src="//img.gomein.net.cn/images/grey.gif" />\
                        <div class="icon-li-price hide-dom"></div>\
                        <div class="icon-li-promotion hide-dom"></div>\
                        </li>\
                    {{/if}}\
                    {{/each}}\
                    </ul>\
                </div>\
            </div>\
        {{/if}}\
        <div class="item-price-info">\
            <p class="item-price">\
            {{if $value.stock==3}}\
            <span class="price" pid="{{$value.pId}}" skuid="{{$value.skuId}}">敬请期待</span>\
            {{else}}\
            <span class="price asynPrice" pid="{{$value.pId}}" skuid="{{$value.skuId}}"></span>\
            {{/if}}\
            {{if $value.isVip == 1}}\
            <span class="promotion-normal">会员价</span>\
            {{/if}}\
            {{if $value.rebate == 1}}\
            <span class="promotion-normal">返利</span>\
            {{/if}}\
            </p>\
        </div>\
        <p class="item-name"><a rel="nofollow" class="item-link" data-code="{{modelid}}-{{pageNumber}}_{{$index+1}}_1" href="{{$value.sUrl}}" target="_blank" title="{{$value.alt}}">{{#$value.name}}</a></p>\
        {{if $value.promoDesc !=""}}\
        <p class="item-promotional-language">\
            <!--{{if $value.promoTags && $value.promoTags != null && $value.promoTags.promoType && $value.promoTags.promoType == 2}}\
                【{{$value.promoTags.promoPrice}}手机专享价】\
            {{/if}}-->\
            {{$value.promoDesc}}\
        </p>\
        {{/if}}\
        <p {{if $value.isBigImg}}class="item-comment-dispatching bigger"{{else}}class="item-comment-dispatching"{{/if}}>\
            {{if $value.stock==0 || noSkusStock}}\
            <span class="dispatchingbox"></span>\
            <span class="dispatching item-productnone">{{$value.cityName}}无货</span>\
            {{else if $value.stock==1}}\
            <span class="dispatching"></span>\
            {{else if $value.stock==2}}\
            <span class="dispatchingbox"></span>\
            <span class="dispatching nOrange item-productnone">{{$value.cityName}}暂不支持配送</span>\
            {{else if $value.stock==3 || $value.stock==6}}\
            <span class="dispatchingbox"></span>\
            <span class="dispatching nOrange item-productnone">正在预约中</span>\
            {{else if $value.stock==4}}\
            <span class="dispatchingbox"></span>\
            <span class="dispatching nHeigh item-productnone">正在抢购中</span>\
            {{else}}\
            <span class="dispatchingbox"></span>\
            <span class="dispatching item-productnone">{{$value.cityName}}无货</span>\
            {{/if}}\
            <a href="{{$value.sUrl}}#j-comment-section" target="_blank" class="comment" data-code="{{modelid}}-{{pageNumber}}_{{$index+1}}_2"><span class="grey">已有</span>{{$value.evaluateCount}}<span class="grey">人评价</span></a>\
        </p>\
        <p class="item-shop">\
        {{if $value.thirdProduct}}\
            {{if $value.shopId =="80009736" || $value.shopId =="80010355" || $value.shopId =="80010423"}}\
                <span class="hyg-shopType">自营</span>\
            {{/if}}\
            {{if $value.mallTag =="1"}}<span class="brandtip">品牌直营</span>{{/if}}\
            {{if $value.goodsType == "ZC2M"}}\
                <span class="promotion-c2m"></span>\
            {{/if}}\
            {{if $value.marketTag == 1}}\
                {{if !$value.shopFlag || $value.shopFlag < 5}}<span class="promotion-hwg"></span>{{/if}}\
            {{/if}}\
            {{if $value.sName}}\
                <a class="nname" data-code="{{modelid}}-{{pageNumber}}_{{$index+1}}_4" target="_blank" href="{{$value.mUrl}}">{{$value.sName}}</a>\
            {{/if}}\
        {{else}}\
            <span class="nnamezy">自营</span>\
            {{if $value.goodsType == "ZC2M"}}\
            <span class="promotion-c2m"></span>\
            {{/if}}\
            {{if $value.marketTag == 1}}\
                {{if !$value.shopFlag || $value.shopFlag < 5}}<span class="promotion-hwg"></span>{{/if}}\
            {{/if}}\
            {{if $value.sName}}\
            <a class="nname" data-code="{{modelid}}-{{pageNumber}}_{{$index+1}}_4" target="_blank" href="{{$value.mUrl}}">{{$value.sName}}</a>\
            {{/if}}\
        {{/if}}\
        </p>\
        <p class="item-promotion"></p>\
        <p class="item-option clearfix">\
            <span class="add-contrast" cid="{{$value.pId}}/{{$value.skuId}}" title="对比"><i class="icon"></i></span>\
            <span class="add-collection" pid="{{$value.pId}}" skuid="{{$value.skuId}}" pname="{{$value.name}}" title="收藏"><i class="icon"></i></span>\
            {{if $value.stock == 0 || noSkusStock}}\
            <span class="add-cart next-buy" pid="{{$value.pId}}" skuid="{{$value.skuId}}" title="到货通知"><i class="notice"></i></span>\
            {{else if $value.stock == 2 || $value.stock == 3 || $value.stock == 4 || $value.stock == 6}}\
            <i></i>\
            {{else}}\
            <a class="add-cart addTo-cart" href="javascript:void(0);" isMCard="{{$value.gomeCardType}}" shopFlag="{{$value.shopFlag}}" isHyg="{{$value.marketTag}}" pid="{{$value.pId}}" skuid="{{$value.skuId}}" taoType="{{$value.taoType}}" taoSkuId="{{$value.taoSkuId}}" data-code="{{pageType}}-{{modelid}}-{{pageNumber}}_{{$index+1}}_3" title="加入购物车"><i class="icon"></i></a>\
            {{/if}}\
            <span class="gomekf"><a href="javascript:void(0)" title="咨询" class="online-server1 online-robot"><i class="icon"></i></a></span>\
        </p>\
    </div>\
    ';
}
module.exports = {
    getTemplate:getTemplate
}
