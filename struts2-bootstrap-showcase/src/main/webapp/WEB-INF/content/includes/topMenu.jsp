<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:set var="activeMenu" scope="page">${param.active}</s:set>

<header class="p-3 text-bg-dark  sticky-top">
  <div class="container">
    <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
      <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
        <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"/></svg>
        Struts2 Bootstrap Plugin Showcase - <s:text name="showcase.version"/>
      </a>

      <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
        <li>
          <s:url var="index_url" action="index"/>
          <s:if test='#attr.activeMenu == "home"'>
            <s:a href="%{index_url}" cssClass="nav-link px-2 text-secondary" aria-current="page"><i class="bi bi-house"></i> Home</s:a>
          </s:if>
          <s:else>
            <s:a href="%{index_url}" cssClass="nav-link px-2 text-white"><i class="bi bi-house"></i> Home</s:a>
          </s:else>
        </li>
        <li>
          <s:url var="about_url" action="about"/>
          <s:if test='#attr.activeMenu == "about"'>
            <s:a href="%{about_url}" cssClass="nav-link px-2 text-secondary" aria-current="page"><i class="bi bi-postcard"></i> About</s:a>
          </s:if>
          <s:else>
            <s:a href="%{about_url}" cssClass="nav-link px-2 text-white"><i class="bi bi-postcard"></i> About</s:a>
          </s:else>
        </li>
        <li>
          <a href="https://github.com/struts-community-plugins/struts2-bootstrap/" class="nav-link px-2 text-white"><i class="bi bi-link"></i> Project</a>
        </li>
      </ul>
    </div>
  </div>
</header>


<main class="d-flex flex-nowrap">

  <div class="container-xxl bd-gutter mt-3 my-md-4 bd-layout">
    <div class="row">