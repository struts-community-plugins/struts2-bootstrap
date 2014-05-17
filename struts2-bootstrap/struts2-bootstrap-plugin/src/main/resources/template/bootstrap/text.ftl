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
<#if (parameters.dynamicAttributes?? && parameters.dynamicAttributes?size > 0 && parameters.dynamicAttributes["inputPrepend"]??)><#rt/>
    <#assign inputPrepend = parameters.dynamicAttributes.remove("inputPrepend")/><#rt/>
</#if><#rt/>
<#if (parameters.dynamicAttributes?? && parameters.dynamicAttributes?size > 0 && parameters.dynamicAttributes["inputAppend"]??)><#rt/>
    <#assign inputAppend = parameters.dynamicAttributes.remove("inputAppend")/><#rt/>
</#if><#rt/>
<#if (parameters.dynamicAttributes?? && parameters.dynamicAttributes?size > 0 && parameters.dynamicAttributes["inputPrependIcon"]??)><#rt/>
    <#assign inputPrependIcon = parameters.dynamicAttributes.remove("inputPrependIcon")/><#rt/>
</#if><#rt/>
<#if (parameters.dynamicAttributes?? && parameters.dynamicAttributes?size > 0 && parameters.dynamicAttributes["inputAppendIcon"]??)><#rt/>
    <#assign inputAppendIcon = parameters.dynamicAttributes.remove("inputAppendIcon")/><#rt/>
</#if><#rt/>

<#if inputPrepend??>
<div class="input-group">
    <span class="input-group-addon">${inputPrepend?html}</span>
</#if>
<#if inputPrependIcon??>
<div class="input-group">
    <span class="input-group-addon"><i class="glyphicon glyphicon-${inputPrependIcon?html}"></i></span>
</#if>
<#if (inputAppend?? || inputAppendIcon??)>
<div class="input-group">
</#if>
<#include "/${parameters.templateDir}/simple/text.ftl" />
<#if (inputPrepend?? || inputPrependIcon??)>
</div>
</#if>
<#if inputAppend??>
    <span class="input-group-addon">${inputAppend?html}</span>
</div>
</#if>
<#if inputAppendIcon??>
    <span class="input-group-addon"><i class="glyphicon glyphicon-${inputAppendIcon?html}"></i></span>
</div>
</#if>
<#include "/${parameters.templateDir}/bootstrap/controlfooter.ftl" />
