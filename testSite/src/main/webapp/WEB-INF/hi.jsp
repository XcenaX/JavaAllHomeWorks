<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored = "false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:bundle basename="text">
    <fmt:message key="login" var="login"/>
    <fmt:message key="register" var="reg"/>
    <fmt:message key="logout" var="logout_text"/>
    <fmt:message key="dont_read" var="dont_read_any_cources"/>
    <fmt:message key="delete" var="delete_text"/>
    <fmt:message key="repair" var="repair_text"/>
    <fmt:message key="cources_text" var="cources_text"/>
    <fmt:message key="increase_balance_text" var="increase_balance_text"/>
    <fmt:message key="balance_text" var="balance_text"/>
    <fmt:message key="yes" var="yes"/>
    <fmt:message key="no" var="no"/>
    <fmt:message key="buy_cource" var="buy_cource"/>
    <fmt:message key="not_enough_money" var="not_enough_money"/>
    <fmt:message key="free" var="free"/>
    <fmt:message key="cource" var="cource"/>
    <fmt:message key="profile_updated" var="profile_updated"/>
    <fmt:message key="profile" var="profile"/>
    <fmt:message key="name" var="name"/>
    <fmt:message key="last_name" var="last_name"/>
    <fmt:message key="date_of_birth" var="date_of_birth"/>
    <fmt:message key="phone" var="phone"/>
    <fmt:message key="submit" var="submit"/>
    <fmt:message key="edit_profile_text" var="edit_profile_text"/>
    <fmt:message key="my_password" var="my_password"/>
    <fmt:message key="by_lang" var="by_lang"/>
    <fmt:message key="by_pricing" var="by_pricing"/>
    <fmt:message key="nothing_finded" var="nothing_finded"/>
    <fmt:message key="card_data" var="card_data"/>
    <fmt:message key="as_indicated_on_the_card" var="as_indicated_on_the_card"/>
    <fmt:message key="amount_to_replenish" var="amount_to_replenish"/>
    <fmt:message key="continue" var="continue"/>
    <fmt:message key="login_ru" var="login_ru"/>
    <fmt:message key="no_account" var="no_account"/>
    <fmt:message key="create_him" var="create_him"/>
    <fmt:message key="has_account" var="has_account"/>
    <fmt:message key="login_now" var="login_now"/>
    <fmt:message key="retype" var="retype"/>
    <fmt:message key="all" var="all"/>
    <fmt:message key="paid" var="paid"/>
    <fmt:message key="about" var="about"/>
    <fmt:message key="tos" var="tos"/>
    <fmt:message key="privacy" var="privacy"/>
    <fmt:message key="more" var="more"/>
    <fmt:message key="to_companies" var="to_companies"/>
    <fmt:message key="opportunities" var="opportunities"/>
    <fmt:message key="support" var="support"/>
    <fmt:message key="prices" var="prices"/>
    <fmt:message key="knowledge" var="knowledge"/>
    <fmt:message key="topics" var="topics"/>
</fmt:bundle>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NCB</title>
    <link rel="stylesheet" media="all" href="https://cdn2.hexlet.io/assets/application-6c79ff11f91a2bc1f99cd07b254b3f0c28c107706cefef4d910ca3b4ba7f5266.css">
    <link rel="stylesheet" media="screen" href="https://cdn2.hexlet.io/packs/css/41-4310e18e.chunk.css">
    <link id="avast_os_ext_custom_font" href="chrome-extension://eofcbnmajmjmplflapaojjnihcjkigck/common/ui/fonts/fonts.css" rel="stylesheet" type="text/css">
    <style>
        <jsp:directive.include file="styles/cource.css"/>
        <jsp:directive.include file="styles/main.css"/>
    </style>
</head>
<body>
<!-- HEADER BLOCK -->
<nav class="navbar navbar-expand-lg navbar-light bg-white hexlet-navbar border-bottom p-t-0">
    <a aria-hidden="true" class="navbar-brand mr-4" >
        Nice Cources Bro
    </a>
    <button aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler" data-target="#navbarResponsive" data-toggle="collapse" type="button">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link hexlet-navbar-link px-3 active" href="/fs/cources">
                    <div class="my-2">${cources_text}</div>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link hexlet-navbar-link px-3" href="/fs/increase-balance">
                    <div class="my-2">${increase_balance_text}</div>
                </a>
            </li>
        </ul>
        <ul class="navbar-nav">
            <li class="nav-item">
                <div style="padding:10px">
                    <select class="form-control" id="exampleFormControlSelect1" style="padding-top: 10px;" onChange="window.location.href=this.value">
                        <option value="/fs/set-lang?language=RU" <c:if test="${systemLang == 'RU'}">selected="selected"</c:if>>Русский</option>
                        <option value="/fs/set-lang?language=EN" <c:if test="${systemLang == 'EN'}">selected="selected"</c:if>>English</option>
                    </select>
                </div>

            </li>
            <li class="nav-item">
                <a class="nav-link hexlet-navbar-link px-3" href="/fs/profile">
                    <div class="my-2">${currentUser.firstName} ${currentUser.lastName}</div>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link hexlet-navbar-link px-3 " href="/fs/logout">
                    <div class="my-2" style="color: red;">${logout_text}</div>
                </a>
            </li>
        </ul>
    </div>
