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

    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <sb:head includeScripts="false"/>
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
                <li class="nav-item">
                    <s:url var="index_url" action="index"/>
                    <s:a href="%{index_url}" cssClass="nav-link">Home</s:a>
                </li>
                <li class="nav-item active">
                    <s:url var="about_url" action="about"/>
                    <s:a href="%{about_url}" cssClass="nav-link">About</s:a>
                </li>
                <li class="nav-item">
                    <a href="https://github.com/struts-community-plugins/struts2-bootstrap/" class="nav-link">Project</a>
                </li>
            </ul>
        </div>
    </nav>

<div class="container" role="main">

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
        <li><a href="http://www.jgeppert.com">Developer Homepage and Contact</a></li>
        <li><a href="http://twitter.com/jogep">Twitter News</a></li>
    </ul>

    <footer class="footer" style="margin-top: 100px;">
        <p class="pull-right"><a href="#">Back to top</a></p>

        <p>Created by <a href="http://twitter.com/jogep" target="_blank">@jogep</a>.</p>
    </footer>

</div>

<!-- /container -->
</body>
</html>
