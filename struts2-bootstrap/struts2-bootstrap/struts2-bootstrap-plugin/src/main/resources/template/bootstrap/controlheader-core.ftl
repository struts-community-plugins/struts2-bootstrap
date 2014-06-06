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
<#--
	Only show message if errors are available.
	This will be done if ActionSupport is used.
-->
<#assign hasFieldErrors = parameters.name?? && fieldErrors?? && fieldErrors[parameters.name]??/>

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


<div class="form-group <#rt/>
<#if hasFieldErrors> 
 has-error has-feedback<#rt/>
</#if>
"><#rt/>
<#if parameters.label??>
    <label class="${labelCssClass?html} control-label" <#t/>
        <#if parameters.id??>
           for="${parameters.id?html}" <#rt/>
        </#if>
            ><#rt/>
        <#if parameters.required?default(false) && parameters.requiredposition?default("right") != 'right'>
            <span class="required">*</span><#rt/>
        </#if>
    ${parameters.label?html}<#t/>
        <#if parameters.required?default(false) && parameters.requiredposition?default("right") == 'right'>
            <span class="required">*</span><#rt/>
        </#if>
    ${parameters.labelseparator?default("")?html}<#rt/>
        <#include "/${parameters.templateDir}/bootstrap/tooltip.ftl" />
    </label><#rt/>
</#if>
<#lt/>
    <div class="${elementCssClass?html} controls">
    <#if (parameters.dynamicAttributes?? && parameters.dynamicAttributes?size > 0 && parameters.dynamicAttributes["helpText"]??)><#rt/>
        <#assign helpText = parameters.dynamicAttributes.remove("helpText")/><#rt/>
    </#if><#rt/>
