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
    <meta name="description" content="Struts2 jQuery Plugin Integration - A Showcase for the Struts2 Bootstrap Plugin" />
    <title>jQuery Plugin Integration - Struts2 Bootstrap Plugin Showcase - <s:text name="showcase.version"/></title>

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
                            <s:a href="%{jquery_url}" cssClass="nav-link active">Struts2 jQuery UI Form Elements</s:a>
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

            <h2>A Bootstrap Form with jQuery UI Datepicker and jQuery UI Autocompleter</h2>

            <s:form action="echo" theme="bootstrap" cssClass="form-horizontal" label="Form with jQuery UI Elements">
                <sj:datepicker
                        id="datepicker"
                        parentTheme="bootstrap"
                        label="Datepicker"
                        tooltip="Tooltip for Datepicker"
                        cssClass="form-control"
                        elementCssClass="col-sm-5"
                        showOn="focus"
                        inputAppendIcon="calendar"
                />
                <s:url var="languages_url" action="languages"/>
                <sj:autocompleter
                        id="autocompleter"
                        parentTheme="bootstrap"
                        label="Autocompleter"
                        tooltip="Tooltip for Autocompleter"
                        cssClass="form-control"
                        href="%{languages_url}"
	    	            loadMinimumCount="1"
                 />
            </s:form>

            <button id="code1btn" type="button" class="btn btn-outline-secondary" data-toggle="collapse" data-target="#code1" aria-expanded="false" aria-controls="code1">Code Example for Inline Form</button>
            <div id="code1" class="collapse">
                <div class="card card-body">
                    <pre>
&lt;s:form action=&quot;echo&quot; theme=&quot;bootstrap&quot; cssClass=&quot;form-horizontal&quot; label=&quot;Form with jQuery UI Elements&quot;&gt;
    &lt;sj:datepicker
            id=&quot;datepicker&quot;
            parentTheme=&quot;bootstrap&quot;
            label=&quot;Datepicker&quot;
            tooltip=&quot;Tooltip for Datepicker&quot;
            cssClass=&quot;form-control&quot;
            elementCssClass=&quot;col-sm-5&quot;
            showOn=&quot;focus&quot;
            inputAppendIcon=&quot;calendar&quot;
    /&gt;
    &lt;s:url id=&quot;languages_url&quot; action=&quot;languages&quot;/&gt;
    &lt;sj:autocompleter
            id=&quot;autocompleter&quot;
            parentTheme=&quot;bootstrap&quot;
            label=&quot;Autocompleter&quot;
            tooltip=&quot;Tooltip for Autocompleter&quot;
            cssClass=&quot;form-control&quot;
            href=&quot;%{languages_url}&quot;
            loadMinimumCount=&quot;1&quot;
     /&gt;
&lt;/s:form&gt;
                    </pre>
                </div>
            </div>
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
