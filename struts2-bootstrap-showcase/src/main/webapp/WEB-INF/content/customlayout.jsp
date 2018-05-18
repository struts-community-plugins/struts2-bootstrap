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
    <meta name="description" content="A Showcase for the Struts2 Bootstrap Plugin" />
    <title>Struts2 Bootstrap Plugin Showcase - <s:text name="showcase.version"/></title>

    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <sj:head jqueryui="true"/>
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
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
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
                            <li><s:a href="%{vertical_url}" cssClass="nav-link">Vertical Form Layout</s:a></li>
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
                            <s:a href="%{customlayout_url}" cssClass="nav-link active">Multi Column Forms</s:a>
                        </li>
                    </ul> 
                </div>
            </div>
        </div>
        <div class="col-md-9">
            <h1>Sample custom multi-column form layouts</h1>
            <s:actionerror theme="bootstrap"/>
            <s:actionmessage theme="bootstrap"/>
            <s:fielderror theme="bootstrap"/>
            <s:form action="customlayout" enctype="multipart/form-data" theme="bootstrap" cssClass="form-horizontal well"
                    label="Muilti Column Custom Horizontal Layout">
                <div class="row">
                    <div class="col-md-6">
                        <s:textfield
                                label="First Name"
                                name="name"
                                elementCssClass="col-md-8"
                                labelCssClass="col-md-4"
                                tooltip="Enter your First Name here"/>
                    </div>
                    <div class="col-md-6">
                        <s:textfield
                                label="Last Name"
                                name="name"
                                elementCssClass="col-md-8"
                                labelCssClass="col-md-4"
                                tooltip="Enter your Last Name here"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <s:select
                                label="Gender"
                                name="genger"
                                list="{'male', 'female'}"
                                elementCssClass="col-md-8"
                                labelCssClass="col-md-4"
                        />
                    </div>
                    <div class="col-md-6">
                        <sj:datepicker
                                parentTheme="bootstrap"
                                label="Date Of Birth"
                                cssClass="form-control"
                                elementCssClass="col-md-8"
                                labelCssClass="col-md-4"
                                placeholder="dd/mm/yyyy"
                                showOn="focus"
                                inputAppendIcon="calendar"
                        />
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <s:textarea
                                label="Your Thougths"
                                name="thoughts"
                                cssClass="input-xxlarge"
                                labelCssClass="col-md-2"
                                elementCssClass="col-md-10"
                                placeholder="Enter your thoughts here"
                        />
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-offset-3 col-md-9">
                        <s:submit cssClass="btn btn-primary"/>
                    </div>
                </div>
            </s:form>
            <br>
            <s:form action="customlayout" enctype="multipart/form-data" theme="bootstrap" cssClass="form-vertical well"
                    label="Muilti Column Custom Vertical Layout">
                <div class="row">
                    <div class="col-md-6">
                        <s:textfield
                                label="First Name"
                                name="name"
                                cssClass="input-sm"
                                elementCssClass=""
                                labelCssClass=""
                                tooltip="Enter your First Name here"/>
                    </div>
                    <div class="col-md-6">
                        <s:textfield
                                label="Last Name"
                                name="name"
                                cssClass="input-sm"
                                elementCssClass=""
                                labelCssClass=""
                                tooltip="Enter your Last Name here"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <s:select
                                label="Gender"
                                name="genger"
                                list="{'male', 'female'}"
                                cssClass="input-sm"
                                elementCssClass=""
                                labelCssClass=""
                        />
                    </div>
                    <div class="col-md-6">
                        <sj:datepicker
                                id="datepicker"
                                parentTheme="bootstrap"
                                label="Date Of Birth"
                                cssClass="form-control input-sm"
                                elementCssClass=""
                                showOn="focus"
                                inputAppendIcon="calendar"
                        />
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <s:textarea
                                label="Your Thougths"
                                name="thoughts"
                                cssClass="input-xxlarge"
                                tooltip="Enter your thoughts here"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-offset-3 col-md-9">
                        <s:submit cssClass="btn btn-primary"/>
                    </div>
                </div>
            </s:form>
        </div>
    </div>
</div>
<footer>
    <p class="pull-right"><a href="#">Back to top</a></p>

    <p>Created by <a href="http://twitter.com/jogep" target="_blank">@jogep</a>.</p>
</footer>

</body>
</html>
