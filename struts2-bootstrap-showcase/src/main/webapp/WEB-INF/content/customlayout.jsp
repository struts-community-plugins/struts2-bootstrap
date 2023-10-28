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

    <sj:head jqueryui="true"/>
    <sb:head includeScripts="true"/>
</head>
<body>

<s:include value="includes/topMenu.jsp">
    <s:param name="active">home</s:param>
</s:include>

        <div class="col-md-3">
            <s:include value="includes/menu.jsp">
                <s:param name="active">customlayout</s:param>
            </s:include>
        </div>
        <div class="col-md-9">
            <h1>Sample custom multi-column form layouts</h1>
            <s:actionerror theme="bootstrap"/>
            <s:actionmessage theme="bootstrap"/>
            <s:fielderror theme="bootstrap"/>
            <s:form action="customlayout" enctype="multipart/form-data" method="POST" theme="bootstrap" cssClass="form-horizontal well"
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
            <s:form action="customlayout" enctype="multipart/form-data" method="POST" theme="bootstrap" cssClass="form-vertical well"
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

<s:include value="includes/footer.jsp" />
</body>
</html>
