<#if (inputPrepend?? || inputPrependIcon??)>
</div>
</#if>
<#if inputAppend??>
    <div class="input-group-text">${inputAppend}</div>
</div>
</#if>
<#if inputAppendIcon??>
    <div class="input-group-text"><i class="bi bi-${inputAppendIcon}"></i></div>
</div>
</#if>