<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="struts2, twitter, bootstrap, plugin, showcase" />
    <meta name="description" content="Struts2 jQuery Plugin Integration - A Showcase for the Struts2 Bootstrap Plugin" />
    <title>jQuery Plugin Integration - Struts2 Bootstrap Plugin Showcase - <s:text name="showcase.version"/></title>

    <sj:head jqueryui="true"/>
    <sb:head includeScripts="true"/>
</head>
<body>

<s:include value="includes/topMenu.jsp">
    <s:param name="active">home</s:param>
</s:include>

        <div class="col-md-3">
            <s:include value="includes/menu.jsp">
                <s:param name="active">jquery</s:param>
            </s:include>
        </div>
        <div class="col-md-9">

            <h2>A Bootstrap Form with jQuery UI Form Elements</h2>

            <s:form action="echo" label="Form with jQuery UI Datepicker and Autocompleter" theme="bootstrap" cssClass="form-horizontal">
                <sj:datepicker
                        id="datepicker"
                        parentTheme="bootstrap"
                        label="Datepicker"
                        labelCssClass="col-sm-3 col-form-label"
                        elementCssClass="col-sm-5"
                        cssClass="form-control-sm"
                        tooltip="Tooltip for Datepicker"
                        showOn="focus"
                        autocomplete="off"
                />
                <s:url var="languages_url" action="languages"/>
                <sj:autocompleter
                        id="autocompleter"
                        parentTheme="bootstrap"
                        labelCssClass="col-sm-3 col-form-label"
                        elementCssClass="col-sm-5"
                        cssClass="form-control-sm"
                        label="Autocompleter"
                        tooltip="Tooltip for Autocompleter"
                        href="%{languages_url}"
	    	            loadMinimumCount="1"
                        autocomplete="off"
                 />
            </s:form>

            <hr>

            <button id="code1btn" type="button" class="btn btn-outline-secondary" data-bs-toggle="collapse" data-bs-target="#code1" aria-expanded="false" aria-controls="code1">Code Example for Inline Form</button>
            <div id="code1" class="collapse">
                <div class="card card-body">
                    <pre>
&lt;s:form action=&quot;echo&quot; theme=&quot;bootstrap&quot; cssClass=&quot;form-horizontal&quot; label=&quot;Form with jQuery UI Elements&quot;&gt;
    &lt;sj:datepicker
            id=&quot;datepicker&quot;
            parentTheme=&quot;bootstrap&quot;
            label=&quot;Datepicker&quot;
            tooltip=&quot;Tooltip for Datepicker&quot;
            cssClass=&quot;form-control&quot;
            elementCssClass=&quot;col-sm-5&quot;
            showOn=&quot;focus&quot;
            inputAppendIcon=&quot;calendar&quot;
    /&gt;
    &lt;s:url id=&quot;languages_url&quot; action=&quot;languages&quot;/&gt;
    &lt;sj:autocompleter
            id=&quot;autocompleter&quot;
            parentTheme=&quot;bootstrap&quot;
            label=&quot;Autocompleter&quot;
            tooltip=&quot;Tooltip for Autocompleter&quot;
            cssClass=&quot;form-control&quot;
            href=&quot;%{languages_url}&quot;
            loadMinimumCount=&quot;1&quot;
     /&gt;
