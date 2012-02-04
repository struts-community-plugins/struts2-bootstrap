<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Struts2 Bootstrap Plugin Showcase - <s:text name="showcase.version"/> - Advanced Examples</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="Content-Style-Type" content="text/css"/>
    <meta http-equiv="pragma" content="no-cache"/>
    <meta http-equiv="cache-control" content="no-cache"/>
    <meta http-equiv="expires" content="0"/>
    <meta http-equiv="keywords" content="struts2, twitter, bootstrap, plugin, showcase"/>
    <meta http-equiv="description" content="A Showcase for the Struts2 Bootstrap Plugin"/>

    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <sj:head jqueryui="false"/>
    <sb:head />
    <style>
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
                    <s:url var="index_url" action="vertical"/>
                    <li><s:a href="%{index_url}">Vertical Form Layout</s:a></li>
                    <s:url var="advanced_url" action="advanced"/>
                    <li class="active"><s:a href="%{advanced_url}">Advanced Examples</s:a></li>
                </ul>
            </div>
        </div>
        <div class="span9">

            <h1>Advanced Examples</h1>

            <h2>Inline Form Layout</h2>
            <s:form theme="simple" cssClass="well form-search">
                <s:textfield
                        placeholder="Login"
                        name="login"
                        tooltip="Enter your Name here"/>

                <s:password
                        placeholder="Password"
                        name="password"/>

                <s:submit cssClass="btn-primary"/>
            </s:form>

            <button onclick="$('#code1').collapse('toggle')" class="btn">Code Example for Inline Form</button>
            <div id="code1" class="collapse in">
                <pre>
&lt;s:form theme=&quot;simple&quot; cssClass=&quot;well form-search&quot;&gt;
    &lt;s:textfield
            placeholder=&quot;Login&quot;
            name=&quot;login&quot;
            tooltip=&quot;Enter your Name here&quot;/&gt;

    &lt;s:password
            placeholder=&quot;Password&quot;
            name=&quot;password&quot;/&gt;

    &lt;s:submit cssClass=&quot;btn-primary&quot;/&gt;
&lt;/s:form&gt;
                </pre>
            </div>
            <script type="text/javascript">
                $("#code1").collapse();
            </script>

            <h2>Elements with Help Text, prepended text and appended text</h2>

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

                <s:submit cssClass="btn-primary"/>
                <s:submit cssClass="btn-danger"/>
            </s:form>

            <button onclick="$('#code2').collapse('toggle')" class="btn">Code Example for Help Text, prepended text and appended text</button>
            <div id="code2" class="collapse in">
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

    &lt;s:submit cssClass=&quot;btn-primary&quot;/&gt;
    &lt;s:submit cssClass=&quot;btn-danger&quot;/&gt;
&lt;/s:form&gt;
                </pre>
            </div>
            <script type="text/javascript">
                $("#code2").collapse();
            </script>

            <h2>A Bootstrap Form with jQuery AJAX Form</h2>

            <s:form action="echo" theme="bootstrap" cssClass="well form-vertical" label="AJAX Echo Form">
                <s:textfield
                        label="Enter your Name"
                        name="echo"
                        tooltip="Enter your Name here"/>

                <sj:submit targets="result" effect="highlight" cssClass="btn-success"/>
            </s:form>
            <div id="result"></div>

            <button onclick="$('#code3').collapse('toggle')" class="btn">Code Example for AJAX Form</button>
            <div id="code3" class="collapse in">
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
            <script type="text/javascript">
                $("#code3").collapse();
            </script>

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
