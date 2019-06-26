define(function(require,exports,module){
    //如果有筛选条件，页面滚动到筛选部分开始
    $(function(){
        if(pageData.isfilter){
            $('html, body').animate({
                scrollTop: $(".nSearchWarp-main").offset().top+80
            }, 1);
        }
    })
});