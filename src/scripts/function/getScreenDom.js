 /**
 * [getScreenDom 获取可视区域内可见对象]，如获取则此元素success=true，此后将不再获取；
 * @param  {[string]} focusDom       [目标dom标识 class id elementname]
 * @param  {[type]} screenAreaTop    [可视区域上边缘]
 * @param  {[type]} screenAreaBottom [可视区域下边缘]
 * @return {[type]}                  [description]
 */
module.exports = function(focusDom,screenAreaTop,screenAreaBottom){
    return $(focusDom+":visible").filter(function(){
        var _h = $(this).offset().top;
        if(_h>0 && _h >= screenAreaTop && _h<=screenAreaBottom && !$(this).data("success")){
            $(this).data("success",true);
            return true;
        }
        return false;
    });
}
