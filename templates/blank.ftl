<html class=" ext-strict x-viewport ext-strict x-viewport">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSON在线视图查看器(Online JSON Viewer)</title>
    <meta name="description" content="JSON在线视图查看器(Online JSON Viewer)">
    <meta name="keywords" content="JSON在线视图查看器(Online JSON Viewer)">
    <link rel="stylesheet" type="text/css"
          href="//css.gomein.net.cn/??/search/search2017/css/ext-all.css">
    <script type="text/javascript"
            src="//www.bejson.com/static/bejson/jsonview/jsonview_files/ext-base.js"></script>
    <script type="text/javascript"
            src="//www.bejson.com/static/bejson/jsonview/jsonview_files/ext-all.js"></script>
    <style type="text/css" id="styleSheetIconCls">/* Ext.ux.iconCls */</style>
    <style type="text/css">.br0 {
        COLOR: #009900
    }

    .st0 {
        COLOR: #3366cc
    }

    .sy0 {
        COLOR: #339933
    }
    </style>
    <script>
        var data=${(searchObj)!};
        window.onload = function () {
            var oTxt = document.getElementById("edit");
            oTxt.onkeydown = function (ev) {
                var oEvent = ev || event;
                if (oEvent.keyCode == 9) {
                    if (oEvent.preventDefault) {
                        oEvent.preventDefault();
                    }
                    else {
                        window.event.returnValue = false;
                    }
                    oTxt.value += '    '; //这里放入了4个空格
                }
            }
        }
        setTimeout(function(){
            if(data!=undefined){
                var oTxt = document.getElementById("edit");
                oTxt.value=JSON.stringify(data);
                document.getElementById("ext-gen57").click();
            }
        },1000)
    </script>
    <script type="text/javascript"
            src="//js.gomein.net.cn/??/search/search2017/js/jsonviewercn.js"></script>
    <style id="styleSheetIconCls" type="text/css">/* Ext.ux.iconCls */</style>
