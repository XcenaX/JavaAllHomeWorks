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
    <fmt:message key="upload" var="upload"/>
    <fmt:message key="avatar" var="avatar"/>
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
    <fmt:message key="upload_error" var="my_upload_error"/>
</fmt:bundle>

<html>
<head>
    <title>Редактирование - ${currentUser.firstName}</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" media="all" href="https://cdn2.hexlet.io/assets/application-6c79ff11f91a2bc1f99cd07b254b3f0c28c107706cefef4d910ca3b4ba7f5266.css">
    <link rel="stylesheet" media="screen" href="https://cdn2.hexlet.io/packs/css/41-4310e18e.chunk.css">
    <link rel="alternate" type="application/rss+xml" title="RSS" href="https://ru.hexlet.io/lessons.rss">
    <link id="avast_os_ext_custom_font" href="chrome-extension://eofcbnmajmjmplflapaojjnihcjkigck/common/ui/fonts/fonts.css" rel="stylesheet" type="text/css">

    <style>
        <jsp:directive.include file="styles/bootstrap.min.css"/>
        <jsp:directive.include file="styles/font-awesome.min.css"/>
        <jsp:directive.include file="styles/material-design-iconic-font.min.css"/>
        <jsp:directive.include file="styles/animate.css"/>
        <jsp:directive.include file="styles/hamburgers.min.css"/>
        <jsp:directive.include file="styles/animsition.min.css"/>
        <jsp:directive.include file="styles/select2.min.css"/>
        <jsp:directive.include file="styles/daterangepicker.css"/>
        <jsp:directive.include file="styles/util.css"/>
        <jsp:directive.include file="styles/main.css"/>
        <jsp:directive.include file="styles/cource.css"/>
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
                <a class="nav-link hexlet-navbar-link px-3" href="/fs/cources">
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
                        <option value="/fs/set-lang?language=RU" <c:if test="${language == 'RU'}">selected="selected"</c:if>>Русский</option>
                        <option value="/fs/set-lang?language=EN" <c:if test="${language == 'EN'}">selected="selected"</c:if>>English</option>
                    </select>
                </div>

            </li>
            <li class="nav-item">
                <a class="nav-link hexlet-navbar-link px-3 " href="/fs/profile">
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
<c:if test="${profileEdited == true}">
    <div class="alert alert-dismissable alert-success mb-0 rounded-0" id="success-update">
        <button aria-hidden="true" class="close" id="close" data-dismiss="alert" type="button">×</button>
        ${profile_updated}
    </div>
</c:if>
<c:if test="${not empty error}">
    <div class="alert alert-dismissable alert-success mb-0 rounded-0" style="background-color: #edd4d4; border-color: #e6c3c3" id="success-update2">
        <button aria-hidden="true" class="close" id="close2" data-dismiss="alert" type="button">×</button>
        ${error}
    </div>
</c:if>
<c:if test="${not empty upload_error}">
    <div class="alert alert-dismissable alert-success mb-0 rounded-0" style="background-color: #edd4d4; border-color: #e6c3c3" id="success-update2">
        <button aria-hidden="true" class="close" id="close2" data-dismiss="alert" type="button">×</button>
            ${my_upload_error}
    </div>
</c:if>


    <main>
        <div class="container m-t-20">
            <div class="row">

                <div class="col-12 col-lg-12 mt-5 mt-lg-0">
                    <a href="/fs/profile" style="border: none;">
                        <img src="https://image.flaticon.com/icons/svg/271/271218.svg" alt="Назад" class="back-arrow">
                    </a>
                    <h3>
                        ${profile} ${currentUser.firstName} ${currentUser.lastName}
                    </h3>

                    <input name="utf8" type="hidden" value="✓">
                    <input type="hidden" name="_method" value="patch">
                    <div class="row">
                        <div class="col-12 col-xl-6">
                            <form class="simple_form edit_user" novalidate="novalidate" action="/fs/profile/edit" method="post">
                                <div class="form-group string optional user_first_name form-group-valid">
                                    <label class="string optional" for="user_first_name">${name}</label>
                                    <input class="form-control is-valid string optional" type="text" value="${currentUser.firstName}" name="firstName" id="user_first_name">
                                </div>
                                <div class="form-group string optional user_last_name form-group-valid">
                                    <label class="string optional" for="user_last_name">${last_name}</label>
                                    <input class="form-control is-valid string optional" type="text" value="${currentUser.lastName}" name="lastName" id="user_last_name">
                                </div>

                                <div class="form-group date optional user_birthday">
                                    <label class="date optional" for="user_birthday">${date_of_birth}</label>
                                    <div class="d-flex flex-row justify-content-between align-items-center">
                                        <input class="form-control mx-1 custom-select date optional" type="date" <c:if test="${currentUser.dateOfBirth != null}">value="${currentUser.dateOfBirth}"</c:if> name="date_of_birth" id="user_birthday">
                                    </div>
                                </div>
                                <div class="form-group tel optional user_phone_number">
                                    <label class="tel optional" for="user_phone_number">${phone}</label>
                                    <input maxlength="15" class="form-control string tel optional" type="tel" <c:if test="${currentUser.phone != null}">value="${currentUser.phone}"</c:if> name="phone" id="user_phone_number" onkeydown="javascript: return event.keyCode === 8 || event.keyCode === 46 ? true : (!isNaN(Number(event.key)) && event.key != ' ')">
                                </div>
                                <div class="row mt-4">
                                    <div class="col-12">
                                        <input type="submit" name="commit" value="${submit}" class="btn px-5 m-b-20 btn-primary" data-disable-with="Сохранить">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="col-12 col-xl-6">
                            <div class="form-group image_preview optional user_avatar">
                                <div>
                                    <c:if test="${hasImage == true}">
                                        <img class="img-fluid rounded shadow-sm mb-3 profile-image" src="data:image/jpg;base64,${currentUser.base64image}">
                                    </c:if>
                                    <c:if test="${hasImage == false}">
                                        <img class="img-fluid rounded shadow-sm mb-3 profile-image" src="https://cdn2.hexlet.io/assets/team/you-0d6975dd3165f8174f242a784f3beb84835b60d93e446821299ac562e4cff9c3.jpg">
                                    </c:if>

                                    <form action="/UploadServlet" method="post" enctype="multipart/form-data" class="photo-form">
                                        <div class="custom-file">
                                            <input class="custom-file-input image_preview optional" width="290" height="290" type="file" name="avatar" id="user_avatar">
                                            <label class="custom-file-label image_preview optional" for="user_avatar">${avatar}</label>
                                        </div>
                                        <button type="submit" class="submit-avatar btn px-5">${upload}</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
    var modal = document.getElementById("success-update");
    var btn = document.getElementById("close");

    var modal2 = document.getElementById("success-update2");
    var btn2 = document.getElementById("close2");
    if(btn){
        btn.onclick = function() {
            modal.style.display = "none";
        };
    }

    if(btn2){
        btn2.onclick = function() {
            modal2.style.display = "none";
        };
    }
</script>

</body>
</html>
