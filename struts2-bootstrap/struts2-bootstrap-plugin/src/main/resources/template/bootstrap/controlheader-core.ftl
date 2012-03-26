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

<#--
	if the label position is top,
	then give the label it's own row in the table
-->
<div class="control-group <#rt/>
<#if hasFieldErrors> 
 error <#rt/>
</#if>
${parameters.cssClass?default('')?html}"<#rt/>
<#if parameters.cssStyle??> style="${parameters.cssStyle?html}"<#rt/>
</#if>
>
<#if parameters.label??>
    <label class="control-label" <#t/>
<#if parameters.id??>
        for="${parameters.id?html}" <#t/>
</#if>
    ><#t/>
<#if parameters.required?default(false) && parameters.requiredposition?default("right") != 'right'>
        <span class="required">*</span><#t/>
</#if>
${parameters.label?html}<#t/>
<#if parameters.required?default(false) && parameters.requiredposition?default("right") == 'right'>
 <span class="required">*</span><#t/>
</#if>
${parameters.labelseparator?default("")?html}<#t/>
<#include "/${parameters.templateDir}/${parameters.theme}/tooltip.ftl" /> 
</label><#t/>
</#if>
<div class="controls">
<#lt/>
<#-- add the extra row -->
<#if (parameters.dynamicAttributes?? && parameters.dynamicAttributes?size > 0 && parameters.dynamicAttributes["helpText"]??)><#rt/>
<#assign helpText = parameters.dynamicAttributes.remove("helpText")/><#rt/>
</#if><#rt/>