</nav>
<!-- HEADER BLOCK -->
<main>
    <div class="container mt4">
        <!-- FILTER BLOCK -->
        <div class="row justify-content-center">
            <div class="col-12 col-md-7 col-lg-6 border-left">
                <div class="h5 text-center">${by_lang}</div>
                <div class="row mt-4">
                    <div class="col-2">
                        <ul class="list-unstyled">
                            <li class="m-2">
                                <a href="/fs/cources">${all}</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-10">
                        <div class="row">
                            <div class="col">
                                <ul class="list-unstyled">
                                    <li class="m-2">
                                        <a id="Java" class="x-link-without-decoration" href="/fs/cources?language_eq=Java<c:if test="${not empty pricingType}">&pricing_type_eq=${pricingType}</c:if>">Java</a>
                                    </li>
                                    <li class="m-2">
                                        <a id="JavaScript" class="x-link-without-decoration" href="/fs/cources?language_eq=JavaScript<c:if test="${not empty pricingType}">&pricing_type_eq=${pricingType}</c:if>">JavaScript</a>
                                    </li>
                                    <li class="m-2">
                                        <a id="PHP" class="x-link-without-decoration" href="/fs/cources?language_eq=PHP<c:if test="${not empty pricingType}">&pricing_type_eq=${pricingType}</c:if>">PHP</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col">
                                <ul class="list-unstyled">
                                    <li class="m-2">
                                        <a id="Ruby" class="x-link-without-decoration" href="/fs/cources?language_eq=Ruby<c:if test="${not empty pricingType}">&pricing_type_eq=${pricingType}</c:if>">Ruby</a>
                                    </li>
                                    <li class="m-2">
                                        <a id="SQL" class="x-link-without-decoration" href="/fs/cources?language_eq=SQL<c:if test="${not empty pricingType}">&pricing_type_eq=${pricingType}</c:if>">SQL</a>
                                    </li>
                                    <li class="m-2">
                                        <a id="Shell (Utils)" class="x-link-without-decoration" href="/fs/cources?language_eq=Shell (Utils)<c:if test="${not empty pricingType}">&pricing_type_eq=${pricingType}</c:if>">Shell (Utils)</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col">
                                <ul class="list-unstyled">
                                    <li class="m-2">
                                        <a id="HTML CSS" class="x-link-without-decoration" href="/fs/cources?language_eq=HTML CSS<c:if test="${not empty pricingType}">&pricing_type_eq=${pricingType}</c:if>">HTML & CSS</a>
                                    </li>
                                    <li class="m-2">
                                        <a id="Racket" class="x-link-without-decoration" href="/fs/cources?language_eq=Racket<c:if test="${not empty pricingType}">&pricing_type_eq=${pricingType}</c:if>">Racket</a>
                                    </li>
                                    <li class="m-2">
                                        <a id="Python" class="x-link-without-decoration" href="/fs/cources?language_eq=Python<c:if test="${not empty pricingType}">&pricing_type_eq=${pricingType}</c:if>">Python</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-5 col-lg-4 mt-4 mt-md-0 border-left border-right">
                <div class="h5 text-center">${by_pricing}</div>
                <div class="row mt-4">
                    <div class="col-2">
                        <ul class="list-unstyled">
                            <li class="m-2">
                                <a href="/fs/cources">${all}</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-10">
                        <div class="row">
                            <div class="col">
                                <ul class="list-unstyled">
                                    <li class="m-2">
                                        <a id="paid" class="x-link-without-decoration" href="/fs/cources?pricing_type_eq=paid<c:if test="${not empty language}">&language_eq=${language}</c:if>">${paid}</a>
                                    </li>
                                    <li class="m-2">
                                        <a id="free" class="x-link-without-decoration" href="/fs/cources?pricing_type_eq=free<c:if test="${not empty language}">&language_eq=${language}</c:if>">${free}</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- FILTER BLOCK -->
        <!-- COURSES BLOCK -->
        <div class="mt-4">
            <h1 class="mb-3 h4">${all} ${cources_text}</h1>
            <div class="row">
                <c:if test="${not empty cources}">
                    <c:forEach items="${cources}" var="cource">
                        <c:if test="${cource.deleted == false || currentUser.role == 2}">
                            <div class="mb-5 col-lg-4 col-sm-6 col-12">
                                <div class="card shadow-sm x-shadow-fade-in h-100">
                                    <div class="bg-success card-header d-flex flex-column py-1 text-white">
                                        <div class="d-flex">
                                            <div class="cource-img" style="background-image:url('${cource.language.imgUrl}')"></div>
                                            <div class="ml-auto my-auto">
                                                   ${cource.duration} ${cource.getHour(cource.duration)}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body d-flex flex-column">
                                        <div class="row flex-wrap-reverse px-3">
                                            <h5 class="col-auto col-sm-10 mr-auto p-0">${cource.title}</h5>
                                            <div>
                                                <span class="badge badge-light p-0">${cource.price}тг</span>
                                            </div>
                                        </div>
                                        <div class="text-muted mb-2">${fn:substring(cource.description, -1, 60)}...</div>
                                        <div class="mt-auto d-flex">
                                            <div class="ml-auto">
                                                <a class="x-link-without-decoration <c:if test="${currentUser.role != 2}">stretched-link</c:if>" href="/fs/cource?courceId=${cource.id}">Посмотреть</a>
                                                <c:if test="${currentUser.role==2 && cource.deleted == false}">
                                                    <form action="/fs/delete" method="post" style="display: inline-block;">
                                                        <input type="hidden" value="${cource.id}" name="courceId">
                                                        <button class="x-link-without-decoration" style="color: red;font-size: 13px;" type="submit">${delete_text}</button>
                                                    </form>
                                                </c:if>
                                                <c:if test="${currentUser.role==2 && cource.deleted == true}">
                                                    <form action="/fs/restore" method="post" style="display: inline-block;">
                                                        <input type="hidden" value="${cource.id}" name="courceId">
                                                        <button class="x-link-without-decoration" style="color: lawngreen;font-size: 13px;" type="submit">${repair_text}</button>
                                                    </form>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </c:if>
                <c:if test="${empty cources}">
                    <h3 style="margin:auto;padding-bottom: 3em;">${nothing_finded}</h3>
                </c:if>
            </div>
        </div>

        <!-- COURSES BLOCK -->
    </div>
