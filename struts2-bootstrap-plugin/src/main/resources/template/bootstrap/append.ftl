<#if (parameters.dynamicAttributes?? && parameters.dynamicAttributes?size > 0 && parameters.dynamicAttributes["inputPrepend"]??)><#rt/>
    <#assign strInputPrepend = parameters.dynamicAttributes.remove("inputPrepend")/>
    <#if strInputPrepend?is_string>
        <#assign inputPrepend = struts.translateVariables(strInputPrepend)!strInputPrepend/>
    <#else>
        <#assign inputPrepend = strInputPrepend?string/>
    </#if>
</#if><#rt/>
<#if (parameters.dynamicAttributes?? && parameters.dynamicAttributes?size > 0 && parameters.dynamicAttributes["inputAppend"]??)><#rt/>
    <#assign strInputAppend = parameters.dynamicAttributes.remove("inputAppend")/>
    <#if strInputAppend?is_string>
        <#assign inputAppend = struts.translateVariables(strInputAppend)!strInputAppend/>
    <#else>
        <#assign inputAppend = strInputAppend?string/>
    </#if>
</#if><#rt/>
<#if (parameters.dynamicAttributes?? && parameters.dynamicAttributes?size > 0 && parameters.dynamicAttributes["inputPrependIcon"]??)><#rt/>
    <#assign strInputPrependIcon = parameters.dynamicAttributes.remove("inputPrependIcon")/>
    <#if strInputPrependIcon?is_string>
        <#assign inputPrependIcon = struts.translateVariables(strInputPrependIcon)!strInputPrependIcon/>
    <#else>
        <#assign inputPrependIcon = strInputPrependIcon?string/>
    </#if>
</#if><#rt/>
<#if (parameters.dynamicAttributes?? && parameters.dynamicAttributes?size > 0 && parameters.dynamicAttributes["inputAppendIcon"]??)><#rt/>
    <#assign strInputAppendIcon = parameters.dynamicAttributes.remove("inputAppendIcon")/>
    <#if strInputAppendIcon?is_string>
        <#assign inputAppendIcon = struts.translateVariables(strInputAppendIcon)!strInputAppendIcon/>
    <#else>
        <#assign inputAppendIcon = strInputAppendIcon?string/>
    </#if>
</#if><#rt/>

<#if inputPrepend??>
<div class="input-group">
    <div class="input-group-prepend"><div class="input-group-text">${inputPrepend}</div>
</#if>
<#if inputPrependIcon??>
<div class="input-group">
    <div class="input-group-prepend"><div class="input-group-text"><i class="bi bi-${inputPrependIcon}"></i></div></div>
</#if>
<#if (inputAppend?? || inputAppendIcon??)>
<div class="input-group">
</#if>
