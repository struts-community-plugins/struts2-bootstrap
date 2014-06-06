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
<#include "/${parameters.templateDir}/bootstrap/controlheader.ftl" />

<#if !stack.findValue("#optiontransferselect_js_included")??><#t/>
<script type="text/javascript"
        src="<@s.url value="/struts/optiontransferselect.js" encode='false' includeParams='none'/>"></script>
    <#assign temporaryVariable = stack.setValue("#optiontransferselect_js_included", "true") /><#t/>
</#if><#t/>
<div class="row">
<div class="col-md-5">

<#if parameters.leftTitle??><#t/>
    <label for="leftTitle">${parameters.leftTitle}</label><br/>
</#if><#t/>
<#include "/${parameters.templateDir}/simple/select.ftl" />
<#if parameters.allowUpDownOnLeft?default(true)>
    <div class="text-center">
        <div class="btn-group transferselect-btn transferselect-btn-bottom">
            <button type="button" class="btn btn-default"
                <#if parameters.rightDownLabel??>
                    title="${parameters.rightDownLabel?html}"
                </#if>
                    onclick="moveOptionDown(document.getElementById('${parameters.id}'), 'key', <#if parameters.headerKey??>'${parameters.headerKey}'<#else>''</#if>);<#if parameters.upDownOnLeftOnclick?has_content>${parameters.upDownOnLeftOnclick};</#if>"<#t/>
                    ><#t/>
                <span class="glyphicon glyphicon-arrow-down"></span>
            </button>
            <button type="button" class="btn btn-default"
                <#if parameters.rightUpLabel??>
                    title="${parameters.rightUpLabel?html}"
                </#if>
                    onclick="moveOptionUp(document.getElementById('${parameters.id}'), 'key', <#if parameters.headerKey??>'${parameters.headerKey}'<#else>''</#if>);<#if parameters.upDownOnLeftOnclick?has_content>${parameters.upDownOnLeftOnclick};</#if>"<#t/>
                    ><#t/>
                <span class="glyphicon glyphicon-arrow-up"></span>
            </button>
        </div>
    </div>
</#if>

</div>
<div class="col-md-2 text-center">
<div class="btn-group-vertical transferselect-btn transferselect-btn-middle">
<#if parameters.allowAddToLeft?default(true)><#t/>
    <#assign addToLeftLabel = parameters.addToLeftLabel?default("To left")?html/><#t/>
    <#if parameters.doubleHeaderKey??><#t/>
    <button type="button"
        <#if parameters.buttonCssClass??><#t/>
            class="btn btn-default ${parameters.buttonCssClass?html}"
        <#else><#t/>
            class="btn btn-default"
        </#if><#t/>
        <#if parameters.buttonCssStyle??><#t/>
            style="${parameters.buttonCssStyle?html}"
        </#if><#t/>
            title="${addToLeftLabel}"
            onclick="moveSelectedOptions(document.getElementById('${parameters.doubleId?html}'), document.getElementById('${parameters.id?html}'), false, '${parameters.doubleHeaderKey}', '');<#if parameters.addToLeftOnclick?has_content>${parameters.addToLeftOnclick};</#if>"
            ><#t/>
        <span class="glyphicon glyphicon-arrow-left"></span>
    </button>
    <#else><#t/>
    <button type="button"
        <#if parameters.buttonCssClass??><#t/>
            class="btn btn-default ${parameters.buttonCssClass?html}"
        <#else><#t/>
            class="btn btn-default"
        </#if><#t/>
        <#if parameters.buttonCssStyle??><#t/>
            style="${parameters.buttonCssStyle?html}"
        </#if><#t/>
            title="${addToLeftLabel}"
            onclick="moveSelectedOptions(document.getElementById('${parameters.doubleId?html}'), document.getElementById('${parameters.id?html}'), false, '');<#if parameters.addToLeftOnclick?has_content>${parameters.addToLeftOnclick};</#if>"
            ><#t/>
        <span class="glyphicon glyphicon-arrow-left"></span>
    </button>
    </#if><#t/>