&lt;/s:form&gt;
                    </pre>
                </div>
            </div>

            <hr>

            <h2>A free jqGrid component with guiStyle=bootstrap</h2>


            <s:url var="remoteurl" action="grid-data-provider" namespace="/">
                <s:param name="loadonce" value="%{true}"/>
            </s:url>
            <sjg:grid
                    id="gridloadtable"
                    loadonce="true"
                    guiStyle="bootstrap"
                    caption="Grid Examples based on free jqGrid with guiStyle=bootstrap"
                    href="%{remoteurl}"
                    gridModel="gridModel"
                    rowNum="-1"
                    hidegrid="true"
                    scroll="true"
                    altRows="true"
                    sortable="true"
                    sortableOpacity="0.8"
                    sortablePlaceholder="ui-state-highlight"
                    sortableForcePlaceholderSize="true"
            >
                <sjg:gridColumn name="id" index="id" key="true" title="ID" width="30" formatter="integer" sortable="true"
                                sorttype="int"/>
                <sjg:gridColumn name="name" index="name" title="Company" width="250" sortable="true"/>
                <sjg:gridColumn name="lastName" index="lastName" title="Last Name" sortable="true" hidden="true"/>
                <sjg:gridColumn name="firstName" index="firstName" title="First Name" sortable="true" hidden="true"/>
                <sjg:gridColumn name="addressLine1" index="addressLine1" title="Adress" sortable="true" hidden="true"/>
                <sjg:gridColumn name="country" index="country" title="Country" sortable="true"/>
                <sjg:gridColumn name="city" index="city" title="City" sortable="true"/>
                <sjg:gridColumn name="creditLimit"
                                index="creditLimit"
                                title="Credit Limit"
                                align="right"
                                editable="true"
                                editrules="{
    									number: true,
    									required: true,
    									minValue : 100.0,
    									maxValue : 10000.0
    								}"
                                formatter="currency"
                                sortable="true"
                                sorttype="currency"/>
            </sjg:grid>

            <hr>

            <button id="code1btn" type="button" class="btn btn-outline-secondary" data-bs-toggle="collapse" data-bs-target="#code2" aria-expanded="false" aria-controls="code2">Code Example for jqGrid</button>
            <div id="code2" class="collapse">
                <div class="card card-body">
                    <pre>
&lt;s:url var=&quot;remoteurl&quot; action=&quot;grid-data-provider&quot; namespace=&quot;/&quot;&gt;
    &lt;s:param name=&quot;loadonce&quot; value=&quot;%{true}&quot;/&gt;
&lt;/s:url&gt;
&lt;sjg:grid
        id=&quot;gridloadtable&quot;
        loadonce=&quot;true&quot;
        guiStyle=&quot;bootstrap&quot;
        caption=&quot;Grid Examples based on free jqGrid with guiStyle=bootstrap&quot;
        href=&quot;%{remoteurl}&quot;
        gridModel=&quot;gridModel&quot;
        rowNum=&quot;-1&quot;
        hidegrid=&quot;true&quot;
        scroll=&quot;true&quot;
        altRows=&quot;true&quot;
        sortable=&quot;true&quot;
        sortableOpacity=&quot;0.8&quot;
        sortablePlaceholder=&quot;ui-state-highlight&quot;
        sortableForcePlaceholderSize=&quot;true&quot;
&gt;
    &lt;sjg:gridColumn name=&quot;id&quot; index=&quot;id&quot; key=&quot;true&quot; title=&quot;ID&quot; width=&quot;30&quot; formatter=&quot;integer&quot; sortable=&quot;true&quot;
                    sorttype=&quot;int&quot;/&gt;
    &lt;sjg:gridColumn name=&quot;name&quot; index=&quot;name&quot; title=&quot;Company&quot; width=&quot;250&quot; sortable=&quot;true&quot;/&gt;
    &lt;sjg:gridColumn name=&quot;lastName&quot; index=&quot;lastName&quot; title=&quot;Last Name&quot; sortable=&quot;true&quot; hidden=&quot;true&quot;/&gt;
    &lt;sjg:gridColumn name=&quot;firstName&quot; index=&quot;firstName&quot; title=&quot;First Name&quot; sortable=&quot;true&quot; hidden=&quot;true&quot;/&gt;
    &lt;sjg:gridColumn name=&quot;addressLine1&quot; index=&quot;addressLine1&quot; title=&quot;Adress&quot; sortable=&quot;true&quot; hidden=&quot;true&quot;/&gt;
    &lt;sjg:gridColumn name=&quot;country&quot; index=&quot;country&quot; title=&quot;Country&quot; sortable=&quot;true&quot;/&gt;
    &lt;sjg:gridColumn name=&quot;city&quot; index=&quot;city&quot; title=&quot;City&quot; sortable=&quot;true&quot;/&gt;
    &lt;sjg:gridColumn name=&quot;creditLimit&quot;
                    index=&quot;creditLimit&quot;
                    title=&quot;Credit Limit&quot;
                    align=&quot;right&quot;
                    editable=&quot;true&quot;
                    editrules=&quot;{
                            number: true,
                            required: true,
                            minValue : 100.0,
                            maxValue : 10000.0
                        }&quot;
                    formatter=&quot;currency&quot;
                    sortable=&quot;true&quot;
                    sorttype=&quot;currency&quot;/&gt;
&lt;/sjg:grid&gt;
                    </pre>
                </div>
            </div>

            <hr>

        </div>

<s:include value="includes/footer.jsp" />
</body>
</html>
