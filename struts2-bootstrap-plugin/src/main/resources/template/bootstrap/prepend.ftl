<#if (inputPrepend?? || inputPrependIcon??)>
</div>
</#if>
<#if inputAppend??>
    <span class="input-group-addon">${inputAppend}</span>
</div>
</#if>
<#if inputAppendIcon??>
    <span class="input-group-addon"><i class="glyphicon glyphicon-${inputAppendIcon}"></i></span>
</div>
</#if>