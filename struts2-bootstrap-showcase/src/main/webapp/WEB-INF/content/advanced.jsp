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
    <meta name="description" content="Advanced Examples - A Showcase for the Struts2 Bootstrap Plugin" />
    <title>Advanced Examples - Struts2 Bootstrap Plugin Showcase - <s:text name="showcase.version"/></title>

    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

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
                            <s:a href="%{advanced_url}" cssClass="nav-link active">Advanced Examples</s:a>
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

            <h1>Advanced Examples</h1>

            <h2>Inline Form Layout</h2>
            <s:form theme="bootstrap" cssClass="well form-inline">
                <s:textfield
                        placeholder="Login"
                        name="login"
                        tooltip="Enter your Name here"/>

                <s:password
                        placeholder="Password"
                        name="password"/>

                <s:submit cssClass="btn btn-primary"/>
            </s:form>

            <hr>

            <button id="code1btn" type="button" class="btn btn-outline-secondary" data-toggle="collapse" data-target="#code1" aria-expanded="false" aria-controls="code1">Code Example for Inline Form</button>
            <div id="code1" class="collapse">
                <div class="card card-body">
                    <pre>
&lt;s:form theme=&quot;simple&quot; cssClass=&quot;well form-search&quot;&gt;
    &lt;s:textfield
            placeholder=&quot;Login&quot;
            name=&quot;login&quot;
            tooltip=&quot;Enter your Name here&quot;/&gt;

    &lt;s:password
            placeholder=&quot;Password&quot;
            name=&quot;password&quot;/&gt;

    &lt;s:submit cssClass=&quot;btn btn-primary&quot;/&gt;
&lt;/s:form&gt;
                    </pre>
                </div>
            </div>

            <hr>
            <h2>Elements with Help Text, prepended text and appended text or prepended icon and appended icon</h2>

            <s:form theme="bootstrap" cssClass="well form-vertical">
                <s:textfield
                        label="Name"
                        name="name"
                        helpText="This Textfield has an Help Text."
                        tooltip="Enter your Name here"/>

                <s:textfield
                        label="Textfield with prepended text"
                        inputPrepend="@"
                        name="prepend"/>

                <s:textfield
                        label="Textfield with appended text"
                        inputAppend="$"
                        name="append"/>

                <s:textfield
                        label="Textfield with prepended icon"
                        inputPrependIcon="envelope"
                        name="prependIcon"/>

                <s:textfield
                        label="Textfield with appended icon"
                        inputAppendIcon="person"
                        name="appendIcon"/>

                <s:submit cssClass="btn btn-primary"/>
                <s:submit cssClass="btn btn-danger"/>
            </s:form>

            <hr>

            <button id="code2btn" type="button" class="btn btn-outline-secondary" data-toggle="collapse" data-target="#code2" aria-expanded="false" aria-controls="code2">Code Example for Help Text, prepended text and appended text</button>
            <div id="code2" class="collapse">
                <div class="card card-body">
                    <pre>
&lt;s:form theme=&quot;bootstrap&quot; cssClass=&quot;well form-vertical&quot;&gt;
    &lt;s:textfield
            label=&quot;Name&quot;
            name=&quot;name&quot;
            helpText=&quot;This Textfield has an Help Text.&quot;
            tooltip=&quot;Enter your Name here&quot;/&gt;

    &lt;s:textfield
            label=&quot;Textfield with prepended text&quot;
            inputPrepend=&quot;@&quot;
            name=&quot;prepend&quot;/&gt;

    &lt;s:textfield
            label=&quot;Textfield with appended text&quot;
            inputAppend=&quot;$&quot;
            name=&quot;append&quot;/&gt;

    &lt;s:submit cssClass=&quot;btn btn-primary&quot;/&gt;
    &lt;s:submit cssClass=&quot;btn btn-danger&quot;/&gt;
&lt;/s:form&gt;
                    </pre>
                </div>
            </div>

            <hr>

            <h2>A Bootstrap Form with jQuery AJAX Form</h2>

            <s:form id="bootstrapAjaxForm" action="echo" theme="bootstrap" cssClass="well form-vertical" label="AJAX Echo Form">
                <s:textfield
                        label="Enter your Name"
                        name="echo"
                        tooltip="Enter your Name here"/>

                <sj:submit targets="result" effect="highlight" cssClass="btn btn-success"/>
            </s:form>
            <div id="result"></div>

            <hr>

            <button id="code3btn" type="button" class="btn btn-outline-secondary" data-toggle="collapse" data-target="#code3" aria-expanded="false" aria-controls="code3">Code Example for AJAX Form</button>
            <div id="code3" class="collapse">
                <div class="card card-body">
                    <pre>
&lt;s:form action=&quot;echo&quot; theme=&quot;bootstrap&quot; cssClass=&quot;well form-vertical&quot; label=&quot;AJAX Echo Form&quot;&gt;
    &lt;s:textfield
            label=&quot;Enter your Name&quot;
            name=&quot;echo&quot;
            tooltip=&quot;Enter your Name here&quot;/&gt;

    &lt;sj:submit targets=&quot;result&quot; effect=&quot;highlight&quot; cssClass=&quot;btn-success&quot;/&gt;
&lt;/s:form&gt;
&lt;div id=&quot;result&quot;&gt;&lt;/div&gt;
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
