/**
 * [description]
 * 根据不同筛选条件，设置页面跳转地址，包括facet多选，特殊活动，价格区间，在结果中搜索(仅结果页)
 * &pzpq=0&pzin=v5 用于品牌预测的时候用
 * queryString:筛选字段facets，promoFlag，price，et(仅搜索结果页调用)
 * valueString：修改的值，（promoFlag仅限0,1）
 *
 * 20170516 bug: 去掉在结果搜索，调整至resultsearch.js
 */
define(function(require,exports,module){
    var href = window.location.search;
    var queryRelation = {"facets":9,"promoFlag":10,"price":6}; //搜索页面url的query与列表页url中对应query的index位置
    var pageCategoryQueryArray = [];
    function assembleHref(queryString,valueString){
        var reg = new RegExp("(^|&)" + queryString + "=([^&]*)(&|$)", "i");
        var replaceContent = "";
        var searchPragram = "";
        switch(window.pageName){
            case "搜索结果页":
                var r =href.substr(1).match(reg);
                if(r!= null){
                    if(queryString=="facets"){
                        valueString+=r[2];
                    }

                    href= href.replace("&"+queryString+"="+r[2],"&"+queryString+"="+valueString);
                }else{
                    if(pageData.brandFacet != ""){
                        if(queryString=="facets"){
                            valueString += pageData.brandFacet
                        }else{
                            valueString += "&facets="+pageData.brandFacet
                        }
                    }
                    if(queryString=="price"){
                        valueString +="&priceTag=1"
                    }
                    href = href.replace("&pzpq=0&pzin=v5","")+"&"+queryString+"="+valueString+"&pzpq=0&pzin=v5"
                }
                break;
            case "海外购搜索结果页":
                var r =href.substr(1).match(reg);
                if (r != null && queryString == "facets"){
                    replaceContent = "&"+queryString+"="+unescape(r[2])+valueString+"&";
                }else{
                    replaceContent = "&"+queryString+"="+valueString+"&";
                }
              //href = (href.indexOf(queryString)!= -1)? href.replace(reg, replaceContent) : href+ "&"+queryString+"="+pageData.defaultFacets+valueString+(queryString=="price"?"&priceTag=1":"")+"&pzpq=0&pzin=v5";
                href = (href.indexOf(queryString)!= -1)? href.replace(reg, replaceContent) : href+ "&"+queryString+"="+valueString+(queryString=="price"?"&priceTag=1":"")+"&pzpq=0&pzin=v5";
                break;
            case "三级列表页":
                href = window.location.pathname;
                if(href.split("-").length <= 1){
                    href = href.split(".html")[0] + "-00-0-48-1-0-0-0-1-0-0-0-0-0-0-0-0-0.html";
                }
                pageCategoryQueryArray = href.split("-");
                if (queryString === "facets" && pageCategoryQueryArray[9] !== "0"){
                    pageCategoryQueryArray[queryRelation[queryString]] += valueString;
                }else{
                    pageCategoryQueryArray[queryRelation[queryString]] = valueString;
                    if(queryString === "price") pageCategoryQueryArray[7] = "1";
                }
                href = pageCategoryQueryArray.join("-");
                break;
            case "海外购三级列表页":
                href = window.location.pathname;
                if(href.split("-").length <= 1){
                    href = href.split(".html")[0] + "-00-0-48-1-0-0-0-1-0-0-0-11-0-0-0-0-0.html";
                }
                pageCategoryQueryArray = href.split("-");
                if (queryString === "facets" && pageCategoryQueryArray[9] !== "0"){
                    pageCategoryQueryArray[queryRelation[queryString]] += valueString;
                }else{
                    pageCategoryQueryArray[queryRelation[queryString]] = valueString;
                    if(queryString === "price") pageCategoryQueryArray[7] = "1";
                }
                href = pageCategoryQueryArray.join("-");
                break;
            case "品牌商品页":
                //href = window.location.protocol+"//search"+cookieDomain+"/search?question="+pageData.searchkey + "&" + queryString + "=" + pageData.brandId  + valueString +"&pzpq=0&pzin=v5";
                href = window.location.protocol+"//search"+cookieDomain+"/search?question="+pageData.searchkey + "&" + queryString + "="+ valueString +"&pzpq=0&pzin=v5";
                break;
        }
        window.location.href = href;
    }
    module.exports = {
        dofacet:assembleHref
    }
});