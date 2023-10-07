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
<#assign struts2BootstrapVersion="${version}"><#rt/>
<#if parameters.compressed!true>
    <#assign jsFile="bootstrap.bundle.min.js"><#rt/>
    <#assign cssFile="bootstrap.min.css"><#rt/>
    <#assign cssIconsFile="bootstrap-icons.css"><#rt/>
    <#assign validationFile="validation.min.js"><#rt/>
<#else>
    <#assign jsFile="bootstrap.bundle.js"><#rt/>
    <#assign cssFile="bootstrap.css"><#rt/>
    <#assign cssIconsFile="bootstrap-icons.css"><#rt/>
    <#assign validationFile="validation.js"><#rt/>
</#if>
<#if parameters.includeScripts!true>
<@s.script src="${base}${parameters.staticContentPath}/bootstrap/js/${jsFile}?s2b=${struts2BootstrapVersion}"/>
</#if>
<#if parameters.includeScriptsValidation!true>
<@s.script src="${base}${parameters.staticContentPath}/bootstrap/js/${validationFile}?s2b=${struts2BootstrapVersion}"/>
</#if>
<#if parameters.includeStyles!true>
<@s.link id="bootstrap_styles" rel="stylesheet"
      href="${base}${parameters.staticContentPath}bootstrap/css/${cssFile}?s2b=${struts2BootstrapVersion}" type="text/css"/>
<@s.link id="bootstrap_styles_icons" rel="stylesheet"
      href="${base}${parameters.staticContentPath}/bootstrap/bootstrap-icons/${cssIconsFile}?s2b=${struts2BootstrapVersion}" type="text/css"/>
</#if>
