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
    <meta name="description" content="Enable Client Side Validation - A Showcase for the Struts2 Bootstrap Plugin" />
    <title>Client Side Validation - Struts2 Bootstrap Plugin Showcase - <s:text name="showcase.version"/></title>

    <s:head />
    <sj:head jqueryui="false"/>
    <sb:head includeScripts="true"/>

</head>
<body>

<s:include value="includes/topMenu.jsp">
    <s:param name="active">home</s:param>
</s:include>


        <div class="col-md-3">
            <s:include value="includes/menu.jsp">
                <s:param name="active">validation</s:param>
            </s:include>
        </div>
        <div class="col-md-9">

            <h1>Client Validation</h1>

            <p>Struts2 Bootstrap Plugin Example with Client Validation.</p>

            <s:actionerror theme="bootstrap"/>
            <s:actionmessage theme="bootstrap"/>
            <s:fielderror theme="bootstrap"/>


            <s:form id="validationForm"
                    action="validation-submit"
                    theme="bootstrap"
                    cssClass="form-horizontal"
                    labelCssClass="col-sm-2"
                    elementCssClass="col-sm-7"
                    label="A sample Registration Form">

                <s:textfield
                        label="Username"
                        name="user"
                        requiredLabel="true"
                        tooltip="Enter your Username here"/>

                <s:password
                        label="Password"
                        name="password"
                        requiredLabel="true"
                        tooltip="Enter your Password here"/>

                <s:textarea
                        tooltip="Enter your Biography"
                        label="Biography"
                        name="biograhy"
                        cols="20"
                        rows="3"/>

                <s:select
                        tooltip="Choose Your Favourite Color"
                        label="Favorite Color"
                        list="{'Red', 'Blue', 'Green'}"
                        name="favourite"
                        emptyOption="true"/>

                <s:checkbox
                        tooltip="Confirmed that you accept the Agreement"
                        label="Accept the Agreement?"
                        name="agree"/>

                <div class="form-group">
                    <div class="col-sm-offset-3 col-md-9">
                        <sj:submit cssClass="btn btn-primary" formIds="validationForm" validate="true" validateFunction="bootstrapValidation"/>
                    </div>
                </div>

            </s:form>
        </div>


<s:include value="includes/footer.jsp" />

</body>
</html>