</#if><#t/>
<#if parameters.allowAddToRight?default(true)><#t/>
    <#assign addToRightLabel=parameters.addToRightLabel?default("To right")?html /><#t/>
    <#if parameters.headerKey??><#t/>
    <button type="button"
        <#if parameters.buttonCssClass??><#t/>
            class="btn btn-default ${parameters.buttonCssClass?html}"
        <#else><#t/>
            class="btn btn-default"
        </#if><#t/>
        <#if parameters.buttonCssStyle??><#t/>
            style="${parameters.buttonCssStyle?html}"
        </#if><#t/>
            title="${addToRightLabel}"
            onclick="moveSelectedOptions(document.getElementById('${parameters.id?html}'), document.getElementById('${parameters.doubleId?html}'), false, '${parameters.headerKey}', '');<#if parameters.addToRightOnclick?has_content>${parameters.addToRightOnclick};</#if>"
            ><#t/>
        <span class="glyphicon glyphicon-arrow-right"></span>
    </button>
    <#else><#t/>
    <button type="button"
        <#if parameters.buttonCssClass??><#t/>
            class="btn btn-default ${parameters.buttonCssClass?html}"
        <#else><#t/>
            class="btn btn-default"
        </#if><#t/>
        <#if parameters.buttonCssStyle??><#t/>
            style="${parameters.buttonCssStyle?html}"
        </#if><#t/>
            title="${addToRightLabel}"
            onclick="moveSelectedOptions(document.getElementById('${parameters.id?html}'), document.getElementById('${parameters.doubleId?html}'), false, '');<#if parameters.addToRightOnclick?has_content>${parameters.addToRightOnclick};</#if>"
            ><#t/>
        <span class="glyphicon glyphicon-arrow-right"></span>
    </button>
    </#if><#t/>
</#if><#t/>
<#if parameters.allowAddAllToLeft?default(true)><#t/>
    <#assign addAllToLeftLabel=parameters.addAllToLeftLabel?default("All to left")?html /><#t/>
    <#if parameters.doubleHeaderKey??><#t/>
    <button type="button"
        <#if parameters.buttonCssClass??><#t/>
            class="btn btn-default ${parameters.buttonCssClass?html}"
        <#else><#t/>
            class="btn btn-default"
        </#if><#t/>
        <#if parameters.buttonCssStyle??><#t/>
            style="${parameters.buttonCssStyle?html}"
        </#if><#t/>
            title="${addAllToLeftLabel}"
            onclick="moveAllOptions(document.getElementById('${parameters.doubleId?html}'), document.getElementById('${parameters.id?html}'), false, '${parameters.doubleHeaderKey}', '');<#if parameters.addAllToLeftOnclick?has_content>${parameters.addAllToLeftOnclick};</#if>"
            ><#t/>
        <span class="glyphicon glyphicon-circle-arrow-left"></span>
    </button>
    <#else><#t/>
    <button type="button"
        <#if parameters.buttonCssClass??><#t/>
            class="btn btn-default ${parameters.buttonCssClass?html}"
        <#else><#t/>
            class="btn btn-default"
        </#if><#t/>
        <#if parameters.buttonCssStyle??><#t/>
            style="${parameters.buttonCssStyle?html}"
        </#if><#t/>
            title="${addAllToLeftLabel}"
            onclick="moveAllOptions(document.getElementById('${parameters.doubleId?html}'), document.getElementById('${parameters.id?html}'), false, '');<#if parameters.addAllToLeftOnclick?has_content>${parameters.addAllToLeftOnclick};</#if>"
            ><#t/>
        <span class="glyphicon glyphicon-circle-arrow-left"></span>
    </button>
    </#if><#t/>
</#if><#t/>
<#if parameters.allowAddAllToRight?default(true)><#t/>
    <#assign addAllToRightLabel=parameters.addAllToRightLabel?default("All to right")?html /><#t/>
    <#if parameters.headerKey??><#t/>
    <button type="button"
        <#if parameters.buttonCssClass??><#t/>
            class="btn btn-default ${parameters.buttonCssClass?html}"
        <#else><#t/>
            class="btn btn-default"
        </#if><#t/>
        <#if parameters.buttonCssStyle??><#t/>
            style="${parameters.buttonCssStyle?html}"
        </#if><#t/>
            title="${addAllToRightLabel}"
            onclick="moveAllOptions(document.getElementById('${parameters.id?html}'), document.getElementById('${parameters.doubleId?html}'), false, '${parameters.headerKey}', '');<#if parameters.addAllToRightOnclick?has_content>${parameters.addAllToRightOnclick};</#if>"
            ><#t/>
        <span class="glyphicon glyphicon-circle-arrow-right"></span>
    </button>
    <#else><#t/>
    <button type="button"
        <#if parameters.buttonCssClass??><#t/>
            class="btn btn-default ${parameters.buttonCssClass?html}"
        <#else><#t/>
            class="btn btn-default"
        </#if><#t/>
        <#if parameters.buttonCssStyle??><#t/>
            style="${parameters.buttonCssStyle?html}"
        </#if><#t/>
            title="${addAllToRightLabel}"
            onclick="moveAllOptions(document.getElementById('${parameters.id?html}'), document.getElementById('${parameters.doubleId?html}'), false, '');<#if parameters.addAllToRightOnclick?has_content>${parameters.addAllToRightOnclick};</#if>"
            ><#t/>
        <span class="glyphicon glyphicon-circle-arrow-right"></span>
    </button>
    </#if><#t/>
