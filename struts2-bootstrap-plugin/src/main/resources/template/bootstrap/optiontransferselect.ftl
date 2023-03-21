<#--
/*
 * $Id: optiontransferselect.ftl 1351491 2012-06-18 21:20:49Z jogep $
 *
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
-->
<#include "/${parameters.templateDir}/${parameters.expandTheme}/controlheader.ftl" />

<#if !stack.findValue("#optiontransferselect_js_included")??><#t/>
<@s.script src="${base}${parameters.staticContentPath}/optiontransferselect.js" encode='false' includeParams='none'/>
    <#assign temporaryVariable = stack.setValue("#optiontransferselect_js_included", "true") /><#t/>
</#if><#t/>
<div class="row">
<div class="col-md-5">

<#if parameters.leftTitle??><#t/>
    <label for="leftTitle">${parameters.leftTitle}</label><br/>
</#if><#t/>
<#include "/${parameters.templateDir}/simple/select.ftl" />
<#if parameters.allowUpDownOnLeft!true>
    <div class="text-center">
        <div class="btn-group transferselect-btn transferselect-btn-bottom">
            <button type="button" class="btn btn-outline-secondary"
                <#if parameters.rightDownLabel??>
                    title="${parameters.rightDownLabel}"
                </#if>
                    onclick="moveOptionDown(document.getElementById('${parameters.id}'), 'key', <#if parameters.headerKey??>'${parameters.headerKey}'<#else>''</#if>);<#if parameters.upDownOnLeftOnclick?has_content>${parameters.upDownOnLeftOnclick};</#if>"<#t/>
                    ><#t/>
                <span class="bi bi-arrow-down-circle"></span>
            </button>
            <button type="button" class="btn btn-outline-secondary"
                <#if parameters.rightUpLabel??>
                    title="${parameters.rightUpLabel}"
                </#if>
                    onclick="moveOptionUp(document.getElementById('${parameters.id}'), 'key', <#if parameters.headerKey??>'${parameters.headerKey}'<#else>''</#if>);<#if parameters.upDownOnLeftOnclick?has_content>${parameters.upDownOnLeftOnclick};</#if>"<#t/>
                    ><#t/>
                <span class="bi bi-arrow-up-circle"></span>
            </button>
        </div>
    </div>
</#if>

</div>
<div class="col-md-2 text-center align-middle">
<div class="btn-group-vertical transferselect-btn transferselect-btn-middle">
<#if parameters.allowAddToLeft!true><#t/>
    <#assign addToLeftLabel = parameters.addToLeftLabel!"To left"/><#t/>
    <#if parameters.doubleHeaderKey??><#t/>
    <button type="button"
        <#if parameters.buttonCssClass??><#t/>
            class="btn ${parameters.buttonCssClass}"
        <#else><#t/>
            class="btn btn-outline-secondary"
        </#if><#t/>
        <#if parameters.buttonCssStyle??><#t/>
            style="${parameters.buttonCssStyle}"
        </#if><#t/>
            title="${addToLeftLabel}"
            onclick="moveSelectedOptions(document.getElementById('${parameters.doubleId}'), document.getElementById('${parameters.id}'), false, '${parameters.doubleHeaderKey}', '');<#if parameters.addToLeftOnclick?has_content>${parameters.addToLeftOnclick};</#if>"
            ><#t/>
        <span class="bi bi-arrow-left-circle"></span>
    </button>
    <#else><#t/>
    <button type="button"
        <#if parameters.buttonCssClass??><#t/>
            class="btn ${parameters.buttonCssClass}"
        <#else><#t/>
            class="btn btn-outline-secondary"
        </#if><#t/>
        <#if parameters.buttonCssStyle??><#t/>
            style="${parameters.buttonCssStyle}"
        </#if><#t/>
            title="${addToLeftLabel}"
            onclick="moveSelectedOptions(document.getElementById('${parameters.doubleId}'), document.getElementById('${parameters.id}'), false, '');<#if parameters.addToLeftOnclick?has_content>${parameters.addToLeftOnclick};</#if>"
            ><#t/>
        <span class="bi bi-arrow-left-circle"></span>
    </button>
    </#if><#t/>
</#if><#t/>
<#if parameters.allowAddToRight!true><#t/>
    <#assign addToRightLabel=parameters.addToRightLabel!"To right" /><#t/>
    <#if parameters.headerKey??><#t/>
    <button type="button"
        <#if parameters.buttonCssClass??><#t/>
            class="btn ${parameters.buttonCssClass}"
        <#else><#t/>
            class="btn btn-outline-secondary"
        </#if><#t/>
        <#if parameters.buttonCssStyle??><#t/>
            style="${parameters.buttonCssStyle}"
        </#if><#t/>
            title="${addToRightLabel}"
            onclick="moveSelectedOptions(document.getElementById('${parameters.id}'), document.getElementById('${parameters.doubleId}'), false, '${parameters.headerKey}', '');<#if parameters.addToRightOnclick?has_content>${parameters.addToRightOnclick};</#if>"
            ><#t/>
        <span class="bi bi-arrow-right-circle"></span>
    </button>
    <#else><#t/>
    <button type="button"
        <#if parameters.buttonCssClass??><#t/>
            class="btn ${parameters.buttonCssClass}"
        <#else><#t/>
            class="btn btn-outline-secondary"
        </#if><#t/>
        <#if parameters.buttonCssStyle??><#t/>
            style="${parameters.buttonCssStyle}"
        </#if><#t/>
            title="${addToRightLabel}"
            onclick="moveSelectedOptions(document.getElementById('${parameters.id}'), document.getElementById('${parameters.doubleId}'), false, '');<#if parameters.addToRightOnclick?has_content>${parameters.addToRightOnclick};</#if>"
            ><#t/>
        <span class="bi bi-arrow-right-circle"></span>
    </button>
    </#if><#t/>
</#if><#t/>
<#if parameters.allowAddAllToLeft!true><#t/>
    <#assign addAllToLeftLabel=parameters.addAllToLeftLabel!"All to left" /><#t/>
    <#if parameters.doubleHeaderKey??><#t/>
    <button type="button"
        <#if parameters.buttonCssClass??><#t/>
            class="btn ${parameters.buttonCssClass}"
        <#else><#t/>
            class="btn btn-outline-secondary"
        </#if><#t/>
        <#if parameters.buttonCssStyle??><#t/>
            style="${parameters.buttonCssStyle}"
        </#if><#t/>
            title="${addAllToLeftLabel}"
            onclick="moveAllOptions(document.getElementById('${parameters.doubleId}'), document.getElementById('${parameters.id}'), false, '${parameters.doubleHeaderKey}', '');<#if parameters.addAllToLeftOnclick?has_content>${parameters.addAllToLeftOnclick};</#if>"
            ><#t/>
        <span class="bi bi-arrow-left-circle-fill"></span>
    </button>
    <#else><#t/>
    <button type="button"
        <#if parameters.buttonCssClass??><#t/>
            class="btn ${parameters.buttonCssClass}"
        <#else><#t/>
            class="btn btn-outline-secondary"
        </#if><#t/>
        <#if parameters.buttonCssStyle??><#t/>
            style="${parameters.buttonCssStyle}"
        </#if><#t/>
            title="${addAllToLeftLabel}"
            onclick="moveAllOptions(document.getElementById('${parameters.doubleId}'), document.getElementById('${parameters.id}'), false, '');<#if parameters.addAllToLeftOnclick?has_content>${parameters.addAllToLeftOnclick};</#if>"
            ><#t/>
        <span class="bi bi-arrow-left-circle-fill"></span>
    </button>
    </#if><#t/>
</#if><#t/>
<#if parameters.allowAddAllToRight!true><#t/>
    <#assign addAllToRightLabel=parameters.addAllToRightLabel!"All to right" /><#t/>
    <#if parameters.headerKey??><#t/>
    <button type="button"
        <#if parameters.buttonCssClass??><#t/>
            class="btn ${parameters.buttonCssClass}"
        <#else><#t/>
            class="btn btn-outline-secondary"
        </#if><#t/>
        <#if parameters.buttonCssStyle??><#t/>
            style="${parameters.buttonCssStyle}"
        </#if><#t/>
            title="${addAllToRightLabel}"
            onclick="moveAllOptions(document.getElementById('${parameters.id}'), document.getElementById('${parameters.doubleId}'), false, '${parameters.headerKey}', '');<#if parameters.addAllToRightOnclick?has_content>${parameters.addAllToRightOnclick};</#if>"
            ><#t/>
        <span class="bi bi-arrow-right-circle-fill"></span>
    </button>
    <#else><#t/>
    <button type="button"
        <#if parameters.buttonCssClass??><#t/>
            class="btn ${parameters.buttonCssClass}"
        <#else><#t/>
            class="btn btn-outline-secondary"
        </#if><#t/>
        <#if parameters.buttonCssStyle??><#t/>
            style="${parameters.buttonCssStyle}"
        </#if><#t/>
            title="${addAllToRightLabel}"
            onclick="moveAllOptions(document.getElementById('${parameters.id}'), document.getElementById('${parameters.doubleId}'), false, '');<#if parameters.addAllToRightOnclick?has_content>${parameters.addAllToRightOnclick};</#if>"
            ><#t/>
        <span class="bi bi-arrow-right-circle-fill"></span>
    </button>
    </#if><#t/>
</#if><#t/>
<#if parameters.allowSelectAll!true><#t/>
    <#assign selectAllLabel=parameters.selectAllLabel!"Select all" /><#t/>
    <#if parameters.headerKey?? && parameters.doubleHeaderKey??><#t/>
    <button type="button"
        <#if parameters.buttonCssClass??><#t/>
            class="btn ${parameters.buttonCssClass}"
        <#else><#t/>
            class="btn btn-outline-secondary"
        </#if><#t/>
        <#if parameters.buttonCssStyle??><#t/>
            style="${parameters.buttonCssStyle}"
        </#if><#t/>
            title="${selectAllLabel}"
            onclick="selectAllOptionsExceptSome(document.getElementById('${parameters.id}'), 'key', '${parameters.headerKey}');selectAllOptionsExceptSome(document.getElementById('${parameters.doubleId}'), 'key', '${parameters.doubleHeaderKey}');<#if parameters.selectAllOnclick?has_content>${parameters.selectAllOnclick};</#if>"
            ><#t/>
        <span class="bi bi-arrow-left-right"></span>
    </button>
    <#elseif parameters.headerKey??><#t/>
    <button type="button"
        <#if parameters.buttonCssClass??><#t/>
            class="btn ${parameters.buttonCssClass}"
        <#else><#t/>
            class="btn btn-outline-secondary"
        </#if><#t/>
        <#if parameters.buttonCssStyle??><#t/>
            style="${parameters.buttonCssStyle}"
        </#if><#t/>
            title="${selectAllLabel}"
            onclick="selectAllOptionsExceptSome(document.getElementById('${parameters.id}'), 'key', '${parameters.headerKey}');selectAllOptions(document.getElementById('${parameters.doubleId}'));<#if parameters.selectAllOnclick?has_content>${parameters.selectAllOnclick};</#if>"
            ><#t/>
        <span class="bi bi-arrow-left-right"></span>
    </button>
    <#elseif parameters.doubleHeaderKey??><#t/>
    <button type="button"
        <#if parameters.buttonCssClass??><#t/>
            class="btn ${parameters.buttonCssClass}"
        <#else><#t/>
            class="btn btn-outline-secondary"
        </#if><#t/>
        <#if parameters.buttonCssStyle??><#t/>
            style="${parameters.buttonCssStyle}"
        </#if><#t/>
            title="${selectAllLabel}"
            onclick="selectAllOptions(document.getElementById('${parameters.id}'));selectAllOptionsExceptSome(document.getElementById('${parameters.doubleId}'), 'key', '${parameters.doubleHeaderKey}');<#if parameters.selectAllOnclick?has_content>${parameters.selectAllOnclick};</#if>"
            ><#t/>
        <span class="bi bi-arrow-left-right"></span>
    </button>
    <#else><#t/>
    <button type="button"
        <#if parameters.buttonCssClass??><#t/>
            class="btn ${parameters.buttonCssClass}"
        <#else><#t/>
            class="btn btn-outline-secondary"
        </#if><#t/>
        <#if parameters.buttonCssStyle??><#t/>
            style="${parameters.buttonCssStyle}"
        </#if><#t/>
            title="${selectAllLabel}"
            onclick="selectAllOptions(document.getElementById('${parameters.id}'));selectAllOptions(document.getElementById('${parameters.doubleId}'));<#if parameters.selectAllOnclick?has_content>${parameters.selectAllOnclick};</#if>"
            ><#t/>
        <span class="bi bi-arrow-left-right"></span>
    </button>
    </#if><#t/>
</#if><#t/>
</div>
</div>
<div class="col-md-5">
<#if parameters.rightTitle??><#t/>
    <label for="rightTitle">${parameters.rightTitle}</label><br/>
</#if><#t/>
    <select
            name="${parameters.doubleName!""}"
    <#if parameters.get("doubleSize")??><#t/>
            size="${parameters.get("doubleSize")}"
    </#if><#t/>
    <#if parameters.doubleDisabled!false><#t/>
            disabled="disabled"
    </#if><#t/>
    <#if parameters.doubleMultiple!false><#t/>
            multiple="multiple"
    </#if><#t/>
    <#if parameters.doubleTabindex??><#t/>
            tabindex="${parameters.tabindex}"
    </#if><#t/>
    <#if parameters.doubleId??><#t/>
            id="${parameters.doubleId}"
    </#if><#t/>
    <#if parameters.doubleCss??><#t/>
            class="form-control ${parameters.doubleCss}"
    <#else><#t/>
            class="form-control"
    </#if><#t/>
    <#if parameters.doubleStyle??><#t/>
            style="${parameters.doubleStyle}"
    </#if><#t/>
    <#if parameters.doubleOnclick??><#t/>
            onclick="${parameters.doubleOnclick}"
    </#if><#t/>
    <#if parameters.doubleOndblclick??><#t/>
            ondblclick="${parameters.doubleOndblclick}"
    </#if><#t/>
    <#if parameters.doubleOnmousedown??><#t/>
            onmousedown="${parameters.doubleOnmousedown}"
    </#if><#t/>
    <#if parameters.doubleOnmouseup??><#t/>
            onmouseup="${parameters.doubleOnmouseup}"
    </#if><#t/>
    <#if parameters.doubleOnmousemove??><#t/>
            onmousemove="${parameters.doubleOnmousemove}"
    </#if><#t/>
    <#if parameters.doubleOnmouseover??><#t/>
            onmouseover="${parameters.doubleOnmouseover}"
    </#if><#t/>
    <#if parameters.doubleOnmouseout??><#t/>
            onmouseout="${parameters.doubleOnmouseout}"
    </#if><#t/>
    <#if parameters.doubleOnfocus??><#t/>
            onfocus="${parameters.doubleOnfocus}"
    </#if><#t/>
    <#if parameters.doubleOnblur??><#t/>
            onblur="${parameters.doubleOnblur}"
    </#if><#t/>
    <#if parameters.doubleOnkeypress??><#t/>
            onkeypress="${parameters.doubleOnkeypress}"
    </#if><#t/>
    <#if parameters.doubleOnKeydown??><#t/>
            onkeydown="${parameters.doubleOnkeydown}"
    </#if><#t/>
    <#if parameters.doubleOnkeyup??><#t/>
            onkeyup="${parameters.doubleOnkeyup}"
    </#if><#t/>
    <#if parameters.doubleOnselect??><#t/>
            onselect="${parameters.doubleOnselect}"
    </#if><#t/>
    <#if parameters.doubleOnchange??><#t/>
            onchange="${parameters.doubleOnchange}"
    </#if><#t/>
    <#if parameters.doubleAccesskey??><#t/>
            accesskey="${parameters.doubleAccesskey}"
    </#if>
            >
    <#if parameters.doubleHeaderKey?? && parameters.doubleHeaderValue??><#t/>
        <option value="${parameters.doubleHeaderKey}">${parameters.doubleHeaderValue}</option>
    </#if><#t/>
    <#if parameters.doubleEmptyOption!false><#t/>
        <option value=""></option>
    </#if><#t/>
    <@s.iterator value="parameters.doubleList"><#t/>
        <#if parameters.doubleListKey??><#t/>
            <#assign doubleItemKey = stack.findValue(parameters.doubleListKey) /><#t/>
        <#else><#t/>
            <#assign doubleItemKey = stack.findValue('top') /><#t/>
        </#if><#t/>
        <#assign doubleItemKeyStr = doubleItemKey.toString() /><#t/>
        <#if parameters.doubleListValue??><#t/>
            <#assign doubleItemValue = stack.findString(parameters.doubleListValue)!"" /><#t/>
        <#else><#t/>
            <#assign doubleItemValue = stack.findString('top') /><#t/>
        </#if><#t/>
        <option value="${doubleItemKeyStr}"<#rt/>
            <#if tag.contains(parameters.doubleNameValue, doubleItemKey)><#t/>
                selected="selected"<#rt/>
            </#if><#t/>
                >${doubleItemValue}</option><#lt/>
    </@s.iterator><#t/>
    </select>
<#if parameters.doubleMultiple!false>
    <input type="hidden" id="__multiselect_${parameters.doubleId}"
           name="__multiselect_${parameters.doubleName!""}" value=""<#rt/>
        <#if parameters.doubleDisabled!false>
           disabled="disabled"<#rt/>
        </#if>
            />
</#if>

<#if parameters.allowUpDownOnRight!true>
    <div class="text-center">
        <div class="btn-group transferselect-btn transferselect-btn-bottom">
            <button type="button" class="btn btn-outline-secondary"
                <#if parameters.rightDownLabel??>
                    title="${parameters.rightDownLabel}"
                </#if>
                    onclick="moveOptionDown(document.getElementById('${parameters.doubleId}'), 'key', <#if parameters.doubleHeaderKey??>'${parameters.doubleHeaderKey}'<#else>''</#if>);<#if parameters.upDownOnLeftOnclick?has_content>${parameters.upDownOnLeftOnclick};</#if>"<#t/>
                    ><#t/>
                <span class="bi bi-arrow-down-circle"></span>
            </button>
            <button type="button" class="btn btn-outline-secondary"
                <#if parameters.rightUpLabel??>
                    title="${parameters.rightUpLabel}"
                </#if>
                    onclick="moveOptionUp(document.getElementById('${parameters.doubleId}'), 'key', <#if parameters.doubleHeaderKey??>'${parameters.doubleHeaderKey}'<#else>''</#if>);<#if parameters.upDownOnLeftOnclick?has_content>${parameters.upDownOnLeftOnclick};</#if>"<#t/>
                    ><#t/>
                <span class="bi bi-arrow-up-circle"></span>
            </button>
        </div>
    </div>
</#if>
</div>
</div>
<#include "/${parameters.templateDir}/${parameters.expandTheme}/controlfooter.ftl" />
