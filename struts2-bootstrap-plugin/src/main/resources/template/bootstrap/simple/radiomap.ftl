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
<#assign itemCount = 0/>
<@s.iterator value="parameters.list">
    <#assign itemCount = itemCount + 1/>
    <#if parameters.listKey??>
        <#assign itemKey = stack.findValue(parameters.listKey)/>
    <#else>
        <#assign itemKey = stack.findValue('top')/>
    </#if>
    <#assign itemKeyStr = itemKey.toString() />
    <#if parameters.listValue??>
        <#assign itemValue = stack.findString(parameters.listValue)/>
    <#else>
        <#assign itemValue = stack.findString('top')/>
    </#if>
    <#if parameters.labelposition?default("") == 'inline'>
        <#assign labelClass="radio-inline"/><#lt/>
    <#else>
        <#assign labelClass=""/>
        <div class="radio"><#lt/>
    </#if>
    <label for="${parameters.name?html}-${itemCount}" class="${labelClass}">
        <input type="radio" <#rt/>
            <#if parameters.name??>
               name="${parameters.name?html}" <#t/>
            </#if>
               id="${parameters.name?html}-${itemCount}" <#t/>
            <#if tag.contains(parameters.nameValue?default(''), itemKeyStr)>
               checked="checked" <#t/>
            </#if>
            <#if itemKey??>
               value="${itemKeyStr?html}" <#t/>
            </#if>
            <#if parameters.disabled?default(false)>
               disabled="disabled" <#t/>
            </#if>
            <#if parameters.tabindex??>
               tabindex="${parameters.tabindex?html}" <#t/>
            </#if>
            <#if parameters.cssStyle??>
               style="${parameters.cssStyle?html}" <#t/>
            </#if>
            <#include "/${parameters.templateDir}/simple/css.ftl" /> <#t/>
            <#if parameters.title??>
               title="${parameters.title?html}" <#t/>
            </#if>
            <#include "/${parameters.templateDir}/simple/scripting-events.ftl" />
            <#include "/${parameters.templateDir}/simple/common-attributes.ftl" />
        /><#lt/>
        ${itemValue}
    </label>
    <#if parameters.labelposition?default("") != 'inline'>
    </div><#lt/>
    </#if>
</@s.iterator>
