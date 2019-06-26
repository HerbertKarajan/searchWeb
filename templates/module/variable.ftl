<#if (searchObj.content.selectData)??>
<#assign varSelectData = searchObj.content.selectData>
</#if>
<#if (searchObj.content.pageBar)??>
    <#assign varPageBar = searchObj.content.pageBar>
</#if>
<#if (searchObj.content.seoData)??>
<#assign varSeoData = searchObj.content.seoData>
</#if>
<#if (searchObj.header)??>
<#assign varHeader = searchObj.header>
</#if>
<#if (varSelectData.marketPage)??>
    <#if varSelectData.marketPage == "1">
        <#assign isGomehigo = true>
    <#else>
        <#assign isGomehigo = false>
    </#if>
<#else>
    <#assign isGomehigo = false>
</#if>
<#assign greyGif ="//app.gomein.net.cn/images/grey.gif">
<#assign jsCssVersion = "0605.16">
<#assign varSearchKeyWords = "${varSelectData.keywords!}">
<#--品牌图片搜索项目下的地址 搜索指向-->
<#assign varBrandLogo ="${(storeConfiguration.stageJsServer)!}/search/brandlogo/">
<#--页面主域名 在每个具体页面设置，针对页面跳转地址添加域名信息-->
<#assign varHostName ="">