</head>
<body id="ext-gen9" class="  ext-gecko ext-gecko2">
<div style="width: 1920px;" id="ext-comp-1004" class="x-tab-panel">
    <div style="-moz-user-select: none; width: 1918px;" id="ext-gen21" class="x-tab-panel-header x-unselectable">
        <div id="ext-gen25" class="x-tab-strip-wrap">
            <ul id="ext-gen27" class="x-tab-strip x-tab-strip-top">
                <li class="" id="ext-comp-1004__viewerPanel"><a class="x-tab-strip-close" onclick="return false;"></a><a
                        class="x-tab-right" href="#" onclick="return false;"><em class="x-tab-left"><span
                        class="x-tab-strip-inner"><span class="x-tab-strip-text ">视图</span></span></em></a></li>
                <li class=" x-tab-strip-active" id="ext-comp-1004__textPanel"><a class="x-tab-strip-close"
                                                                                 onclick="return false;"></a><a
                        class="x-tab-right" href="#" onclick="return false;"><em class="x-tab-left"><span
                        class="x-tab-strip-inner"><span class="x-tab-strip-text ">JSON数据</span></span></em></a></li>
                <li id="ext-gen28" class="x-tab-edge"></li>
                <div id="ext-gen29" class="x-clear"></div>
            </ul>
        </div>
        <div id="ext-gen26" class="x-tab-strip-spacer"></div>
    </div>
    <div id="ext-gen22" class="x-tab-panel-bwrap">
        <div style="width: 1918px; height: 830px;" id="ext-gen23" class="x-tab-panel-body x-tab-panel-body-top">
            <div style="width: 1918px;" id="textPanel" class="x-panel x-panel-noborder">
                <div id="ext-gen36" class="x-panel-bwrap">
                    <div id="ext-gen37" class="x-panel-tbar x-panel-tbar-noheader x-panel-tbar-noborder">
                        <div id="ext-comp-1013" class="x-toolbar x-small-editor">
                            <table cellspacing="0">
                                <tbody>
                                <tr>
                                    <td id="ext-gen39">
                                        <table style="width: auto;" id="ext-comp-1014" class="x-btn-wrap x-btn"
                                               border="0" cellpadding="0" cellspacing="0">
                                            <tbody>
                                            <tr>
                                                <td class="x-btn-left"><i>&nbsp;</i></td>
                                                <td class="x-btn-center"><em unselectable="on">
                                                    <button id="ext-gen41" class="x-btn-text" type="button">粘贴</button>
                                                </em></td>
                                                <td class="x-btn-right"><i>&nbsp;</i></td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                    <td id="ext-gen47">
                                        <table style="width: auto;" id="ext-comp-1015" class="x-btn-wrap x-btn"
                                               border="0" cellpadding="0" cellspacing="0">
                                            <tbody>
                                            <tr>
                                                <td class="x-btn-left"><i>&nbsp;</i></td>
                                                <td class="x-btn-center"><em unselectable="on">
                                                    <button id="ext-gen49" class="x-btn-text" type="button">复制</button>
                                                </em></td>
                                                <td class="x-btn-right"><i>&nbsp;</i></td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                    <td><span id="ext-gen55" class="ytb-sep"></span></td>
                                    <td id="ext-gen56">
                                        <table style="width: auto;" id="ext-comp-1016" class="x-btn-wrap x-btn"
                                               border="0" cellpadding="0" cellspacing="0">
                                            <tbody>
                                            <tr>
                                                <td class="x-btn-left"><i>&nbsp;</i></td>
                                                <td class="x-btn-center"><em unselectable="on">
                                                    <button id="ext-gen58" class="x-btn-text" type="button">格式化</button>
                                                </em></td>
                                                <td class="x-btn-right"><i>&nbsp;</i></td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                    <td><span id="ext-gen64" class="ytb-sep"></span></td>
                                    <td id="ext-gen65">
                                        <table style="width: auto;" id="ext-comp-1017" class="x-btn-wrap x-btn"
                                               border="0" cellpadding="0" cellspacing="0">
                                            <tbody>
                                            <tr>
                                                <td class="x-btn-left"><i>&nbsp;</i></td>
                                                <td class="x-btn-center"><em unselectable="on">
                                                    <button id="ext-gen67" class="x-btn-text" type="button">删除空格
                                                    </button>
                                                </em></td>
                                                <td class="x-btn-right"><i>&nbsp;</i></td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                    <td><span id="ext-gen73" class="ytb-sep"></span></td>
                                    <td id="ext-gen74">
                                        <table style="width: auto;" id="ext-comp-1018" class="x-btn-wrap x-btn"
                                               border="0" cellpadding="0" cellspacing="0">
                                            <tbody>
                                            <tr>
                                                <td class="x-btn-left"><i>&nbsp;</i></td>
                                                <td class="x-btn-center"><em unselectable="on">
                                                    <button id="ext-gen76" class="x-btn-text" type="button">删除空格并转义
                                                    </button>
                                                </em></td>
                                                <td class="x-btn-right"><i>&nbsp;</i></td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                    <td><span id="ext-gen82" class="ytb-sep"></span></td>
                                    <td id="ext-gen83">
                                        <table style="width: auto;" id="ext-comp-1019" class="x-btn-wrap x-btn"
                                               border="0" cellpadding="0" cellspacing="0">
                                            <tbody>
                                            <tr>
                                                <td class="x-btn-left"><i>&nbsp;</i></td>
                                                <td class="x-btn-center"><em unselectable="on">
                                                    <button id="ext-gen85" class="x-btn-text" type="button">去除转义
                                                    </button>
                                                </em></td>
                                                <td class="x-btn-right"><i>&nbsp;</i></td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                    <td style="width: 100%;">
                                        <div id="ext-gen91" class="ytb-spacer"></div>
                                    </td>
                                    <td id="ext-gen92">
                                        <table style="width: auto;" id="ext-comp-1020" class="x-btn-wrap x-btn "
                                               border="0" cellpadding="0" cellspacing="0">
                                            <tbody>
                                            <tr>
                                                <td class="x-btn-left"><i>&nbsp;</i></td>
                                                <td class="x-btn-center"><em unselectable="on">
                                                    <button id="ext-gen94" class="x-btn-text" type="button">回到首页
                                                    </button>
                                                </em></td>
                                                <td class="x-btn-right"><i>&nbsp;</i></td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                    <td id="ext-gen100">
                                        <table style="width: auto;" id="ext-comp-1021" class="x-btn-wrap x-btn "
                                               border="0" cellpadding="0" cellspacing="0">
                                            <tbody>
                                            <tr>
                                                <td class="x-btn-left"><i>&nbsp;</i></td>
                                                <td class="x-btn-center"><em unselectable="on">
                                                    <button id="ext-gen102" class="x-btn-text" type="button">关于</button>
                                                </em></td>
                                                <td class="x-btn-right"><i>&nbsp;</i></td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div style="width: 1918px; height: 804px;" id="ext-gen38"
                         class="x-panel-body x-panel-body-noheader x-panel-body-noborder"><textarea
                            class=" x-form-textarea x-form-field x-form-focus"
                            style="width: 1910px; height: 798px; font-family: monospace;" autocomplete="off" id="edit"
                            name="edit1"></textarea></div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="ext-comp-1004" class="x-tab-panel" style="width: 1240px;margin-top:80px ">
    <div class="x-tab-panel-header x-unselectable" id="ext-gen21" style="-webkit-user-select: none; width: 1238px; ">
        <div class="x-tab-strip-wrap" id="ext-gen25">
            <ul class="x-tab-strip x-tab-strip-top" id="ext-gen27">
                <li class="" id="ext-comp-1004__viewerPanel">
                    <a class="x-tab-strip-close" onclick="return false;"></a><a class="x-tab-right"
                                                                                href="//www.jiangliang.net/json/#"
                                                                                onclick="return false;"><em
                        class="x-tab-left"><span class="x-tab-strip-inner"><span class="x-tab-strip-text ">Viewer</span></span></em></a>
                </li>
                <li class=" x-tab-strip-active" id="ext-comp-1004__textPanel">
                    <a class="x-tab-strip-close" onclick="return false;"></a><a class="x-tab-right"
                                                                                href="//www.jiangliang.net/json/#"
                                                                                onclick="return false;"><em
                        class="x-tab-left"><span class="x-tab-strip-inner"><span
                        class="x-tab-strip-text ">Text</span></span></em></a>
                </li>
                <li class="x-tab-edge" id="ext-gen28"></li>
                <div class="x-clear" id="ext-gen29"></div>
            </ul>
        </div>
        <div class="x-tab-strip-spacer" id="ext-gen26"></div>
    </div>
