<#--
/*
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

<#if !stack.findValue("#inputtransferselect_js_included")??><#t/>
<script type="text/javascript"
        src="<@s.url value="${parameters.staticContentPath}/inputtransferselect.js" encode='false' includeParams='none'/>"></script>
    <#assign temporaryVariable = stack.setValue("#inputtransferselect_js_included", "true") /><#t/>
</#if><#t/>
<div class="row">
    <div class="col-md-5">

    <#if parameters.leftTitle??><#t/>
        <label for="leftTitle">${parameters.leftTitle}</label><br/>
    </#if><#t/>


        <input type="text"<#rt/>
               name="${parameters.name!""}_input"<#rt/>
        <#if parameters.disabled!false>
               disabled="disabled"<#rt/>
        </#if>
        <#if parameters.readonly!false>
               readonly="readonly"<#rt/>
        </#if>
        <#if parameters.tabindex??>
               tabindex="${parameters.tabindex}"<#rt/>
        </#if>
        <#if parameters.id??>
               id="${parameters.id}_input"<#rt/>
        </#if>
        <#if parameters.cssClass??>
               class="form-control ${parameters.cssClass}"<#rt/>
        <#else>
               class="form-control"<#rt/>
        </#if>
        <#if parameters.cssStyle??>
               style="${parameters.cssStyle}"<#rt/>
        </#if>
        <#if parameters.title??>
               title="${parameters.title}"<#rt/>
        </#if>
        <#include "/${parameters.templateDir}/${parameters.expandTheme}/scripting-events.ftl" />
        <#include "/${parameters.templateDir}/${parameters.expandTheme}/common-attributes.ftl" />
                />
    </div>

    <div class="col-md-2 text-center">
        <div class="btn-group-vertical transferselect-btn transferselect-btn-middle">
        <#assign addLabel=parameters.addLabel!"Add" /><#t/>
            <button type="button"
            <#if parameters.buttonCssClass??><#t/>
                    class="btn ${parameters.buttonCssClass}"
            <#else><#t/>
                    class="btn btn-outline-secondary"
            </#if><#t/>
            <#if parameters.buttonCssStyle??><#t/>
                    style="${parameters.buttonCssStyle}"
            </#if><#t/>
                    title="${addLabel}"
                    onclick="addOption(document.getElementById('${parameters.id}_input'), document.getElementById('${parameters.id}'))"
                    ><#t/>
                <span class="bi bi-plus-circle"></span>
            </button>
        <#t/>
        <#assign removeLabel=parameters.removeLabel!"Remove" /><#t/>
            <button type="button"
            <#if parameters.buttonCssClass??><#t/>
                    class="btn ${parameters.buttonCssClass}"
            <#else><#t/>
                    class="btn btn-outline-secondary"
            </#if><#t/>
            <#if parameters.buttonCssStyle??><#t/>
                    style="${parameters.buttonCssStyle}"
            </#if><#t/>
                    title="${removeLabel}"
                    onclick="removeOptions(document.getElementById('${parameters.id}'))"
                    ><#t/>
                <span class="bi bi-dash-circle"></span>
            </button>
        <#t/>
        <#assign removeAllLabel=parameters.removeAllLabel!"Remove all" /><#t/>
            <button type="button"
            <#if parameters.buttonCssClass??><#t/>
                    class="btn ${parameters.buttonCssClass}"
            <#else><#t/>
                    class="btn btn-outline-secondary"
            </#if><#t/>
            <#if parameters.buttonCssStyle??><#t/>
                    style="${parameters.buttonCssStyle}"
            </#if><#t/>
                    title="${removeAllLabel}"
                    onclick="removeAllOptions(document.getElementById('${parameters.id}'))"
                    ><#t/>
                <span class="bi bi-dash-circle-fill"></span>
            </button>
        </div>
    </div>
    <div class="col-md-5">
    <#if parameters.rightTitle??><#t/>
        <label for="rightTitle">${parameters.rightTitle}</label><br/>
    </#if><#t/>
    <#include "/${parameters.templateDir}/${parameters.expandTheme}/simple/select.ftl" />
    <#if parameters.allowUpDown!true>
        <div class="text-center">
            <div class="btn-group transferselect-btn transferselect-btn-bottom">
                <button type="button" class="btn btn-outline-secondary"
                    <#if parameters.downLabel??>
                        title="${parameters.downLabel}"
                    </#if>
                    <#if parameters.headerKey??>
                        onclick="moveOptionDown(document.getElementById('${parameters.id}'), 'key', '${parameters.headerKey}');"
                    <#else>
                        onclick="moveOptionDown(document.getElementById('${parameters.id}'), 'key', '');"
                    </#if>
                        ><#t/>
                    <span class="bi bi-arrow-down-circle"></span>
                </button>
                <button type="button" class="btn btn-outline-secondary"
                    <#if parameters.downLabel??>
                        title="${parameters.upLabel}"
                    </#if>
                    <#if parameters.headerKey??>
                        onclick="moveOptionUp(document.getElementById('${parameters.id}'), 'key', '${parameters.headerKey}');"
                    <#else>
                        onclick="moveOptionUp(document.getElementById('${parameters.id}'), 'key', '');"
                    </#if>
                        ><#t/>
                    <span class="bi bi-arrow-up-circle"></span>
                </button>
            </div>
        </div>
    </#if>
    </div>
</div>
<#include "/${parameters.templateDir}/${parameters.expandTheme}/controlfooter.ftl" /><#nt/>
