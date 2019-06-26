/**
 * 价格区间筛选处理事件
 * 【一】输入框设置，屏蔽特殊字符，获取焦点，失去焦点
 * 【二】移出价格区间区域，修改样式
 * 【三】【取消】按钮事件
 * 【四】【确定】按钮事件，调用function.makeHelf模块处理跳转地址
 */
$(".priceRange-input input").bind({
    "keydown": function() {
        $(this).val($(this).val().replace(/[A-Za-z`~!@#$%^&*_+=¥￥（）()<>?:"{},\/;'[\]！。......，…——、‘；—【】|？》《“：\\\-” \u4e00-\u9fa5]/g,''));
    },
    "keyup": function() {
        $(this).val($(this).val().replace(/[A-Za-z`~!@#$%^&*_+=¥￥（）()<>?:"{},\/;'[\]！。......，…——、‘；—【】|？》《“：\\\-” \u4e00-\u9fa5]/g,''));
    },
    "focus": function() {
        $(".filter-priceRange-box").addClass("filter-priceRange-click");
    },
    "blur": function() {
        $(this).val() == "" && $(this).val("¥");
    }
});
$(".filter-priceRange-box").bind("mouseleave",function() {
    $(this).removeClass("filter-priceRange-click");
    $(".priceRange-input input").trigger("blur");
}).show();
$("#fc-btn-cancel").bind("click", function() {
    $(".priceRange-input input").val("¥")
});
$("#fc-btn-ok").bind("click", function(event) {
    event.preventDefault();
    var priceRange = "";
    var price1 = $("#fc-lowPrice").val();
    var price2 = $("#fc-highPrice").val();
    if(price2 == "¥" && price1 == "¥"){
        return false;
    }else if(price1 == "¥"){
        priceRange="0x"+price2;
    }else if(price2 == "¥"){
        priceRange=price1+"x*";
    }else{
        priceRange = Math.min(price1, price2) + "x" + Math.max(price1, price2);
    }
    require('../function/makeHelf').dofacet('price',priceRange);
});