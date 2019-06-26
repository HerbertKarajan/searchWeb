/**
 * [description]
 * 页面初始时，根据标识searchObj.header.searchReq.bwSec 判断是否请求页面底部用于补位的联营商品
 * 如果请求则请求结果存放于pageData.bwsData，用于综合第一页请求时底部替换商品
 */

function getShopGoods(url,pageNumber,bwValue){
    var bwsData = [];
    var bwsString = "";
    $.ajax({
        url:url,
        dataType:"json",
        async:false,
        data:{page:pageNumber,bws:bwValue,type:"json"}
    }).done(function(data){
        if(data.content.prodInfo && data.content.prodInfo.products){
            bwsData = data.content.prodInfo.products;
            for(var i = 0,j= bwsData.length;i<j;i++){
                bwsString += '"'+bwsData[i].pId+'"'
            }
            bwsString = "["+bwsString+"]";
        }
    });
    return {
        "bwsData":bwsData,
        "bwsString":bwsString
    }
}

module.exports = {
    getShopGoods:getShopGoods
}