</main>
<!-- FOOTER BLOCK -->
<footer class="footer hexlet-footer bg-light border-top pb-5 mt-5">
    <div class="container">
        <div class="row">
            <div class="col-12 col-lg-4 mt-5">
                <div class="h2">
                    NCB 2020
                </div>
                <div class="pr-2">
                    <hr>
                </div>
                <ul class="list-unstyled">
                    <li>
                        <a class="x-link-only-hover" href="/fs/about">${about}</a>
                    </li>
                    <li>
                        <a class="x-link-only-hover" href="/fs/tos">${tos}</a>
                    </li>
                    <li>
                        <a class="x-link-only-hover" href="/fs/privacy">${privacy}</a>
                    </li>
                </ul>
            </div>
            <div class="col-12 col-sm-6 col-lg-3 mt-5">
                <div class="h5 mt-5 mb-3" style="margin-top: 0px !important;">${more}</div>
                <ul class="list-unstyled">
                    <li>
                        <a class="x-link-only-hover" href="/fs/pricing">${prices}</a>
                    </li>
                </ul>
            </div>
            <div class="col-12 col-sm-6 col-lg-3 mt-5">
                <div class="h5 mb-3">${to_companies}</div>
                <ul class="list-unstyled">
                    <li>
                        <a class="x-link-only-hover" href="/fs/teams">${opportunities}</a>
                    </li>
                </ul>
            </div>
            <div class="col-12 col-sm-6 col-lg-2 mt-5">
                <div class="h5 mb-3">${support}</div>
                <ul class="list-unstyled">
                    <li>
                        <a class="x-link-only-hover" href="/fs/knowledge">${knowledge}</a>
                    </li>
                    <li>
                        <a class="x-link-only-hover" href="/fs/community">${topics}</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</footer>
<!-- FOOTER BLOCK -->
<script type="text/javascript">

    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);

    console.log(queryString);

    const pricing_type = urlParams.get("pricing_type_eq");
    const language = urlParams.get("language_eq");

    console.log(pricing_type);
    console.log(language);

    if(language){
        document.getElementById("${language}").style.fontWeight = "bold";

    }
    if(pricing_type){
        document.getElementById("${pricingType}").style.fontWeight = "bold";
    }


</script>
</body>
</html>
