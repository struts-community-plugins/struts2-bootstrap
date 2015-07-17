<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="struts2, twitter, bootstrap, plugin, showcase" />
    <meta name="description" content="Enable Client Side Validation - A Showcase for the Struts2 Bootstrap Plugin" />
    <title>Client Side Validation - Struts2 Bootstrap Plugin Showcase - <s:text name="showcase.version"/></title>

    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <sj:head jqueryui="false"/>
    <sb:head includeScripts="true" includeScriptsValidation="true"/>

    <style type="text/css">
        body {
            padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
        }
    </style>
</head>
<body>

<nav class="navbar navbar-default navbar-fixed-top">
    <div class="navbar-header">
        <a class="navbar-brand" href="#">Struts2 Bootstrap Plugin Showcase - <s:text name="showcase.version"/></a>
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
    </div>
    <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav">
            <s:url var="index_url" action="index"/>
            <li class="active"><s:a href="%{index_url}">Home</s:a></li>
            <s:url var="about_url" action="about"/>
            <li><s:a href="%{about_url}">About</s:a></li>
            <li><a href="https://github.com/struts-community-plugins/struts2-bootstrap/">Project</a></li>
        </ul>
    </div>
</nav>


<div class="container">
    <div class="row">
        <div class="col-md-3">
            <div class="well sidebar-nav">
                <ul class="nav nav-list">
                    <li class="nav-header">
                    Form Layouts
                    </li>
                    <s:url var="index_url" action="index"/>
                    <li><s:a href="%{index_url}">Horizontal Form Layout</s:a></li>
                    <s:url var="vertical_url" action="vertical"/>
                    <li><s:a href="%{vertical_url}">Vertical Form Layout</s:a></li>
                    <s:url var="validation_url" action="validation"/>
                    <li class="active"><s:a href="%{validation_url}">Client Validation</s:a></li>
                    <s:url var="advanced_url" action="advanced"/>
                    <li><s:a href="%{advanced_url}">Advanced Examples</s:a></li>
                    <s:url var="jquery_url" action="jquery"/>
                    <li><s:a href="%{jquery_url}">Struts2 jQuery UI Form Elements</s:a></li>
                    <s:url var="custom_url" action="custom"/>
                    <li><s:a href="%{custom_url}">With Custom Theme</s:a></li>
                 </ul>
            </div>
        </div>
        <div class="col-md-9">

            <h1>Client Validation</h1>

            <p>Struts2 Bootstrap Plugin Example with Client Validation.</p>

            <s:actionerror theme="bootstrap"/>
            <s:actionmessage theme="bootstrap"/>
            <s:fielderror theme="bootstrap"/>


            <s:form id="validationForm"
                    action="validation-submit"
                    theme="bootstrap"
                    cssClass="form-horizontal"
                    labelCssClass="col-sm-2"
                    elementCssClass="col-sm-7"
                    label="A sample Registration Form">

                <s:textfield
                        label="Username"
                        name="user"
                        requiredLabel="true"
                        tooltip="Enter your Username here"/>

                <s:password
                        label="Password"
                        name="password"
                        requiredLabel="true"
                        tooltip="Enter your Password here"/>

                <s:textarea
                        tooltip="Enter your Biography"
                        label="Biography"
                        name="biograhy"
                        cols="20"
                        rows="3"/>

                <s:select
                        tooltip="Choose Your Favourite Color"
                        label="Favorite Color"
                        list="{'Red', 'Blue', 'Green'}"
                        name="favourite"
                        emptyOption="true"/>

                <s:checkbox
                        tooltip="Confirmed that you accept the Agreement"
                        label="Accept the Agreement?"
                        name="agree"/>

                <div class="form-group">
                    <div class="col-sm-offset-3 col-md-9">
                        <sj:submit cssClass="btn btn-primary" formIds="validationForm" validate="true" validateFunction="bootstrapValidation"/>
                    </div>
                </div>

            </s:form>
        </div>
    </div>

    <footer class="footer">
        <p class="pull-right"><a href="#">Back to top</a></p>

        <p>Created by <a href="http://twitter.com/jogep" target="_blank">@jogep</a>.</p>
    </footer>

</div>
<!-- /container -->
</body>
</html>
