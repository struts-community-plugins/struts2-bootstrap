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

package com.jgeppert.struts2.bootstrap.showcase;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.validator.annotations.*;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

@ParentPackage(value = "showcase")
@InterceptorRef("jsonValidationWorkflowStack")
@Result(location = "validation.jsp", name = "success")
@Validations(requiredStrings = {
        @RequiredStringValidator(fieldName = "user", type = ValidatorType.FIELD, message = "Username is required"),
        @RequiredStringValidator(fieldName = "password", type = ValidatorType.FIELD, message = "Password is required"),
        @RequiredStringValidator(fieldName = "favourite", type = ValidatorType.FIELD, message = "Choose your Favourite Color"),
        @RequiredStringValidator(fieldName = "biograhy", type = ValidatorType.FIELD, message = "Biography is required")
}, expressions = {
        @ExpressionValidator(expression = "password.trim().length() > 5", message = "Password must have as minimum 6 Characters.")
}, fieldExpressions = {
        @FieldExpressionValidator(fieldName = "password", expression = "password.trim().length() > 6", message = "Password must have as minimum 6 Characters."),
        @FieldExpressionValidator(fieldName = "agree", expression = "agree == true", message = "Accept the Agreement.")
})
public class ValidationSubmit extends ActionSupport {

    private String user;
    private String password;
    private boolean agree = false;
    private String biograhy;
    private String favourite;

    public String execute() throws Exception {

        // Reset the Form Values
        user = "";
        password = "";
        agree = false;
        biograhy = "";
        favourite = "";

        addActionMessage("Thank you for Registration!");

        return SUCCESS;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isAgree() {
        return agree;
    }

    public void setAgree(boolean agree) {
        this.agree = agree;
    }

    public String getBiograhy() {
        return biograhy;
    }

    public void setBiograhy(String biograhy) {
        this.biograhy = biograhy;
    }

    public String getFavourite() {
        return favourite;
    }

    public void setFavourite(String favourite) {
        this.favourite = favourite;
    }
}
