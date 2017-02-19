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
<#assign hasFieldErrors = fieldErrors?? && fieldErrors[parameters.name]??/>
<div class="form-group <#t/>
    <#if hasFieldErrors> 
        has-error has-feedback <#t/>
    </#if>
    ${parameters.cssClass?default('')?html}" <#t/>
    <#if parameters.cssStyle??>
        style="${parameters.cssStyle?html}" <#t/>
    </#if>
>
    <div class="<@s.property value="#s2b_form_label_class" />"></div>
    <div class="<@s.property value="#s2b_form_element_class" /> controls">
    <#lt/>
    <#if parameters.labelposition?default("") == 'inline'>
    <div class="checkbox-inline">
    <#else>
    <div class="checkbox">
    </#if>
    <#if parameters.label??>
    <label <#rt/>
        <#if parameters.id??>
                for="${parameters.id?html}" <#t/>
        </#if>
    ><#lt/>
        <#if parameters.required?default(false) && parameters.requiredposition?default("right") != 'right'>
            <span class="required">*</span><#rt/>
        </#if>
        <#include "/${parameters.templateDir}/bootstrap/simple/checkbox.ftl" />
        ${parameters.label?html}<#t/>
        <#if parameters.required?default(false) && parameters.requiredposition?default("right") == 'right'>
            <span class="required">*</span><#t/>
        </#if>
        ${parameters.labelseparator?default("")?html}<#t/>
        <#include "/${parameters.templateDir}/bootstrap/tooltip.ftl" />
    </#if>
    <#if parameters.label??>
    </label>
    </div><#t/>
    </#if>
    <#include "/${parameters.templateDir}/bootstrap/controlfooter.ftl" /><#nt/>
