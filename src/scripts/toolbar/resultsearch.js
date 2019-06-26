/**
 * 在结果中搜搜
 * 【一】屏蔽特殊字符，注册回车事件，获取焦点，失去焦点
 * 【二】【确定】按钮，调用function.makeHelf模块处理跳转地址
 */
$(".filter-resultSearch-box").show()
$(".filter-resultSearch-input").bind({
    "keyup": function(event) {
        if (event.which == 13) {
            $(".filter-resultSearch-btn").trigger("click");
        } else {
            $(this).val($(this).val().replace(/[`~!@#$%^&*_+=¥￥（）()<>?:"{},\/;'[\]！，——‘；—【】|？》《“：\\\-” ]/g,''))
        }
    },
    "focus": function() {
        $(this).val() == "在结果中搜索" && $(this).val("");
    },
    "blur": function() {
        $(this).val() == "" && $(this).val("在结果中搜索");
    }
}).trigger("blur");
$(".filter-resultSearch-btn").bind("click", function(e) {
    e.preventDefault();
    var searchVal = $(".filter-resultSearch-input").val();
    if (searchVal == "" || searchVal == "在结果中搜索") return false;
    require('../function/makeHelf').dofacet('et',searchVal);
});