</div>
<div id="ext-comp-1001" class="x-tip" style="position: absolute; z-index: 20000; visibility: hidden; display: none; ">
    <div class="x-tip-tl">
        <div class="x-tip-tr">
            <div class="x-tip-tc">
                <div class="x-tip-header x-unselectable" id="ext-gen10" style="-webkit-user-select: none; "><span
                        class="x-tip-header-text"></span>
                </div>
            </div>
        </div>
    </div>
    <div class="x-tip-bwrap" id="ext-gen11">
        <div class="x-tip-ml">
            <div class="x-tip-mr">
                <div class="x-tip-mc">
                    <div class="x-tip-body" id="ext-gen12" style="height: auto; "></div>
                </div>
            </div>
        </div>
        <div class="x-tip-bl x-panel-nofooter">
            <div class="x-tip-br">
                <div class="x-tip-bc"></div>
            </div>
        </div>
    </div>
</div>

<div class="panel-footer"></div>
<script type="text/javascript">
    var killads=true;
    window.onload = function () {
        if (typeof(killads) == 'undefined') {

            document.getElementById("ext-gen83").innerHTML = '<span style="background:yellow;color:red">广告屏蔽的开启会造成本页功能失效</span>';

            alert('严重告示\r\n请对本站关闭adblock之类的广告屏蔽功能，因为它会让本页功能和展现失效');
        }
    }
</script>
<div id="cpbtn"></div>
<div style="position: absolute; z-index: 20000; visibility: hidden; display: none;" id="ext-comp-1001" class="x-tip">
    <div class="x-tip-tl">
        <div class="x-tip-tr">
            <div class="x-tip-tc">
                <div style="-moz-user-select: none;" id="ext-gen10" class="x-tip-header x-unselectable"><span
                        class="x-tip-header-text"></span></div>
            </div>
        </div>
    </div>
    <div id="ext-gen11" class="x-tip-bwrap">
        <div class="x-tip-ml">
            <div class="x-tip-mr">
                <div class="x-tip-mc">
                    <div style="height: auto;" id="ext-gen12" class="x-tip-body"></div>
                </div>
            </div>
        </div>
        <div class="x-tip-bl x-panel-nofooter">
            <div class="x-tip-br">
                <div class="x-tip-bc"></div>
            </div>
        </div>
    </div>
</div>
<select class="x-grid-editor x-hide-display">
    <option selected="selected" value="true">true</option>
    <option value="false">false</option>
</select></body>
</html>