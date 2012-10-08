<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Struts2 Bootstrap Plugin Showcase - <s:text name="showcase.version"/> - Advanced Examples</title>
    <meta charset="utf-8"/>
    <meta name="keywords" content="struts2, twitter, bootstrap, plugin, showcase" />
    <meta name="description" content="A Showcase for the Struts2 Bootstrap Plugin" />

    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <sj:head jqueryui="false"/>
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
                    <li class="active"><s:a href="%{advanced_url}">Advanced Examples</s:a></li>
                    <s:url var="jquery_url" action="jquery"/>
                    <li><s:a href="%{jquery_url}">Struts2 jQuery UI Form Elements</s:a></li>
                    <s:url var="custom_url" action="custom"/>
                    <li><s:a href="%{custom_url}">With Custom Theme</s:a></li>
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

            <button  id="code1btn" class="btn">Code Example for Inline Form</button>
            <div id="code1" class="collapse">
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

            <button  id="code2btn" class="btn">Code Example for Help Text, prepended text and appended text</button>
            <div id="code2" class="collapse">
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

            <h2>A Bootstrap Form with jQuery AJAX Form</h2>

            <s:form action="echo" theme="bootstrap" cssClass="well form-vertical" label="AJAX Echo Form">
                <s:textfield
                        label="Enter your Name"
                        name="echo"
                        tooltip="Enter your Name here"/>

                <sj:submit targets="result" effect="highlight" cssClass="btn-success"/>
            </s:form>
            <div id="result"></div>

            <button  id="code3btn" class="btn">Code Example for AJAX Form</button>
            <div id="code3" class="collapse">
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

            <h2>A Bootstrap Form with a simple Typeahead Input Field.</h2>

            <s:form theme="bootstrap" cssClass="well form-horizontal" label="Form with Typeahead Input Field">
                <s:textfield
                        label="Choose a State"
                        name="echo"
                        tooltip="Choose a State here"
                        data-provide="typeahead"
                        data-source="[&quot;Alabama&quot;,&quot;Alaska&quot;,&quot;Arizona&quot;,&quot;Arkansas&quot;,&quot;California&quot;,&quot;Colorado&quot;,&quot;Connecticut&quot;,&quot;Delaware&quot;,&quot;Florida&quot;,&quot;Georgia&quot;,&quot;Hawaii&quot;,&quot;Idaho&quot;,&quot;Illinois&quot;,&quot;Indiana&quot;,&quot;Iowa&quot;,&quot;Kansas&quot;,&quot;Kentucky&quot;,&quot;Louisiana&quot;,&quot;Maine&quot;,&quot;Maryland&quot;,&quot;Massachusetts&quot;,&quot;Michigan&quot;,&quot;Minnesota&quot;,&quot;Mississippi&quot;,&quot;Missouri&quot;,&quot;Montana&quot;,&quot;Nebraska&quot;,&quot;Nevada&quot;,&quot;New Hampshire&quot;,&quot;New Jersey&quot;,&quot;New Mexico&quot;,&quot;New York&quot;,&quot;North Dakota&quot;,&quot;North Carolina&quot;,&quot;Ohio&quot;,&quot;Oklahoma&quot;,&quot;Oregon&quot;,&quot;Pennsylvania&quot;,&quot;Rhode Island&quot;,&quot;South Carolina&quot;,&quot;South Dakota&quot;,&quot;Tennessee&quot;,&quot;Texas&quot;,&quot;Utah&quot;,&quot;Vermont&quot;,&quot;Virginia&quot;,&quot;Washington&quot;,&quot;West Virginia&quot;,&quot;Wisconsin&quot;,&quot;Wyoming&quot;]"
                        data-items="4"
                 />
            </s:form>

            <button  id="code4btn" class="btn">Code Example for Typeahead Input Field</button>
            <div id="code4" class="collapse">
                <pre>
&lt;s:form theme=&quot;bootstrap&quot; cssClass=&quot;well form-horizontal&quot; label=&quot;Form with Typeahead Input Field&quot;&gt;
    &lt;s:textfield
            label=&quot;Choose a State&quot;
            name=&quot;echo&quot;
            tooltip=&quot;Choose a State here&quot;
            data-provide=&quot;typeahead&quot;
            data-source=&quot;[&amp;quot;Alabama&amp;quot;,&amp;quot;Alaska&amp;quot;,&amp;quot;Arizona&amp;quot;,&amp;quot;Arkansas&amp;quot;,&amp;quot;California&amp;quot;,&amp;quot;Colorado&amp;quot;,&amp;quot;Connecticut&amp;quot;,&amp;quot;Delaware&amp;quot;,&amp;quot;Florida&amp;quot;,&amp;quot;Georgia&amp;quot;,&amp;quot;Hawaii&amp;quot;,&amp;quot;Idaho&amp;quot;,&amp;quot;Illinois&amp;quot;,&amp;quot;Indiana&amp;quot;,&amp;quot;Iowa&amp;quot;,&amp;quot;Kansas&amp;quot;,&amp;quot;Kentucky&amp;quot;,&amp;quot;Louisiana&amp;quot;,&amp;quot;Maine&amp;quot;,&amp;quot;Maryland&amp;quot;,&amp;quot;Massachusetts&amp;quot;,&amp;quot;Michigan&amp;quot;,&amp;quot;Minnesota&amp;quot;,&amp;quot;Mississippi&amp;quot;,&amp;quot;Missouri&amp;quot;,&amp;quot;Montana&amp;quot;,&amp;quot;Nebraska&amp;quot;,&amp;quot;Nevada&amp;quot;,&amp;quot;New Hampshire&amp;quot;,&amp;quot;New Jersey&amp;quot;,&amp;quot;New Mexico&amp;quot;,&amp;quot;New York&amp;quot;,&amp;quot;North Dakota&amp;quot;,&amp;quot;North Carolina&amp;quot;,&amp;quot;Ohio&amp;quot;,&amp;quot;Oklahoma&amp;quot;,&amp;quot;Oregon&amp;quot;,&amp;quot;Pennsylvania&amp;quot;,&amp;quot;Rhode Island&amp;quot;,&amp;quot;South Carolina&amp;quot;,&amp;quot;South Dakota&amp;quot;,&amp;quot;Tennessee&amp;quot;,&amp;quot;Texas&amp;quot;,&amp;quot;Utah&amp;quot;,&amp;quot;Vermont&amp;quot;,&amp;quot;Virginia&amp;quot;,&amp;quot;Washington&amp;quot;,&amp;quot;West Virginia&amp;quot;,&amp;quot;Wisconsin&amp;quot;,&amp;quot;Wyoming&amp;quot;]&quot;
            data-items=&quot;4&quot;
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
        $("#code2btn").click(function () {
            $('#code2').collapse('toggle')
        });
        $("#code3btn").click(function () {
            $('#code3').collapse('toggle')
        });
        $("#code4btn").click(function () {
            $('#code4').collapse('toggle')
        });
    });
</script>
</body>
</html>
