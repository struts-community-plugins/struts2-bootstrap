# Struts2 Bootstrap Plugin

[![Maven Central](https://maven-badges.herokuapp.com/maven-central/com.jgeppert.struts2.bootstrap/struts2-bootstrap-plugin/badge.svg)](https://maven-badges.herokuapp.com/maven-central/com.jgeppert.struts2.bootstrap/struts2-bootstrap-plugin/)

A Plugin for simple Bootstrap CSS Framework integration into Struts2.

### [Download] (https://repo1.maven.org/maven2/com/jgeppert/struts2/bootstrap/)
### [News and Developer Blog] (https://www.jgeppert.com)
### [Showcase] (https://struts.jgeppert.com/struts2-bootstrap-showcase/)
### [Sample TODO app based on Bootstrap, jQuery and jQuery Mobile] (https://github.com/jogep/struts2-todo-examples/)

## Installation

### Manual
Copy the struts2-bootstrap-plugin.jar into your WEB-INF/lib path. 

### Maven

```xml
<dependencies>
    ...
    <dependency>
        <groupId>com.jgeppert.struts2.bootstrap</groupId>
        <artifactId>struts2-bootstrap-plugin</artifactId>
        <version>4.0.2</version>
    </dependency>
    ...
</dependencies>
```

### Using SNAPSHOT builds
To access SNAPSHOT builds, you need to declare the snapshot repository lookup in your pom.xml:
```xml
...
<repositories>
    ...
    <repository>
        <id>sonatype.oss.snapshots</id>
        <name>Sonatype OSS Snapshot Repository</name>
        <url>http://oss.sonatype.org/content/repositories/snapshots</url>
        <releases>false</releases>
        <snapshots>true</snapshots>
    </repository>
</repositories>
...
```

## Usage

### Prepare your JSP

Include the Taglib and use the HeadTag to load necessary resources.

```jsp
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    ...
    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <sb:head/>
</head>
<body>
...
</body>
</html>
```

### Use the Bootstrap Form Theme

```jsp
            <s:actionerror theme="bootstrap"/>
            <s:actionmessage theme="bootstrap"/>
            <s:fielderror theme="bootstrap"/>


            <s:form action="index" enctype="multipart/form-data" theme="bootstrap" cssClass="form-horizontal"
                    label="A sample horizontal Form">
                <s:textfield
                        label="Name"
                        name="name"
                        tooltip="Enter your Name here"/>

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
                        labelposition="inline"
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
                        labelposition="inline"
                        list="{'Wes', 'Patrick', 'Jason', 'Jay', 'Toby', 'Rene'}"
                        name="bestFriend"
                        cssErrorClass="foo"/>

                <s:checkbox
                        tooltip="Confirmed that your are Over 18"
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

                <s:textarea
                        label="Your Thougths"
                        name="thoughts"
                        tooltip="Enter your thoughts here"/>

                <s:submit cssClass="btn"/>
            </s:form>
```
