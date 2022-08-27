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

    <s:head />
    <sj:head jqueryui="false"/>
    <sb:head includeScripts="true"/>

    <style type="text/css">
        body {
            padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
        }
    </style>
</head>
<body>

    <nav class="navbar navbar-expand-md navbar-light bg-light fixed-top">
        <a class="navbar-brand" href="#">Struts2 Bootstrap Plugin Showcase - <s:text name="showcase.version"/></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
  
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <s:url var="index_url" action="index"/>
                    <s:a href="%{index_url}" cssClass="nav-link">Home</s:a>
                </li>
                <li class="nav-item">
                    <s:url var="about_url" action="about"/>
                    <s:a href="%{about_url}" cssClass="nav-link">About</s:a>
                </li>
                <li class="nav-item">
                    <a href="https://github.com/struts-community-plugins/struts2-bootstrap/" class="nav-link">Project</a>
                </li>
            </ul>
        </div>
    </nav>

<div class="container">
    <div class="row">
        <div class="col-md-3">
            <div class="card">
                <div class="card-header">
                     Form Layouts
                </div>
                <div class="card-body">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <s:url var="index_url" action="index"/>
                            <s:a href="%{index_url}" cssClass="nav-link">Horizontal Form Layout</s:a>
                        </li>
                        <li class="nav-item">
                            <s:url var="vertical_url" action="vertical"/>
                            <s:a href="%{vertical_url}" cssClass="nav-link active">Vertical Form Layout</s:a>
                        </li>
                        <li class="nav-item">
                            <s:url var="validation_url" action="validation"/>
                            <s:a href="%{validation_url}" cssClass="nav-link">Client Validation</s:a>
                        </li>
                        <li class="nav-item">
                            <s:url var="advanced_url" action="advanced"/>
                            <s:a href="%{advanced_url}" cssClass="nav-link">Advanced Examples</s:a>
                        </li>
                        <li class="nav-item">
                            <s:url var="jquery_url" action="jquery"/>
                            <s:a href="%{jquery_url}" cssClass="nav-link">Struts2 jQuery UI Form Elements</s:a>
                        </li>
                        <li class="nav-item">
                            <s:url var="custom_url" action="custom"/>
                            <s:a href="%{custom_url}" cssClass="nav-link">With Custom Theme</s:a>
                        </li>
                        <li class="nav-item">
                            <s:url var="customlayout_url" action="customlayout"/>
                            <s:a href="%{customlayout_url}" cssClass="nav-link">Multi Column Forms</s:a>
                        </li>
                    </ul> 
                </div>
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
