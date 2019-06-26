define(function(require,exports,module){
    /**
     * 【一】给每一个facet盒子（.facets-category）,添加一个存放已选facet参数的属性
     * 【二】初始化设置，包括热门分类，一般分类的更多按钮是否显示
     * 【三】如果一般分类中仅有一个分类，则删除多选按钮
     **/
    $('.facets-category').data('selectFacet','');
    $(".facets-category-common").each(function(){
        var _facetHeight = $(this).find(".category-normal ul").height();
        var _facetNum = $(this).find(".category-normal ul li").length;
        if( _facetHeight > 35){
            $(this).find(".fc-option-more").css("visibility","visible");
        }else{
            $(this).find(".fc-option-more").remove();
        }
        if(_facetNum == 1) {
            $(this).find(".fc-option-multiple").remove();
        }
    });
    /**
     * 初始化已选分类
     * 【一】滑动控制
     * 【二】全部清空按钮操作
     **/
    var moveSt = (function(){
        var space = 0;
        var _li = $(".nSearch-crumb-facetsCurrent").find("li");

        if(pageData.isSearch){
            space = $("#nSearch-crumb-searchNum").width() + $("#nSearch-crumb-keyWord").width() +65;
        }else{
            space = $("#category-first").width() + $("#category-second").width() + $("#category-third").width() +90;
        }
        space =  $(".nSearch-crumb").width()-space;
        /*初始化已选facets样式*/
        if(_li.length>0){
            var _width = 0;
            $(".nSearch-crumb-facetsCurrent").addClass("haschecked");
            for(var i =0,j=_li.length;i<j;i++){
                _width+=_li.eq(i).width()+39;
            }
            if(_li.length >= 2) {
                $("#clearallfacts").show();
                space = space - 110;
            }
            $(".nSearch-crumb-facetsCurrent").width(_width);
            $("#nSearch-crumb-facetsCurrent-warp").width(space);

            if(_width > space){
                $(".facetsCurrent-next").show();
            }
            return space - _width
        }
        return 0;
    })();
    $(".facetsCurrent-next").bind("click",function(){
        $(".nSearch-crumb-facetsCurrent").animate({"left":moveSt+"px"},300,function(){
            $(".facetsCurrent-prev").show();
            $(".facetsCurrent-next").hide();
        });
    });
    $(".facetsCurrent-prev").bind("click",function(){
        $(".nSearch-crumb-facetsCurrent").animate({"left":0},100,function(){
            $(".facetsCurrent-next").show();
            $(".facetsCurrent-prev").hide();
        });
    });
    /**
     * 方法
     * 重置当前已处于多选状态的facet,
    **/
    function clearMultiSelectStatus(){
        $('.multiSelectStatus').find('.fc-btn-cancel').trigger('click');
    };
    /**
     *  按钮点击事件
     * 【一】【多选】按钮，设置当前facet是否为可多选状态
     * 【二】【取消】按钮 对当前分类下的所有已选中的facet触发一次点击事件
     * 【三】【确定】按钮，调用已封装处理参数的方法，跳转页面，具体参数存放在父级facets-category的data('selectFacet')，此参数由该该facet下的具体筛选项设置
     * 【四】【更多】按钮，展示隐藏的facet
     * 【五】【具体筛选项】，根据父级facets-category是否为多选状态（isMultiSelect）。
     *        true：阻止默认href跳转，设置父级facets-category的值，data('selectFacet')
    **/
    $('#module-facet .fc-option-multiple').bind('click',function(){
        clearMultiSelectStatus();
        $(this).parents('.facets-category').data('isMultiSelect',true).addClass('multiSelectStatus');
        $(this).parents('.facets-category').find('.fc-option-more').data('isOpen',false).trigger('click');
    });
    $('#module-facet .fc-btn-cancel').bind('click',function(){
        var _parent = $(this).parents('.facets-category');
        _parent.find('.facet').filter(function(){return $(this).data('isSelect')}).trigger('click');
        _parent.find('.fc-option-more').data("isOpen",true).trigger('click');
        _parent.data('isMultiSelect',false).removeClass('multiSelectStatus');
    });
    $('#module-facet .fc-btn-ok').bind('click',function(){
        var valueString = $(this).parents('.facets-category').data('selectFacet')
        if(valueString){
            require('../function/makeHelf').dofacet('facets',valueString);
        }
    });
    $('#module-facet .fc-option-more').data('isOpen',false).bind('click',function (event) {
        if(!$(this).data("isOpen")){
            $(this).data("isOpen",true).html('<i></i>收起').parents('.facets-category').addClass('moreStatus');
        }else{
            $(this).data("isOpen",false).html('<i></i>更多').parents('.facets-category').removeClass('moreStatus');
        }
    });
    $('#module-facet .facet').bind('click',function(event){
        var _this = $(this),
            _parent = _this.parents('.facets-category'),
            facet_checked = _parent.data('selectFacet');
        if(_parent.data('isMultiSelect')){
            event.preventDefault();
            if(_this.data('isSelect')){
                _this.removeClass('chk');
                _this.data('isSelect',false);
                facet_checked = facet_checked.replace(_this.attr('facetsid'),'');
            }else{
                _this.addClass('chk');
                _this.data('isSelect',true);
                facet_checked += _this.attr('facetsid');
            }
            _parent.data('selectFacet',facet_checked);
        }
    });
    /**
     *  品牌facet相关事件
     * 【一】【已选中品牌facet】点击事件
     * 【二】按字母筛选品牌划过效果
     * 【三】【更多】按钮追加事件，收起时重置隐藏的品牌隐藏
     * 【四】筛选项追加新的点击事件到队列，由于绑定两次事件，所以此处isSelect 值应该为取反操作
    **/
    $('#category-brand-hasCheck').delegate('li','click',function(){
        $('#brandID'+$(this).data('facetId')).trigger('click');
    });
    $('.category-brand-f-letter').find('li').bind({
        'mouseenter':function () {
            var _this = $(this);
            if(!_this.hasClass('all')){
                _this.addClass('cur').siblings("li").removeClass('cur');
                _this.parents('.fc-content').find('.c-brand').addClass('brand-op').filter(function () {
                    return $(this).attr('brand-value') == _this.attr('brand-key')
                }).removeClass('brand-op');
            }else{
                _this.addClass('cur').siblings('li').removeClass('cur');
                _this.parents('.fc-content').find('.brand-op').removeClass('brand-op')
            }
        }
    });
    $("#facets-category-brand .fc-option-more").bind("click", function () {
        $(this).parents('#facets-category-brand').find('.category-brand-f-letter .all').trigger("mouseenter")
    });
    $('#facets-category-brand .facet').bind('click',function(event){
        var _this = $(this);
        if(!_this.data('isSelect')){
            _this.parent('.c-brand').removeClass('lichk');
            $("#category-brand-hasCheck li").filter(function(){
                return _this.attr('facetsid') == $(this).data("facetId");
            }).remove();
        }else{
            _this.parent('.c-brand').addClass('lichk');
            $('<li class="ckes"><i></i>'+_this.attr("name")+'</li>').appendTo("#category-brand-hasCheck").data("facetId",_this.attr('facetsid'));
        }
    });
    /**
     * 聚合分类facet
     * 【一】滑入滑出效果
     * 【二】聚合分类facet的【取消】按钮 追加处理事件
    **/
    $('.category-syn').bind({
        "mouseenter":function(event){
            clearMultiSelectStatus();
            $(this).parents('.facets-category').data('isMultiSelect',true);
            $(this).addClass("category-syn-open");
        },
        "mouseleave":function(event){
            $(this).parents('.facets-category').data('isMultiSelect',false);
            $(this).removeClass('category-syn-open')
        }
    });
    $('.facets-category-syn .fc-btn-cancel').bind('click',function(){
        $(this).parents('.category-syn').removeClass('category-syn-open');
    });
    $('.facets-rele').bind({
        "mouseenter":function(event){
            $(this).parents('.facets-category').data('isMultiSelect',false);
        }
    });
    /**
     * 更多选项显示隐藏处理，仅列表页体现
    **/
    $('#fc-common-show').bind('click', function (event) {
        clearMultiSelectStatus();
        $(this).parents('.fccc-control-warp').addClass('show').siblings(".fc-hide").show();
    });
    $('#fc-common-hide').bind('click', function (event) {
        clearMultiSelectStatus();
        $(this).parents('.fccc-control-warp').removeClass('show').siblings(".fc-hide").hide();
    });

});