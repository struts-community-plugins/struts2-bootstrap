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

package com.jgeppert.struts2.bootstrap.components;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.views.annotations.StrutsTag;
import org.apache.struts2.views.annotations.StrutsTagAttribute;
import org.apache.struts2.views.annotations.StrutsTagSkipInheritance;

import com.opensymphony.xwork2.util.ValueStack;

/**
 * <!-- START SNIPPET: notice -->
 * <p/>
 * <p>
 * The "head" tag renders required JavaScript
 * code to configure Bootstrap and is required in order to use any of the tags
 * included in the Bootstrap plugin.</p>
 * <p/>
 * <!-- END SNIPPET: notice -->
 * <p/>
 * <p/>
 * <p/>
 * <b>Examples</b>
 * <p/>
 * <!-- START SNIPPET: example1 -->
 * <p/>
 * <pre>
 * &lt;%@ taglib prefix=&quot;sb&quot; uri=&quot;/struts-bootstrap-tags&quot; %&gt;
 * &lt;head&gt;
 *   &lt;title&gt;My page&lt;/title&gt;
 *   &lt;sb:head/&gt;
 * &lt;/head&gt;
 * </pre>
 * <p/>
 * <!-- END SNIPPET: example1 -->
 * <p/>
 * <!-- START SNIPPET: example2 -->
 * <p/>
 * <pre>
 * &lt;%@ taglib prefix=&quot;sb&quot; uri=&quot;/struts-bootstrap-tags&quot; %&gt;
 * &lt;head&gt;
 *   &lt;title&gt;My page&lt;/title&gt;
 *   &lt;sb:head compressed=&quot;false&quot;/&gt;
 * &lt;/head&gt;
 * </pre>
 * <p/>
 * <!-- END SNIPPET: example2 -->
 *
 * @author <a href="http://www.jgeppert.com">Johannes Geppert</a>
 */
@StrutsTag(name = "head", tldBodyContent = "empty", tldTagClass = "com.jgeppert.struts2.bootstrap.views.jsp.ui.HeadTag", description = "Render a chunk of HEAD for your HTML file", allowDynamicAttributes = false)
@StrutsTagSkipInheritance
public class Head extends org.apache.struts2.components.Head {
    public static final String TEMPLATE = "head";
    protected String compressed;
    protected String includeStyles;
    protected String includeScripts;
    protected String includeScriptsValidation;

    public Head(ValueStack stack, HttpServletRequest request, HttpServletResponse response) {
        super(stack, request, response);
    }

    protected String getDefaultTemplate() {
        return TEMPLATE;
    }

    public void evaluateParams() {
        super.evaluateParams();
        if (this.compressed != null) addParameter("compressed", findValue(this.compressed, Boolean.class));
        if (this.includeStyles != null) addParameter("includeStyles", findValue(this.includeStyles, Boolean.class));
        if (this.includeScripts != null) addParameter("includeScripts", findValue(this.includeScripts, Boolean.class));
        if (this.includeScriptsValidation != null)
            addParameter("includeScriptsValidation", findValue(this.includeScriptsValidation, Boolean.class));
    }

    @Override
    @StrutsTagSkipInheritance
    public void setTheme(String theme) {
        super.setTheme(theme);
    }

    @Override
    public String getTheme() {
        return "bootstrap";
    }

    @StrutsTagAttribute(description = "use compressed version of bootstrap resources", defaultValue = "true", type = "Boolean")
    public void setCompressed(String compressed) {
        this.compressed = compressed;
    }

    @StrutsTagAttribute(description = "include bootstrap responsive styles", defaultValue = "true", type = "Boolean")
    public void setIncludeStyles(String includeStyles) {
        this.includeStyles = includeStyles;
    }

    @StrutsTagAttribute(description = "include bootstrap scripts", defaultValue = "true", type = "Boolean")
    public void setIncludeScripts(String includeScripts) {
        this.includeScripts = includeScripts;
    }

    @StrutsTagAttribute(description = "include bootstrap validation scripts", defaultValue = "true", type = "Boolean")
    public void setIncludeScriptsValidation(String includeScriptsValidation) {
        this.includeScriptsValidation = includeScriptsValidation;
    }
}