</#if><#t/>
<#if parameters.allowSelectAll?default(true)><#t/>
    <#assign selectAllLabel=parameters.selectAllLabel?default("Select all")?html /><#t/>
    <#if parameters.headerKey?? && parameters.doubleHeaderKey??><#t/>
    <button type="button"
        <#if parameters.buttonCssClass??><#t/>
            class="btn btn-default ${parameters.buttonCssClass?html}"
        <#else><#t/>
            class="btn btn-default"
        </#if><#t/>
        <#if parameters.buttonCssStyle??><#t/>
            style="${parameters.buttonCssStyle?html}"
        </#if><#t/>
            title="${selectAllLabel}"
            onclick="selectAllOptionsExceptSome(document.getElementById('${parameters.id?html}'), 'key', '${parameters.headerKey}');selectAllOptionsExceptSome(document.getElementById('${parameters.doubleId?html}'), 'key', '${parameters.doubleHeaderKey}');<#if parameters.selectAllOnclick?has_content>${parameters.selectAllOnclick};</#if>"
            ><#t/>
        <span class="glyphicon glyphicon-resize-horizontal"></span>
    </button>
    <#elseif parameters.headerKey??><#t/>
    <button type="button"
        <#if parameters.buttonCssClass??><#t/>
            class="btn btn-default ${parameters.buttonCssClass?html}"
        <#else><#t/>
            class="btn btn-default"
        </#if><#t/>
        <#if parameters.buttonCssStyle??><#t/>
            style="${parameters.buttonCssStyle?html}"
        </#if><#t/>
            title="${selectAllLabel}"
            onclick="selectAllOptionsExceptSome(document.getElementById('${parameters.id?html}'), 'key', '${parameters.headerKey}');selectAllOptions(document.getElementById('${parameters.doubleId?html}'));<#if parameters.selectAllOnclick?has_content>${parameters.selectAllOnclick};</#if>"
            ><#t/>
        <span class="glyphicon glyphicon-resize-horizontal"></span>
    </button>
    <#elseif parameters.doubleHeaderKey??><#t/>
    <button type="button"
        <#if parameters.buttonCssClass??><#t/>
            class="btn btn-default ${parameters.buttonCssClass?html}"
        <#else><#t/>
            class="btn btn-default"
        </#if><#t/>
        <#if parameters.buttonCssStyle??><#t/>
            style="${parameters.buttonCssStyle?html}"
        </#if><#t/>
            title="${selectAllLabel}"
            onclick="selectAllOptions(document.getElementById('${parameters.id?html}'));selectAllOptionsExceptSome(document.getElementById('${parameters.doubleId?html}'), 'key', '${parameters.doubleHeaderKey}');<#if parameters.selectAllOnclick?has_content>${parameters.selectAllOnclick};</#if>"
            ><#t/>
        <span class="glyphicon glyphicon-resize-horizontal"></span>
    </button>
    <#else><#t/>
    <button type="button"
        <#if parameters.buttonCssClass??><#t/>
            class="btn btn-default ${parameters.buttonCssClass?html}"
        <#else><#t/>
            class="btn btn-default"
        </#if><#t/>
        <#if parameters.buttonCssStyle??><#t/>
            style="${parameters.buttonCssStyle?html}"
        </#if><#t/>
            title="${selectAllLabel}"
            onclick="selectAllOptions(document.getElementById('${parameters.id?html}'));selectAllOptions(document.getElementById('${parameters.doubleId?html}'));<#if parameters.selectAllOnclick?has_content>${parameters.selectAllOnclick};</#if>"
            ><#t/>
        <span class="glyphicon glyphicon-resize-horizontal"></span>
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
            name="${parameters.doubleName?default("")?html}"
    <#if parameters.get("doubleSize")??><#t/>
            size="${parameters.get("doubleSize")?html}"
    </#if><#t/>
    <#if parameters.doubleDisabled?default(false)><#t/>
            disabled="disabled"
    </#if><#t/>
    <#if parameters.doubleMultiple?default(false)><#t/>
            multiple="multiple"
    </#if><#t/>
    <#if parameters.doubleTabindex??><#t/>
            tabindex="${parameters.tabindex?html}"
    </#if><#t/>
    <#if parameters.doubleId??><#t/>
            id="${parameters.doubleId?html}"
    </#if><#t/>
    <#if parameters.doubleCss??><#t/>
            class="form-control ${parameters.doubleCss?html}"
    <#else><#t/>
            class="form-control"
    </#if><#t/>
    <#if parameters.doubleStyle??><#t/>
            style="${parameters.doubleStyle?html}"
    </#if><#t/>
    <#if parameters.doubleOnclick??><#t/>
            onclick="${parameters.doubleOnclick?html}"
    </#if><#t/>
    <#if parameters.doubleOndblclick??><#t/>
            ondblclick="${parameters.doubleOndblclick?html}"
    </#if><#t/>
    <#if parameters.doubleOnmousedown??><#t/>
            onmousedown="${parameters.doubleOnmousedown?html}"
    </#if><#t/>
    <#if parameters.doubleOnmouseup??><#t/>
            onmouseup="${parameters.doubleOnmouseup?html}"
    </#if><#t/>
    <#if parameters.doubleOnmousemove??><#t/>
            onmousemove="${parameters.doubleOnmousemove?html}"
    </#if><#t/>
    <#if parameters.doubleOnmouseover??><#t/>
            onmouseover="${parameters.doubleOnmouseover?html}"
    </#if><#t/>
    <#if parameters.doubleOnmouseout??><#t/>
            onmouseout="${parameters.doubleOnmouseout?html}"
    </#if><#t/>
    <#if parameters.doubleOnfocus??><#t/>
            onfocus="${parameters.doubleOnfocus?html}"
    </#if><#t/>
    <#if parameters.doubleOnblur??><#t/>
            onblur="${parameters.doubleOnblur?html}"
    </#if><#t/>
    <#if parameters.doubleOnkeypress??><#t/>
            onkeypress="${parameters.doubleOnkeypress?html}"
    </#if><#t/>
    <#if parameters.doubleOnKeydown??><#t/>
            onkeydown="${parameters.doubleOnkeydown?html}"
    </#if><#t/>
    <#if parameters.doubleOnkeyup??><#t/>
            onkeyup="${parameters.doubleOnkeyup?html}"
    </#if><#t/>
    <#if parameters.doubleOnselect??><#t/>
            onselect="${parameters.doubleOnselect?html}"
    </#if><#t/>
    <#if parameters.doubleOnchange??><#t/>
            onchange="${parameters.doubleOnchange?html}"
    </#if><#t/>
    <#if parameters.doubleAccesskey??><#t/>
            accesskey="${parameters.doubleAccesskey?html}"
    </#if>
            >
    <#if parameters.doubleHeaderKey?? && parameters.doubleHeaderValue??><#t/>
        <option value="${parameters.doubleHeaderKey?html}">${parameters.doubleHeaderValue?html}</option>
    </#if><#t/>
    <#if parameters.doubleEmptyOption?default(false)><#t/>
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
        <option value="${doubleItemKeyStr?html}"<#rt/>
            <#if tag.contains(parameters.doubleNameValue, doubleItemKey)><#t/>
                selected="selected"<#rt/>
            </#if><#t/>
                >${doubleItemValue?html}</option><#lt/>
    </@s.iterator><#t/>
    </select>
