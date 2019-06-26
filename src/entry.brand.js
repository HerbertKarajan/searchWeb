if(pageData.isBW){
    pageData.dataBW = require('./scripts/goods/getShopGoods').getShopGoods(pageData.ajaxURL,1,pageData.valueBW);
}
setTimeout(function(){
    require('./scripts/goods/getGoods').getGoods();
},0);
//引入facet相关模块
require("./scripts/facet/normal");
//引入toolbar相关模块
require("./scripts/toolbar/normal");
require("./scripts/toolbar/pricerange");
// 块-价格获取，懒加载图片
require("./scripts/goods/lazyInfoGoods");
//引入页面事件的模块-商品事件
require("./scripts/goods/eventGoods");
//引入大数据推荐的模块
if(pageData.isResult){
    require("./scripts/about/bigdata/category/dsp.promotion");//右侧店铺精选和底部的推广商品
    require("./scripts/about/bigdata/search/bigdata.hotsale").getData("#prdRight-2");//右侧热销推荐
    require("./scripts/about/bigdata/category/bigdata.lookandbuy").getData("#prdRight-3");//右侧浏览了还购买商品
}else{
    require("./scripts/about/bigdata/search/bigdata.hotsale.noresult").getData("#prdBottom-1");//无结果情况底部热销推荐
}
//底部延迟触发请求
document.getElementById("lazyajaxloadarea").onmouseover = function (event) {
    this.style.display = "none";
    require("./scripts/about/bigdata/category/bigdata.quessyoulike").getData("#prdBottom-2");//猜你喜欢
    require("./scripts/about/servicedata/recentview").getData("list","#prdBottom-recent");//最近浏览
    this.style.display = "none"
};