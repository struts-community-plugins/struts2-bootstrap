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
${parameters.after!}<#rt/>
<#assign hasFieldErrors = parameters.name?has_content && fieldErrors?has_content && fieldErrors.get("${parameters.name?j_string}")?has_content/><#rt/>
<#if hasFieldErrors>
    <#assign errors = fieldErrors.get(parameters.name?j_string) /><#rt/>
    <#list errors as error>
<div class="invalid-feedback">${error}</div>
    </#list>
</#if>
<#if helpText??>
<small class="form-text text-muted">${helpText}</small>
</#if>
<@s.if test="#s2b_form_element_class != 'form-inline'">
</div>
</div>
</@s.if>