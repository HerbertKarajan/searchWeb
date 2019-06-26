<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>GOME-TOTEM搜索体验测试</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <style>
        body {
            font-size: 12px;
        }
    </style>


    <script src="//js.gomein.net.cn/??/js/g/jquery/jquery-1.7.1.min.js?v=20160002000500070032"></script>

    <div style="text-align:center">

        <label id="docCount"></label>
        <label>关键词:<input type="text" id="keyword" style="width:150px" />
        </label> <label>分类过滤:<input type="text" id="category"
                                    style="width:100px" /> </label><label>店铺Id:<input type="text"
                                                                                      id="shopId" style="width:100px" /> </label><label>productId:<input
            type="text" id="productId" style="width:100px" /></label><label> skuId:<input
            type="text" id="skuId" style="width:100px" /></label><label> cityId:<input
            type="text" id="regionId" style="width:100px" /></label><label> sort:<input
            type="text" id="sorts" style="width:100px" /></label>
        <label>
            <select id="rank" style="width:100px">
                <option value="0" checked="true">综合排序</option>
                <option value="1">机器排序</option>
            </select>
        </label>
        <input type="button" id="search" onclick="fireSearch()" value="search..." />


    </div>
    <table width="100%" cellspace="5">
        <tr>
            <th width="55%"><span id="process_360buy"
                                  style="margin-left: 15px; display: none"><img width="22"  height="22" src="//search.gome.com.cn/cloud/images/spinner.gif" /> </span>
                <hr></th>
            <th width="40%">gome.com <span id="process_gome"
                                           style="margin-left: 15px; display: none"><img width="22" height="22" src="//search.gome.com.cn/cloud/images/spinner.gif" /> </span>
                <hr></th>
            <th width="5%"><span id="process_suning"
                                  style="margin-left: 15px; display: none"><img width="22"
                                                                                height="22" src="http://search.gome.com.cn/cloud/images/spinner.gif" /> </span>
                <hr></th>
        </tr>
        <tr>
            <td width="55%" id="hold_360buy" valign="top">
                <iframe id="code_data" name="data_code" src="" frameborder="0" width="98%" height="1600px"></iframe>
            </td>
            <td width="40%" id="hold_gome" valign="top"></td>
            <td width="5%" height="auto" id="hold_suning" valign="top">
            </td>
        </tr>
    </table>

    <script>
        var pageNum = 1;
        $(document).ready(
                function() {
                    $("#keyword,#category,#shopId").keydown(function(event) {
                        if (event.keyCode == 13) {
                            fireSearch();
                        }
                    });
                });

        String.prototype.replaceAll = function(reallyDo, replaceWith, ignoreCase) {
            if (!RegExp.prototype.isPrototypeOf(reallyDo)) {
                return this.replace(
                        new RegExp(reallyDo, (ignoreCase ? "gi" : "g")),
                        replaceWith);
            } else {
                return this.replace(reallyDo, replaceWith);
            }
        };

        function fireSearch() {
            var productTest = "0";
            var skuTest = "0";
            pageNum = 1;
            fireBy("gome",productTest,skuTest);
        }

        function fireBy(siteName,productTest,skuTest) {
            $("#process_" + siteName).show();
            $.ajax({
                url : '/cloud/test',
                data : {
                    "siteName" : siteName,
                    "question" : $("#keyword").val(),
                    "catId" : $("#category").val(),
                    "shopId" : $("#shopId").val(),
                    "catalog" : $("#catalog").val(),
                    "serviceName" : $("#serviceName").val(),
                    "skuId" : $("#skuId").val(),
                    "regionId" : $("#regionId").val(),
                    "productId" : $("#productId").val(),
                    "productTest":productTest,
                    "skuTest":skuTest,
                    "sort":$("#sorts").val(),
                    "pageSize" :20,
                    "rank":$("#rank").val()
                },
                type : 'post',
                timeout : 800000,
                cache : false,
                dataType : 'json',
                success : function(data) {
                    $("#process_" + siteName).hide();
                    switch (siteName) {
                        case "360buy":
                            $("#hold_360buy").html(toHtml(data));
                            break;

                        case "suning":
                            $("#hold_suning").html(toHtml(data));
                            break;
                        case "gome":
                            $("#hold_gome").html(toNewHtml(data));
                            $("#btnPrior,#btnNext").click(function(e) {
                                var pageNumber = $(this).attr("pageNumber");
                                gotoPage(pageNumber,productTest,skuTest);
                            });
                            $("#skippage").click(function(e) {
                                var pageNumber = $("#spageNum").val();
                                gotoPage(pageNumber,productTest,skuTest);
                            });
                            break;
                    }
                    initJsonPanel(data);
                },
                error : function() {
                }
            });
        }

        function initJsonPanel(data){
            $("#code_data").attr("src","/cloud/blank");
            setTimeout(function(){
                if(data!=undefined){
                    var nodeEdit=window.frames["data_code"].document.getElementById("edit");
                    nodeEdit.value=JSON.stringify(data);
                    window.frames["data_code"].document.getElementById("ext-gen57").click();
                }
            },1000)
        }

        function gotoPage(pageNum1,productTest,skuTest) {
            pageNum=pageNum1;
            $("#process_" + "gome").show();
            $.ajax({
                url : '/cloud/test',
                data : {
                    "siteName" : "gome",
                    "question" : $("#keyword").val(),
                    "catalog" : $("#catalog").val(),
                    "shopId" : $("#shopId").val(),
                    "catId" : $("#category").val(),
                    "serviceName" : $("#serviceName").val(),
                    "skuId" : $("#skuId").val(),
                    "regionId" : $("#regionId").val(),
                    "pageSize" :20,
                    "productId" : $("#productId").val(),
                    "productTest":productTest,
                    "skuTest":skuTest,
                    "pageNumber" : pageNum1,
                    "sort":$("#sorts").val(),
                    "rank":$("#rank").val()
                },
                type : 'post',
                timeout : 800000,
                cache : false,
                dataType : 'json',
                success : function(data) {
                    $("#process_" + "gome").hide();
                    switch ("gome") {
                        case "360buy":
                            $("#hold_360buy").html(toHtml(data));
                            break;
                        case "suning":
                            $("#hold_suning").html(toHtml(data));
                            break;
                        case "gome":
                            $("#hold_gome").html(toNewHtml(data));
                            $("#btnPrior,#btnNext").click(function(e) {
                                var pageNumber = $(this).attr("pageNumber");
                                gotoPage(pageNumber,productTest,skuTest);
                            });
                            $("#skippage").click(function(e) {
                                var pageNumber = $("#spageNum").val();
                                gotoPage(pageNumber,productTest,skuTest);
                            });
                            break;
                    }
                    initJsonPanel(data);
                },
                error : function(errorThrown) {
                    alert("error" + errorThrown);
                }
            });
        }

        function toHtml(data) {
            var content = [];
            var pageCount=data.recordCount / 30;
            if (data.recordCount == 0) {
                content.push("<div><font color='red'>记录数:");
                content.push(data.recordCount + "</font></div>");
                return content.join("");
            }

            content.push("<div><font color='red'>记录数:");
            content.push(data.recordCount);
            content.push("</font><b style='margin-left:20px'>搜索体验:");
            content.push(data.matchRate + "</b></div>");

            content.push("<table width='100%'>");
            content.push("<tr>");
            content.push("<td width='60%'>");
            content.push("商品标题");
            content.push("<td>");
            content.push("<td width='20%'>");
            content.push("价格");
            content.push("</td>");
            content.push("<td width='20%'>");
            content.push("搜索体验");
            content.push("</td>");
            content.push("</tr>");
            for ( var i = 0; i < data.records.length; i++) {
                var rec = data.records[i];
                content.push("<tr>");
                content.push("<td width='50%'>");
                content.push("<div>'" + rec.title + "</div>");
                content
                        .push("<img width='100' height='100' src='"+rec.image+"' title='"+rec.title+"'/>");
                content.push("<td>");
                content.push("<td width='30%'>");
                content.push(rec.price);
                content.push("</td>");
                content.push("<td width='20%'>");
                content.push(rec.matchRate);
                content.push("</td>");
                content.push("</tr>");
            }
            content.push("</table>");
            return content.join("");
        }
        //
        function toNewHtml(data) {

            var content = [];
            var results = data.content;
            if (results.totalCount == 0) {
                return content.join("");
            }
            var pageCount = parseInt(((results.totalCount / 20) + 1), 10);
            $("#btnPrior").unbind("click");
            $("#btnNext").unbind("click");
            content.push("<b>搜索关键词:");
            content.push(results.keys);
            content.push("</b>&nbsp;");
            if (results.words) {
                content.push("[" + results.words + "]&nbsp;&nbsp;");
            }
            content.push("<span>总数:" + results.totalCount+"</span>&nbsp;&nbsp;");

            content.push("&nbsp;&nbsp;<font color='blue'>总页数:");
            content.push((pageCount) + "</font>");
            content.push("<font color='red'>第 ");
            content.push(pageNum);
            content.push(" 页");
            content.push("</font>");
            if (pageCount > 1) {
                pageNum =parseInt(pageNum);
                if (pageNum == 0) {
                    content.push("<button id='btnNext' pageNumber=" + (pageNum + 2)
                    + ">下一页</button>");
                } else if (pageNum == pageCount) {
                    content.push("<button id='btnPrior' pageNumber="
                    + (pageNum - 1) + ">上一页</button>");
                } else {
                    content
                            .push("<button id='btnPrior' pageNumber="
                            + (pageNum - 1)
                            + ">上一页</button>&nbsp;&nbsp;<button id='btnNext' pageNumber="
                            + (pageNum + 1) + ">下一页</button>");
                }
            }
            content.push("跳页<input type='text' id='spageNum' style='width:50px'/><button type='button' id='skippage'>跳转到</button>");


            content.push("<table width='100%'>");
            for ( var i = 0; i < results.products.length; i++) {
                var rec = results.products[i];
                var categories = rec.productEntity.categories;
//			if (rec.skus == undefined)
//				continue;
                var skuIndex = rec.skuIndex != undefined ? rec.skuIndex : 0;
                var sku = rec.skuDtoList[skuIndex].skuEntity;
                content.push("<tr>");
                content.push("<td width='50%' valign='top'>");
                var url = sku.img + "_160.jpg";
                content.push("<img width='100' height='100' src='"+url+"'/>");
                content.push("</td>");
                content.push("<td width='50%' style='color:#666'>");
                content.push("<div style='color:red'>" + sku.name + "</div>");
                content.push("<div style='color:#000'><b>product:</b>" + rec.productEntity.id
                + "&nbsp;&nbsp;&nbsp;");
                content.push("<b>sku:</b>" + sku.id + "&nbsp;&nbsp;&nbsp;");
                content.push("<b>skuNo:</b>" + sku.skuNo + "&nbsp;&nbsp;&nbsp;");
                content.push("<b>tag:</b>" + rec.productEntity.productTag + "&nbsp;&nbsp;&nbsp;");
                content.push("<b>weight:</b>" + rec.calcWeight + "</div>");
                if($("#rank").val()==1){
                    content.push("<div><b>rankInfo:</b>" + rec.extra.rankInfo + "</div>");
                    content.push("<div><b>categories:</b>" + JSON.stringify(categories) + "</div>");
                }
                if (rec.explain) {
                    content.push(rec.explain.replaceAll("\n", "<br/>", false)
                            .replaceAll(" ", "&nbsp;", false));
                }
                content.push("</td>");
                content.push("</tr>");
            }
            content.push("</table>");

            return content.join("");
        }
    </script>