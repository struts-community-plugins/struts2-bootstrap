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
<#if (parameters.dynamicAttributes?? && parameters.dynamicAttributes?size > 0 && parameters.dynamicAttributes["labelCssClass"]??)><#rt/>
    <#assign labelCssClass = parameters.dynamicAttributes.remove("labelCssClass")/><#rt/>
<#else>
    <#assign labelCssClass ><@s.property value="#s2b_form_label_class" /></#assign><#rt/>
</#if><#rt/>
<#if (parameters.dynamicAttributes?? && parameters.dynamicAttributes?size > 0 && parameters.dynamicAttributes["elementCssClass"]??)><#rt/>
    <#assign elementCssClass = parameters.dynamicAttributes.remove("elementCssClass")/><#rt/>
<#else>
    <#assign elementCssClass ><@s.property value="#s2b_form_element_class" /></#assign><#rt/>
</#if><#rt/>

<div class="form-group <#t/>
    <#if hasFieldErrors>
        has-error has-feedback <#t/>
    </#if>
    ${parameters.cssClass?default('')?html}" <#t/>
    <#if parameters.cssStyle??>
        style="${parameters.cssStyle?html}" <#t/>
    </#if>
>
<#if parameters.label??>
    <label class="${labelCssClass?html} /> control-label">
        <#if parameters.required?default(false) && parameters.requiredposition?default("right") != 'right'>
            <span class="required">*</span><#t/>
        </#if>
    ${parameters.label?html}<#t/>
        <#if parameters.required?default(false) && parameters.requiredposition?default("right") == 'right'>
            <span class="required">*</span><#t/>
        </#if>
    ${parameters.labelseparator?default("")?html}<#t/>
        <#include "/${parameters.templateDir}/bootstrap/tooltip.ftl" />
    </label>
</#if>
    <div class="${elementCssClass?html} controls">
    <#lt/>
<#include "/${parameters.templateDir}/bootstrap/simple/radiomap.ftl" />
<#include "/${parameters.templateDir}/bootstrap/controlfooter.ftl" /><#nt/>
