module.exports = {
    tpl:'{{each data as value}}\
        <li class="buy-items">\
        {{if !(value.ds) && !(value.skuid) && !(value.productid)}}\
            <a class="dsp-tgImg" href="{{value.ldp}}" target="_blank"><img gome-src="{{value.src}}" src="//img.gomein.net.cn/images/grey.gif"></a>\
        {{else}}\
            <div class="pic"><a href="{{value.ldp}}" target="_blank"><img gome-src="{{value.src}}" src="//img.gomein.net.cn/images/grey.gif"></a></div>\
            <div class="price">¥<span>{{value.pr}}</span></div>\
            <div class="name"><a href="{{value.ldp}}" target="_blank">{{value.ds}}</a></div>\
            {{if value.adver}}<div class="adver">{{#value.adver}}</div>{{/if}}\
        {{/if}}\
        </li>\
    {{/each}}'
}