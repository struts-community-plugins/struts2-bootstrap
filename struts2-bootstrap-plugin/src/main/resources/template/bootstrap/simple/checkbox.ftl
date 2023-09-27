<#--
/*
 * $Id: checkbox.ftl 1536435 2013-10-28 17:29:30Z lukaszlenart $
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
<input type="checkbox" name="${parameters.name}" value="${parameters.fieldValue}" class="form-check-input" <#rt/>
    <#if parameters.nameValue?? && parameters.nameValue>
        checked="checked" <#t/>
    </#if>
    <#if parameters.disabled!false>
        disabled="disabled" <#t/>
    </#if>
    <#if parameters.readonly!false>
        readonly="readonly" <#t/>
    </#if>
    <#if parameters.tabindex??>
        tabindex="${parameters.tabindex}" <#t/>
    </#if>
    <#if parameters.id??>
        id="${parameters.id}" <#t/>
    </#if>
    <#include "/${parameters.templateDir}/simple/css.ftl" />
    <#if parameters.title??>
        title="${parameters.title}" <#t/>
    </#if>
    <#include "/${parameters.templateDir}/${parameters.expandTheme}/scripting-events.ftl" /> <#t/>
    <#include "/${parameters.templateDir}/${parameters.expandTheme}/common-attributes.ftl" /> <#t/>
    <#include "/${parameters.templateDir}/${parameters.expandTheme}/dynamic-attributes.ftl" /> <#t/>
/>
<input type="hidden" id="__checkbox_${parameters.id}" name="__checkbox_${parameters.name}" <#rt/>
    value="${parameters.fieldValue}" <#t/>
    <#if parameters.disabled!false>
        disabled="disabled"<#rt/>
    </#if>
/>
