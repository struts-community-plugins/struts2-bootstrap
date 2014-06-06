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

<#if parameters.cssClass?? && parameters.cssClass?contains("form-horizontal") >
    <#if (parameters.dynamicAttributes?? && parameters.dynamicAttributes?size > 0 && parameters.dynamicAttributes["labelCssClass"]??)><#rt/>
        <#assign labelCssClass = parameters.dynamicAttributes.remove("labelCssClass")/><#rt/>
    <#else>
        <#assign labelCssClass = "col-sm-3"/><#rt/>
    </#if><#rt/>
    <#if (parameters.dynamicAttributes?? && parameters.dynamicAttributes?size > 0 && parameters.dynamicAttributes["elementCssClass"]??)><#rt/>
        <#assign elementCssClass = parameters.dynamicAttributes.remove("elementCssClass")/><#rt/>
    <#else>
        <#assign elementCssClass = "col-sm-9"/><#rt/>
    </#if><#rt/>
    <@s.set name="s2b_form_label_class">${labelCssClass}</@s.set>
    <@s.set name="s2b_form_element_class">${elementCssClass}</@s.set>
<#else>
    <@s.set name="s2b_form_label_class"> </@s.set>
    <@s.set name="s2b_form_element_class"> </@s.set>
</#if>

<#include "/${parameters.templateDir}/simple/form-common.ftl" />
<#if (parameters.validate?default(false))>
onreset="${parameters.onreset?default('clearErrorMessages(this);clearErrorLabels(this);')}"
<#else>
    <#if parameters.onreset??>
    onreset="${parameters.onreset?html}"
    </#if>
</#if>
>
<#include "/${parameters.templateDir}/bootstrap/control.ftl" />
