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
<#include "/${parameters.templateDir}/bootstrap/controlheader.ftl" />
<#if !stack.findValue("#inputtransferselect_js_included")??><#t/>
<script type="text/javascript"
        src="<@s.url value="/struts/inputtransferselect.js" encode='false' includeParams='none'/>"></script>
    <#assign temporaryVariable = stack.setValue("#inputtransferselect_js_included", "true") /><#t/>
</#if><#t/>
<div class="row">
    <div class="col-md-5">

    <#if parameters.leftTitle??><#t/>
        <label for="leftTitle">${parameters.leftTitle}</label><br/>
    </#if><#t/>


        <input type="text"<#rt/>
               name="${parameters.name?default("")?html}_input"<#rt/>
        <#if parameters.disabled?default(false)>
               disabled="disabled"<#rt/>
        </#if>
        <#if parameters.readonly?default(false)>
               readonly="readonly"<#rt/>
        </#if>
        <#if parameters.tabindex??>
               tabindex="${parameters.tabindex?html}"<#rt/>
        </#if>
        <#if parameters.id??>
               id="${parameters.id?html}_input"<#rt/>
        </#if>
        <#if parameters.cssClass??>
               class="form-control ${parameters.cssClass?html}"<#rt/>
        <#else>
               class="form-control"<#rt/>
        </#if>
        <#if parameters.cssStyle??>
               style="${parameters.cssStyle?html}"<#rt/>
        </#if>
        <#if parameters.title??>
               title="${parameters.title?html}"<#rt/>
        </#if>
        <#include "/${parameters.templateDir}/${parameters.expandTheme}/scripting-events.ftl" />
        <#include "/${parameters.templateDir}/${parameters.expandTheme}/common-attributes.ftl" />
                />
    </div>

    <div class="col-md-2 text-center">
        <div class="btn-group-vertical transferselect-btn transferselect-btn-middle">
        <#assign addLabel=parameters.addLabel?default("Add")?html /><#t/>
            <button type="button"
            <#if parameters.buttonCssClass??><#t/>
                    class="btn btn-default ${parameters.buttonCssClass?html}"
            <#else><#t/>
                    class="btn btn-default"
            </#if><#t/>
            <#if parameters.buttonCssStyle??><#t/>
                    style="${parameters.buttonCssStyle?html}"
            </#if><#t/>
                    title="${addLabel?html}"
                    onclick="addOption(document.getElementById('${parameters.id?html}_input'), document.getElementById('${parameters.id?html}'))"
                    ><#t/>
                <span class="glyphicon glyphicon-plus"></span>
            </button>
        <#t/>
        <#assign removeLabel=parameters.removeLabel?default("Remove")?html /><#t/>
            <button type="button"
            <#if parameters.buttonCssClass??><#t/>
                    class="btn btn-default ${parameters.buttonCssClass?html}"
            <#else><#t/>
                    class="btn btn-default"
            </#if><#t/>
            <#if parameters.buttonCssStyle??><#t/>
                    style="${parameters.buttonCssStyle?html}"
            </#if><#t/>
                    title="${removeLabel?html}"
                    onclick="removeOptions(document.getElementById('${parameters.id?html}'))"
                    ><#t/>
                <span class="glyphicon glyphicon-remove"></span>
            </button>
        <#t/>
        <#assign removeAllLabel=parameters.removeAllLabel?default("Remove all")?html /><#t/>
            <button type="button"
            <#if parameters.buttonCssClass??><#t/>
                    class="btn btn-default ${parameters.buttonCssClass?html}"
            <#else><#t/>
                    class="btn btn-default"
            </#if><#t/>
            <#if parameters.buttonCssStyle??><#t/>
                    style="${parameters.buttonCssStyle?html}"
            </#if><#t/>
                    title="${removeAllLabel?html}"
                    onclick="removeAllOptions(document.getElementById('${parameters.id?html}'))"
                    ><#t/>
                <span class="glyphicon glyphicon-remove-circle"></span>
            </button>
        </div>
    </div>
    <div class="col-md-5">
    <#if parameters.rightTitle??><#t/>
        <label for="rightTitle">${parameters.rightTitle}</label><br/>
    </#if><#t/>
    <#include "/${parameters.templateDir}/bootstrap/simple/select.ftl" />
    <#if parameters.allowUpDown?default(true)>
        <div class="text-center">
            <div class="btn-group transferselect-btn transferselect-btn-bottom">
                <button type="button" class="btn btn-default"
                    <#if parameters.downLabel??>
                        title="${parameters.downLabel?html}"
                    </#if>
                    <#if parameters.headerKey??>
                        onclick="moveOptionDown(document.getElementById('${parameters.id}'), 'key', '${parameters.headerKey}');"
                    <#else>
                        onclick="moveOptionDown(document.getElementById('${parameters.id}'), 'key', '');"
                    </#if>
                        ><#t/>
                    <span class="glyphicon glyphicon-arrow-down"></span>
                </button>
                <button type="button" class="btn btn-default"
                    <#if parameters.downLabel??>
                        title="${parameters.upLabel?html}"
                    </#if>
                    <#if parameters.headerKey??>
                        onclick="moveOptionUp(document.getElementById('${parameters.id}'), 'key', '${parameters.headerKey}');"
                    <#else>
                        onclick="moveOptionUp(document.getElementById('${parameters.id}'), 'key', '');"
                    </#if>
                        ><#t/>
                    <span class="glyphicon glyphicon-arrow-up"></span>
                </button>
            </div>
        </div>
    </#if>
    </div>
</div>
<#include "/${parameters.templateDir}/bootstrap/controlfooter.ftl" /><#nt/>
