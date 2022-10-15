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

    <sj:head jqueryui="false"/>
    <sb:head includeScripts="true"/>
</head>
<body>

<s:include value="includes/topMenu.jsp">
    <s:param name="active">home</s:param>
</s:include>

        <div class="col-md-3">
            <s:include value="includes/menu.jsp">
                <s:param name="active">advanced</s:param>
            </s:include>
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

            <button id="code1btn" type="button" class="btn btn-outline-secondary" data-bs-toggle="collapse" data-bs-target="#code1" aria-expanded="false" aria-controls="code1">Code Example for Inline Form</button>
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

            <button id="code2btn" type="button" class="btn btn-outline-secondary" data-bs-toggle="collapse" data-bs-target="#code2" aria-expanded="false" aria-controls="code2">Code Example for Help Text, prepended text and appended text</button>
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

            <button id="code3btn" type="button" class="btn btn-outline-secondary" data-bs-toggle="collapse" data-bs-target="#code3" aria-expanded="false" aria-controls="code3">Code Example for AJAX Form</button>
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

<s:include value="includes/footer.jsp" />


</body>
</html>
