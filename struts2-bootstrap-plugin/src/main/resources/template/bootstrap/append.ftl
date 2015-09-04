<#if (parameters.dynamicAttributes?? && parameters.dynamicAttributes?size > 0 && parameters.dynamicAttributes["inputPrepend"]??)><#rt/>
    <#assign inputPrepend = parameters.dynamicAttributes.remove("inputPrepend")/><#rt/>
</#if><#rt/>
<#if (parameters.dynamicAttributes?? && parameters.dynamicAttributes?size > 0 && parameters.dynamicAttributes["inputAppend"]??)><#rt/>
    <#assign inputAppend = parameters.dynamicAttributes.remove("inputAppend")/><#rt/>
</#if><#rt/>
<#if (parameters.dynamicAttributes?? && parameters.dynamicAttributes?size > 0 && parameters.dynamicAttributes["inputPrependIcon"]??)><#rt/>
    <#assign inputPrependIcon = parameters.dynamicAttributes.remove("inputPrependIcon")/><#rt/>
</#if><#rt/>
<#if (parameters.dynamicAttributes?? && parameters.dynamicAttributes?size > 0 && parameters.dynamicAttributes["inputAppendIcon"]??)><#rt/>
    <#assign inputAppendIcon = parameters.dynamicAttributes.remove("inputAppendIcon")/><#rt/>
</#if><#rt/>

<#if inputPrepend??>
<div class="input-group">
    <span class="input-group-addon">${inputPrepend?html}</span>
</#if>
<#if inputPrependIcon??>
<div class="input-group">
    <span class="input-group-addon"><i class="glyphicon glyphicon-${inputPrependIcon?html}"></i></span>
</#if>
<#if (inputAppend?? || inputAppendIcon??)>
<div class="input-group">
</#if>
