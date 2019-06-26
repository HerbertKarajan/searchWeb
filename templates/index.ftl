<#assign content = data>
<!DOCTYPE html>

<html lang="en">
<body>
    <br>
    <br>
    <table border="1" width="60%" align="center">
        <thead>
        <tr>
            <th colspan="4">Gateway App Info</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th>流量切换</th><th><a href="javascript:updateRegion(1)">GC1机房</a></th><th><a href="javascript:updateRegion(3)">GC3机房</a></th><th><a href="javascript:updateRegion(0)">双机房</a></th>
        </tr>
        </tbody>
    </table>
    <br>
    <br>
     <table border="1" width="60%" align="center">

         <thead>
            <tr>
                <th>属性名</th><th>属性值</th><th></th>
            </tr>
         </thead>
         <tbody>
            <#list content as value>
            <tr>
                <td>${(value.key!)?string}</td><td>${(value.value!)?string}</td><th><a href="javascript:update('${(value.key!)?string}')">修改</a></th>
            </tr>
            </#list>
         </tbody>
     </table>
</body>

<script src="http://js.gomein.net.cn/??gmlib/jq/1.7.1/jquery.js"></script>
<script>
    function update(_key){
        var newValue=prompt("Please enter new value");
        if(newValue!=null && newValue!='' && newValue!=undefined){
            updateExe(_key,newValue);
        }
    }

    function updateRegion(region){
        if(confirm("are you sure?")){
            if(region==0){
                updateExe("flow","HASH");
            }else if(region==1){
                updateExe("flow","GC1");
            }else if(region==3){
                updateExe("flow","GC3");
            }
        }
    }

    function updateExe(key,value){
        $.ajax({
            type:"post",
            url:"/cloud/config",
            data:{key:key,value:value},
            timeout:3000,
            dataType:'json',
            success:function(data){
                alert("update success");
                window.location.reload();
            },
            error:function(err){
                alert("update fail "+err);
                console.info(err);
            }
        })
    }

</script>

</html>
