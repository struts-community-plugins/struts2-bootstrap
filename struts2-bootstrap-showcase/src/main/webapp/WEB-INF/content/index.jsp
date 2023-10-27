<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="struts2, twitter, bootstrap, plugin, showcase" />
    <meta name="description" content="A Showcase for the Struts2 Bootstrap Plugin" />
    <title>Struts2 Bootstrap Plugin Showcase - <s:text name="showcase.version"/></title>


    <s:head />
    <sb:head includeScripts="true" />
</head>
<body>


<s:include value="includes/topMenu.jsp">
    <s:param name="active">home</s:param>
</s:include>

        <div class="col-md-3">
            <s:include value="includes/menu.jsp">
                <s:param name="active">index</s:param>
            </s:include>
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
                        labelCssClass="col-sm-3 col-form-label"
                        elementCssClass="col-sm-5"
                        cssClass="form-control-sm"
                        tooltip="Enter your Name here"/>

                <s:password
                        label="Password"
                        name="password"
                        tooltip="Enter your Password here"/>

                <s:textfield
                        label="Textfield with Error"
                        name="error"/>

                <s:textarea
                        tooltip="Enter your Biography"
                        label="Biography"
                        name="bio"
                        cols="20"
                        rows="3"/>

                <s:select
                        tooltip="Choose Your Favourite Color"
                        label="Favorite Color"
                        elementCssClass="col-sm-4"
                        list="{'Red', 'Blue', 'Green'}"
                        name="favouriteColor"
                        emptyOption="true"
                        headerKey="None"
                        headerValue="None"/>

                <s:checkboxlist
                        tooltip="Choose your Friends"
                        label="Friends"
                        list="{'Wes', 'Patrick', 'Jason', 'Jay', 'Toby', 'Rene'}"
                        name="friends"/>

                <s:checkboxlist
                        tooltip="Checkboxes with inline position"
                        labelPosition="left"
                        label="Friends Inline"
                        list="{'Wes', 'Patrick', 'Jason', 'Jay', 'Toby', 'Rene'}"
                        name="friendsInline"/>

                <s:radio
                        tooltip="Choose your Best Friend"
                        label="Best Friend"
                        list="{'Wes', 'Patrick', 'Jason', 'Jay', 'Toby', 'Rene'}"
                        name="bestFriend"
                        cssErrorClass="foo"/>

                <s:radio
                        tooltip="Radio Buttons with inline position"
                        label="Best Friend Inline"
                        labelPosition="left"
                        list="{'Wes', 'Patrick', 'Jason', 'Jay', 'Toby', 'Rene'}"
                        name="bestFriendInline"
                        cssErrorClass="foo"/>

                <s:checkbox
                        tooltip="Confirm that your are over 18 years old"
                        label="Age 18+"
                        name="legalAge"/>

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
                        name="picture"/>

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
                        labelCssClass="col-sm-3 col-form-label col-form-label-sm"
                        cssClass="input-xxlarge"
                        tooltip="Enter your thoughts here"/>

                <s:submit cssClass="btn btn-primary"/>
            </s:form>
        </div>

<s:include value="includes/footer.jsp" />
</body>
</html>
