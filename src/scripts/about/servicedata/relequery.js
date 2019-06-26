/**
 * 搜索结果页，底部重新栏内的相关搜索词，并且覆盖共同头部的推荐词
 * */
function getQueryString(name){
    var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if(r!=null){
        return decodeURI(r[2]);
    }
    return null;
};

function getReleQuery(keyword){
    $.ajax({
        type: "get",
        dataType: "jsonp",
        url: pageData.cloudSite + "/cloud/releQuery",
        data: {
            question: keyword
        }
    }).done(function(data){
        var headKeyword = "";
        var html = '';
        if (data.releData) {
            var _data = data.releData.rList;
            for (var i = 0, j = _data.length; i < j && i<10; i++) {
                html += '<li class="related-key"><a href="//search'+cookieDomain+'/search?question=' + encodeURIComponent(_data[i].key) + '&from=releQuery&intcmp=search-9000000800-'+i+'" target="_blank">' + _data[i].key + '</a></li>';
                headKeyword += '<a href="/search?question=' + _data[i].key + '&from=releQuery&intcmp=search-9000001000-'+i+'" target="_blank">'+ _data[i].key +'</a>';
            }
            $("#topSearch .hotkeyword").empty().append(headKeyword);
            $("#related-list").append(html);
        } else {
            $("#related-list").hide();
        }
        $("#topSearch .hotkeyword").css('visibility','visible');
    })
};
$("#search-box-input").bind({
    "keyup": function(event) {
        if (event.which == 13) {
            $("#search-box-btn").click()
        } else {
            var txt=$(this).val();
            $(this).val(txt.replace(/[`~!@#$%^&*_+=¥￥（）()<>?:"{},\/;'[\]！。......，…——、‘；—【】|？》《“：\\\-”]/g,''))
        }
        //showSearchType();
    },
    "blur": function() {
        if ($(this).val() == "") {
            $(this).val($(this).attr("defaultVal"))
        }
    }
});
/*$("#search-box-btn").bind("click",function(){
    window.location.href = "/search?intcmp=search-9000000801-0&question="+ $("#search-box-input").val();
});*/
var $searchTypeDropdownbot = $('.search-type-dropdownbot'),//搜索类型下拉组件
    $searchBotType= $searchTypeDropdownbot.find('#searchBotType'),//搜索类型
    $searchTypeSelectedbot = $searchTypeDropdownbot.find('.search-type-selected'),//被选中的搜索值
    $searchTypeListbot = $searchTypeDropdownbot.find('.search-type-list'),//搜索类型List
    searchTypebotTimer;

function showSearchType(){
    var self = this;
    var searchType = getQueryString('searchType');
    var keyword = '';

    switch(searchType){
        case 'group':
            keyword = getQueryString('word');
            if(keyword){
                $searchTypeSelectedbot.text('圈子').attr('data-selected','group');
                //self.$elem.val(keyword);
            }
            break;
        case 'topic':
            keyword = getQueryString('word');
            if(keyword){
                $searchTypeSelectedbot.text('话题').attr('data-selected','topic');
                //self.$elem.val(keyword);
            }
            break;
        case 'shop':
            keyword = getQueryString('shop');
            if(keyword){
                $searchTypeSelectedbot.text('店铺').attr('data-selected','shop');
                //self.$elem.val(keyword);
            }
            break;
        default:
            $searchTypeSelectedbot.text('商品').attr('data-selected','goods');
            keyword = getQueryString('question');
            if(keyword){
                //self.$elem.val(keyword);
            }
    }
};
showSearchType();
    $searchTypeListbot
        .on('click','li',function(){
            $searchTypeSelectedbot.text($(this).text()).attr('data-selected',$(this).attr('data-selector'));
            $searchTypeListbot.hide();
    });

    $searchTypeListbot.hover(function(){
        searchTypebotTimer && clearTimeout(searchTypebotTimer);
    },function(){
        $searchTypeListbot.hide();
    });

//为选中的搜索类型绑定点击事件
    $searchBotType.hover(function(){
        $searchTypeListbot.show();
    },function(){
        searchTypebotTimer = setTimeout(function(){
            $searchTypeListbot.hide();
        },50);
    });
//点击搜索
$("#search-box-btn").click(function(){
    var currentTypebot = $searchTypeSelectedbot.attr('data-selected');
    var searchbotUrlObj = {
        goods: '//search'+cookieDomain+'/search?intcmp=search-9000000801-0&question=',
        group: '//group'+cookieDomain+'/search/group?intcmp=search-9000000801-0&word=',
        topic: '//group'+cookieDomain+'/search/topics?intcmp=search-9000000801-0&word=',
        shop: '//search'+cookieDomain+'/search?intcmp=search-9000000801-0&shop='
    };
    var inputbotKey = $("#search-box-input").val();
    if(currentTypebot === 'goods' && $.trim(inputbotKey) === ''){
        var defaultKey = $("#keyLabel").text();
        $("#search-box-input").val(defaultKey);
        inputbotKey = defaultKey;
    }
    if(inputbotKey.length>40){
        inputbotKey = inputbotKey.substring(0,40);
        $("#searchInput").val(inputbotKey);
    }
    if ($.trim(inputbotKey) !== '') {
        location.href = searchbotUrlObj[currentTypebot] + inputbotKey + '&searchType=' + currentTypebot;
    }
    return false;
});
module.exports = {
    getReleQuery:getReleQuery
};