module.exports = {
    tpl:'{{each lst as value}}\
            <li class="buy-items">\
                <div class="pic"><a class="bigD_item" track="{{value.maima_param}}" href="{{value.purl}}" target="_blank"><img gome-src="{{value.iurl}}" src="//img.gomein.net.cn/images/grey.gif"></a></div>\
                <div class="price">¥<span>{{value.price}}</span></div>\
                <div class="name"><a class="bigD_item" track="{{value.maima_param}}" href="{{value.purl}}" target="_blank">{{value.pn}}</a></div>\
            </li>\
        {{/each}}'
};