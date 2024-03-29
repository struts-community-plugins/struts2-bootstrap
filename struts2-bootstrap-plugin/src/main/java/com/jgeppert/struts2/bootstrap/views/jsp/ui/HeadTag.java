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

package com.jgeppert.struts2.bootstrap.views.jsp.ui;

import com.jgeppert.struts2.bootstrap.components.Head;
import com.opensymphony.xwork2.util.ValueStack;
import org.apache.struts2.components.Component;
import org.apache.struts2.views.jsp.ui.AbstractUITag;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author <a href="https://www.jgeppert.com">Johannes Geppert</a>
 * @see Head
 */
public class HeadTag extends AbstractUITag {

    private static final long serialVersionUID = 6876765769175246030L;

    protected String compressed;
    protected String includeStyles;
    protected String includeScripts;

    public Component getBean(ValueStack stack, HttpServletRequest req, HttpServletResponse res) {
        return new Head(stack, req, res);
    }

    protected void populateParams() {
        super.populateParams();

        Head head = (Head) component;
        head.setCompressed(compressed);
        head.setIncludeStyles(includeStyles);
        head.setIncludeScripts(includeScripts);
    }

    public void setCompressed(String compressed) {
        this.compressed = compressed;
    }

    public void setIncludeStyles(String includeStyles) {
        this.includeStyles = includeStyles;
    }

    public void setIncludeScripts(String includeScripts) {
        this.includeScripts = includeScripts;
    }


}
