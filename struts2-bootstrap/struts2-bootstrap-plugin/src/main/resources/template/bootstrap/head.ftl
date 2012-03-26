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

<#if parameters.compressed?default(true)>
  <#assign jsFile="bootstrap.min.js">
  <#assign cssFile="bootstrap.min.css">
  <#assign responsiveFile="bootstrap-responsive.min.css">
  <#assign validationFile="validation.min.js">
<#else>
  <#assign jsFile="bootstrap.js">
  <#assign cssFile="bootstrap.css">
  <#assign responsiveFile="bootstrap-responsive.css">
  <#assign validationFile="validation.js">
</#if>

<#if parameters.includeScripts?default(true)>
	<script type="text/javascript" src="${base}/struts/bootstrap/js/${jsFile}"></script>
</#if>
<#if parameters.includeScriptsValidation?default(true)>
    <script type="text/javascript" src="${base}/struts/bootstrap/js/${validationFile}"></script>
</#if>
<#if parameters.includeStyles?default(true)>
   	<link id="bootstrap_styles" rel="stylesheet" href="${base}/struts/bootstrap/css/${cssFile}" type="text/css"/>
</#if>
<#if parameters.includeStylesResponsive?default(false)>
    <link id="bootstrap_responsive_styles" rel="stylesheet" href="${base}/struts/bootstrap/css/${cssFile}" type="text/css"/>
</#if>
