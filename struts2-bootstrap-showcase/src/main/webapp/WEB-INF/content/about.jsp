<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="struts2, twitter, bootstrap, plugin, showcase, about" />
    <meta name="description" content="A Showcase for the Struts2 Bootstrap Plugin - About" />
    <title>About - Struts2 Bootstrap Plugin Showcase - <s:text name="showcase.version"/></title>

    <sb:head includeScripts="false"/>
</head>
<body>

<s:include value="includes/topMenu.jsp">
    <s:param name="active">about</s:param>
</s:include>


<div class="col-md-12">

    <h1>About Struts2 Bootstrap Plugin</h1>

    <h2>Project</h2>
    <ul>
        <li><a href="https://github.com/struts-community-plugins/struts2-bootstrap/">Project @ Github</a></li>
        <li><a href="https://oss.sonatype.org/content/groups/staging/com/jgeppert/struts2/bootstrap/">Download</a></li>
    </ul>

    <h2>Installation via Maven</h2>
    <pre>
&lt;dependencies&gt;
    ...
    &lt;dependency&gt;
        &lt;groupId&gt;com.jgeppert.struts2.bootstrap&lt;/groupId&gt;
        &lt;artifactId&gt;struts2-bootstrap-plugin&lt;/artifactId&gt;
        &lt;version&gt;<s:text name="showcase.version"/>&lt;/version&gt;
    &lt;/dependency&gt;
    ...
&lt;/dependencies&gt;
    </pre>


    <h2>Developer</h2>
    <ul>
        <li><a href="https://www.jgeppert.com">Developer Homepage and Contact</a></li>
        <li><a href="https://twitter.com/jogep">Twitter News</a></li>
    </ul>
</div>

    <s:include value="includes/footer.jsp" />
</body>
</html>
