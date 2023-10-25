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

    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <s:head />
    <sj:head jquery="true"/>
    <sb:head includeScripts="true" compressed="false" />
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
                            <s:a href="%{index_url}" cssClass="nav-link active">Horizontal Form Layout</s:a>
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

            <h1>Struts2 Bootstrap Plugin Showcase</h1>

            <p>Struts2 Bootstrap Plugin Examples for the head tag and the form elements.</p>

            <s:actionerror theme="bootstrap"/>
            <s:actionmessage theme="bootstrap"/>
            <s:fielderror theme="bootstrap"/>


            <s:form action="index" enctype="multipart/form-data" method="POST" theme="bootstrap" cssClass="form-horizontal"
                    label="A sample horizontal Form">
                <s:textfield
                        label="Name"
                        name="name"
                        formGroupCssClass="row"
                        labelCssClass="col-sm-3 col-form-label"
                        elementCssClass="col-sm-5"
                        cssClass="form-control-sm"
                        tooltip="Enter your Name here"/>

                <s:password
                        label="Password"
                        name="password"
                        formGroupCssClass="row"
                        tooltip="Enter your Password here"/>

                <s:textfield
                        label="Textfield with Error"
                        name="error"
                        formGroupCssClass="row"/>

                <s:textarea
                        tooltip="Enter your Biography"
                        label="Biography"
                        name="bio"
                        cols="20"
                        rows="3"
                        formGroupCssClass="row"/>

                <s:select
                        tooltip="Choose Your Favourite Color"
                        label="Favorite Color"
                        formGroupCssClass="row"
                        elementCssClass="col-sm-4"
                        list="{'Red', 'Blue', 'Green'}"
                        name="favouriteColor"
                        emptyOption="true"
                        headerKey="None"
                        headerValue="None"/>

                <s:checkboxlist
                        tooltip="Choose your Friends"
                        label="Friends"
                        formGroupCssClass="row"
                        list="{'Wes', 'Patrick', 'Jason', 'Jay', 'Toby', 'Rene'}"
                        name="friends"/>

                <s:checkboxlist
                        tooltip="Checkboxes with inline position"
                        labelposition="inline"
                        label="Friends Inline"
                        formGroupCssClass="row"
                        list="{'Wes', 'Patrick', 'Jason', 'Jay', 'Toby', 'Rene'}"
                        name="friendsInline"/>

                <s:radio
                        tooltip="Choose your Best Friend"
                        label="Best Friend"
                        formGroupCssClass="row"
                        list="{'Wes', 'Patrick', 'Jason', 'Jay', 'Toby', 'Rene'}"
                        name="bestFriend"
                        cssErrorClass="foo"/>

                <s:radio
                        tooltip="Radio Buttons with inline position"
                        label="Best Friend Inline"
                        labelposition="inline"
                        formGroupCssClass="row"
                        list="{'Wes', 'Patrick', 'Jason', 'Jay', 'Toby', 'Rene'}"
                        name="bestFriendInline"
                        cssErrorClass="foo"/>

                <s:checkbox
                        tooltip="Confirm that your are over 18 years old"
                        label="Age 18+"
                        name="legalAge"
                        formGroupCssClass="row"/>

                <s:doubleselect
                        tooltip="Choose Your State"
                        label="State"
                        name="region" list="{'North', 'South'}"
                        value="'South'"
                        doubleValue="'Florida'"
                        doubleList="top == 'North' ? {'Oregon', 'Washington'} : {'Texas', 'Florida'}"
                        doubleName="state"
                        headerKey="-1"
                        headerValue="---------- Please Select ----------"
                        emptyOption="true"/>

                <s:file
                        tooltip="Upload Your Picture"
                        label="Picture"
                        name="picture"
                        formGroupCssClass="row"/>

                <s:optiontransferselect
                        tooltip="Select Your Favourite Cartoon Characters"
                        label="Favourite Cartoons Characters"
                        name="leftSideCartoonCharacters"
                        leftTitle="Left Title"
                        rightTitle="Right Title"
                        list="{'Popeye', 'He-Man', 'Spiderman'}"
                        multiple="true"
                        headerKey="headerKey"
                        headerValue="--- Please Select ---"
                        emptyOption="true"
                        doubleList="{'Superman', 'Mickey Mouse', 'Donald Duck'}"
                        doubleName="rightSideCartoonCharacters"
                        doubleHeaderKey="doubleHeaderKey"
                        doubleHeaderValue="--- Please Select ---"
                        doubleEmptyOption="true"
                        doubleMultiple="true"/>

                <s:inputtransferselect
                        tooltip="Add Your Favourite Cartoon Character"
                        label="Favourite Cartoons Characters"
                        name="inputLeftSideCartoonCharacters"
                        addLabel="Add element"
                        removeLabel="Remove element"
                        removeAllLabel="Remove all elements"
                        upLabel="Move up"
                        downLabel="Move down"
                        leftTitle="Add Character"
                        rightTitle="Existing Characters"
                        list="{'Popeye', 'He-Man', 'Spiderman'}"/>

                <s:textarea
                        label="Your Thougths"
                        name="thoughts"
                        formGroupCssClass="row"
                        labelCssClass="col-sm-3 col-form-label col-form-label-sm"
                        cssClass="input-xxlarge"
                        tooltip="Enter your thoughts here"/>

                <div class="form-group row">
                    <div class="offset-md-3 col-md-9">
                        <s:submit cssClass="btn btn-primary"/>
                    </div>
                </div>
            </s:form>
        </div>
    </div>
</div>
<footer>
    <p class="pull-right"><a href="#">Back to top</a></p>

    <p>Created by <a href="http://twitter.com/jogep" target="_blank">@jogep</a>.</p>
</footer>
</body>
</html>