<#if parameters.doubleMultiple?default(false)>
    <input type="hidden" id="__multiselect_${parameters.doubleId?html}"
           name="__multiselect_${parameters.doubleName?default("")?html}" value=""<#rt/>
        <#if parameters.doubleDisabled?default(false)>
           disabled="disabled"<#rt/>
        </#if>
            />
</#if>

<#if parameters.allowUpDownOnRight?default(true)>
    <div class="text-center">
        <div class="btn-group transferselect-btn transferselect-btn-bottom">
            <button type="button" class="btn btn-default"
                <#if parameters.rightDownLabel??>
                    title="${parameters.rightDownLabel?html}"
                </#if>
                    onclick="moveOptionDown(document.getElementById('${parameters.doubleId}'), 'key', <#if parameters.doubleHeaderKey??>'${parameters.doubleHeaderKey}'<#else>''</#if>);<#if parameters.upDownOnLeftOnclick?has_content>${parameters.upDownOnLeftOnclick};</#if>"<#t/>
                    ><#t/>
                <span class="glyphicon glyphicon-arrow-down"></span>
            </button>
            <button type="button" class="btn btn-default"
                <#if parameters.rightUpLabel??>
                    title="${parameters.rightUpLabel?html}"
                </#if>
                    onclick="moveOptionUp(document.getElementById('${parameters.doubleId}'), 'key', <#if parameters.doubleHeaderKey??>'${parameters.doubleHeaderKey}'<#else>''</#if>);<#if parameters.upDownOnLeftOnclick?has_content>${parameters.upDownOnLeftOnclick};</#if>"<#t/>
                    ><#t/>
                <span class="glyphicon glyphicon-arrow-up"></span>
            </button>
        </div>
    </div>
</#if>
</div>
</div>
<#include "/${parameters.templateDir}/bootstrap/controlfooter.ftl" />
