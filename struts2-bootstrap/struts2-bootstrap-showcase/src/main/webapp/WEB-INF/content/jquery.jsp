<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Struts2 Bootstrap Plugin Showcase - <s:text name="showcase.version"/> - With Struts2 jQuery Plugin</title>
    <meta charset="utf-8"/>
    <meta name="keywords" content="struts2, twitter, bootstrap, plugin, showcase, jquery" />
    <meta name="description" content="A Showcase for the Struts2 Bootstrap Plugin" />

    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <sj:head jqueryui="true"/>
    <sb:head includeScripts="true" includeScriptsValidation="false" includeStylesResponsive="true"/>
    <style type="text/css">
        body {
            padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
        }
    </style>
</head>
<body>
<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="i-bar"></span>
                <span class="i-bar"></span>
                <span class="i-bar"></span>
            </a>
            <a class="brand" href="#">Struts2 Bootstrap Plugin Showcase - <s:text name="showcase.version"/></a>

            <div class="nav-collapse">
                <ul class="nav">
                    <s:url var="index_url" action="index"/>
                    <li class="active"><s:a href="%{index_url}">Home</s:a></li>
                    <s:url var="about_url" action="about"/>
                    <li><s:a href="%{about_url}">About</s:a></li>
                    <li><a href="http://code.google.com/p/struts2-bootstrap/">Project</a></li>
                </ul>
            </div>
            <!--/.nav-collapse -->
        </div>
    </div>
</div>

<div class="container-fluid">
    <div class="row-fluid">
        <div class="span3">
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
                    <li><s:a href="%{validation_url}">Client Validation</s:a></li>
                    <s:url var="advanced_url" action="advanced"/>
                    <li><s:a href="%{advanced_url}">Advanced Examples</s:a></li>
                    <s:url var="jquery_url" action="jquery"/>
                    <li class="active"><s:a href="%{jquery_url}">Struts2 jQuery UI Form Elements</s:a></li>
                    <s:url var="custom_url" action="custom"/>
                    <li><s:a href="%{custom_url}">With Custom Theme</s:a></li>
                </ul>
            </div>
        </div>
        <div class="span9">

            <h2>A Bootstrap Form with jQuery UI Datepicker and jQuery UI Autocompleter</h2>

            <s:form action="echo" theme="bootstrap" cssClass="form-horizontal" label="Form with jQuery UI Elements">
                <sj:datepicker
                        id="datepicker"
                        parentTheme="bootstrap"
                        label="Datepicker"
                        tooltip="Tooltip for Datepicker"
                />
                <s:url id="languages_url" action="languages"/>
                <sj:autocompleter
                        id="autocompleter"
                        parentTheme="bootstrap"
                        label="Autocompleter"
                        tooltip="Tooltip for Autocompleter"
                        href="%{languages_url}"
	    	            loadMinimumCount="1"
                 />
            </s:form>

            <button id="code1btn" class="btn">Code Example</button>
            <div id="code1" class="collapse in">
                <pre>
                    &lt;s:form action=&quot;echo&quot; theme=&quot;bootstrap&quot; cssClass=&quot;form-horizontal&quot; label=&quot;Form with jQuery UI Elements&quot;&gt;
                        &lt;sj:datepicker
                                id=&quot;datepicker&quot;
                                parentTheme=&quot;bootstrap&quot;
                                label=&quot;Datepicker&quot;
                                tooltip=&quot;Tooltip for Datepicker&quot;
                        /&gt;
                        &lt;s:url id=&quot;languages_url&quot; action=&quot;languages&quot;/&gt;
                        &lt;sj:autocompleter
                                id=&quot;autocompleter&quot;
                                parentTheme=&quot;bootstrap&quot;
                                label=&quot;Autocompleter&quot;
                                tooltip=&quot;Tooltip for Autocompleter&quot;
                                href=&quot;%{languages_url}&quot;
                                loadMinimumCount=&quot;1&quot;
                         /&gt;
                    &lt;/s:form&gt;
                </pre>
            </div>
        </div>

    </div>

    <footer class="footer">
        <p class="pull-right"><a href="#">Back to top</a></p>

        <p>Created by <a href="http://twitter.com/jogep" target="_blank">@jogep</a>.</p>
    </footer>

</div>
<!-- /container -->
<script type="text/javascript">
    $(document).ready(function () {
        $(".collapse").collapse();
        $("#code1btn").click(function () {
            $('#code1').collapse('toggle')
        });
    });
</script>
</body>
</html>
