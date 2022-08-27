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
<#if (parameters.dynamicAttributes?? && parameters.dynamicAttributes?size > 0 && parameters.dynamicAttributes["formGroupCssClass"]??)><#rt/>
    <#assign formGroupCssClass = parameters.dynamicAttributes.remove("formGroupCssClass")/><#rt/>
<#else>
    <@s.if test="#s2b_form_class == 'form-horizontal'">
        <#assign formGroupCssClass >mb-3 row</#assign><#rt/>
    </@s.if><#rt/>
    <@s.else>
        <#assign formGroupCssClass ></#assign><#rt/>
    </@s.else><#rt/>
</#if><#rt/>
<div class="form-group ${formGroupCssClass} <#t/>
    <#if hasFieldErrors> 
        is-invalid invalid-feedback <#t/>
    </#if>
    ${parameters.cssClass?default('')}" <#t/>
    <#if parameters.cssStyle??>
        style="${parameters.cssStyle}" <#t/>
    </#if>
>
    <div class="<@s.property value="#s2b_form_label_class" />"></div>
    <div class="<@s.property value="#s2b_form_element_class" /> controls">
    <#lt/>
    <#if parameters.labelposition?default("") == 'inline'>
    <div class="form-check-inline">
    <#else>
    <div class="form-check">
    </#if>
    <#if parameters.label??>
         <#include "/${parameters.templateDir}/${parameters.expandTheme}/simple/checkbox.ftl" />
        <label <#rt/>
                <#if parameters.id??>
                    for="${parameters.id}" <#t/>
                </#if>
                class="form-check-label"><#lt/>
            <#if parameters.required?default(false) && parameters.requiredposition?default("right") != 'right'>
                <span class="required">*</span><#rt/>
            </#if>
        ${parameters.label}<#t/>
        <#if parameters.required?default(false) && parameters.requiredposition?default("right") == 'right'>
            <span class="required">*</span><#t/>
        </#if>
        ${parameters.labelseparator?default("")}<#t/>
        <#include "/${parameters.templateDir}/${parameters.expandTheme}/tooltip.ftl" />
    </#if>
    <#if parameters.label??>
    </label>
    </div><#t/>
    </#if>
    <#include "/${parameters.templateDir}/${parameters.expandTheme}/controlfooter.ftl" /><#nt/>
