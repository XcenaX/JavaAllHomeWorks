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
    <fmt:message key="cource" var="my_cource"/>
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
    <fmt:message key="buy_course_to_watch" var="buy_course_to_watch"/>
    <fmt:message key="start_reading" var="start_reading"/>
    <fmt:message key="purchase" var="purchase"/>
    <fmt:message key="purchased" var="purchased"/>
    <fmt:message key="start_course" var="start_course"/>
    <fmt:message key="you_start_course" var="you_start_course"/>
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

<html>
<head>
    <title>${cource.title}</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" media="all" href="https://cdn2.hexlet.io/assets/application-6c79ff11f91a2bc1f99cd07b254b3f0c28c107706cefef4d910ca3b4ba7f5266.css">
    <link rel="stylesheet" media="screen" href="https://cdn2.hexlet.io/packs/css/41-4310e18e.chunk.css">
    <link rel="alternate" type="application/rss+xml" title="RSS" href="https://ru.hexlet.io/lessons.rss">
    <link id="avast_os_ext_custom_font" href="chrome-extension://eofcbnmajmjmplflapaojjnihcjkigck/common/ui/fonts/fonts.css" rel="stylesheet" type="text/css">

    <style>
        <jsp:directive.include file="styles/cource.css"/>
        <jsp:directive.include file="styles/dialog.css"/>
        <jsp:directive.include file="styles/main.css"/>
    </style>

</head>
<body>
    <!-- DIALOG BLOCK -->
    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <c:if test="${cource.price <= currentUser.money}">
                <span class="dialog-header">${buy_cource}</span>
                <form class="dialog-form" method="post" action="/fs/buy">
                    <input type="hidden" value="${cource.id}" name="id">
                    <button class="agree" type="submit">${yes}</button>
                    <div id="close-dialog" class="close-dialog">${no}</div>
                </form>
            </c:if>
            <c:if test="${cource.price > currentUser.money}">
                <span class="dialog-header">${not_enough_money}</span>
            </c:if>


        </div>
    </div>
    <!-- DIALOG BLOCK -->
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
    <!-- MAIN BLOCK -->
    <main>
        <div class="jumbotron jumbotron-fluid bg-dark">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-7 col-sm-12 text-white">
                        <c:choose>
                            <c:when test="${cource.price == 0}">
                                <span class="badge badge-light mr-1">${free}</span>
                            </c:when>
                            <c:when test="${cource.price != 0}">
                                <span class="badge badge-light mr-1">${cource.price} тг</span>
                            </c:when>
                        </c:choose>

                        <span>${my_cource}</span>
                        <h1 class="h2 font-weight-normal">
                            ${cource.title}
                        </h1>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-12 col-md-7 col-sm-12 col-lg-8 order-1 order-md-0">
                    <p>${cource.description}</p>

                    <h2 class="h3 my-4">Подготовительный курс</h2>

                    <c:choose>
                        <c:when test="${isPurchased == true}">
                            ${cource.htmlBlock}
                        </c:when>
                        <c:when test="${isPurchased == false && cource.price!=0}">
                            <span class="not-purchased">${buy_course_to_watch}</span>
                        </c:when>
                        <c:when test="${isPurchased == false && cource.price==0}">
                            <span class="not-purchased">${start_reading}</span>
                        </c:when>
                    </c:choose>
                </div>


                <div class="col-lg-4 col-md-5 col-sm-12 order-0 order-md-1 mb-3 mb-md-0">
                    <div class="h-100">
                        <div class="position-sticky pt-2 hexlet-course-sidebar">
                            <div class="card shadow-sm">
                                <div class="d-none d-md-block">
                                    <img class="card-img-top" alt="Курс ${cource.title}" src="https://cdn2.hexlet.io/derivations/image/fill/600/400/eyJpZCI6ImM0ODJhOTg5NGMwNzM4YzA5MDAyMzMyMjk0ZmIyYzY0LnBuZyIsInN0b3JhZ2UiOiJzdG9yZSJ9?signature=a363b78c43267f09ed6ccd1d1739fc212336a55aeb0f4cab0017ccd6b8e0fab6">
                                </div>
                                <div class="card-body">
                                    <div class="mb-3">
                                        <div class="text-center">
                                            ${duration}
                                            <div class="h3 mt-1">${cource.duration} ${cource.getHour(cource.duration)}</div>
                                        </div>
                                        <div class="text-center mt-3">
                                            ${price}
                                            <c:choose>
                                                <c:when test="${cource.price == 0}">
                                                    <div class="h3 mt-1">${free}</div>
                                                </c:when>
                                                <c:when test="${cource.price != 0}">
                                                    <div class="h3 mt-1">${cource.price}тг</div>
                                                </c:when>
                                            </c:choose>
                                        </div>
                                        <c:choose>
                                            <c:when test="${isPurchased == true && cource.price!=0}">
                                                <div style="margin-top: 20px;" id="start_course_form" class="button_to">
                                                    <button disabled="true" class="btn btn-success btn-block purchased" >
                                                        ${purchased}
                                                    </button>
                                                </div>
                                            </c:when>
                                            <c:when test="${isPurchased != true && cource.price != 0}">
                                                <div style="margin-top: 20px;" id="start_course_form" class="button_to">
                                                    <button id="myBtn" class="btn btn-success btn-block" >
                                                        ${purchase}
                                                    </button>
                                                </div>
                                            </c:when>
                                            <c:when test="${isPurchased != true && cource.price == 0}">
                                                <div style="margin-top: 20px;" id="start_course_form" class="button_to">
                                                    <form action="/fs/buy" method="post">
                                                        <input type="hidden" value="${cource.id}" name="id">
                                                        <button  class="btn btn-success btn-block" >
                                                            ${start_course}
                                                        </button>
                                                    </form>

                                                </div>
                                            </c:when>
                                            <c:when test="${isPurchased == true && cource.price == 0}">
                                                <div style="margin-top: 20px;" id="start_course_form" class="button_to">
                                                    <button disabled="true" class="btn btn-success btn-block purchased" >
                                                        ${you_start_course}
                                                    </button>
                                                </div>
                                            </c:when>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </main>
    <!-- MAIN BLOCK -->
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
        var modal = document.getElementById("myModal");
        var btn = document.getElementById("myBtn");
        var span = document.getElementsByClassName("close")[0];
        var closeBtn = document.getElementById("close-dialog");
        var closeBtn1 = document.getElementById("close-dialog1");

        btn.onclick = function() {
            modal.style.display = "block";
        }

        span.onclick = function() {
            modal.style.display = "none";
        }

        closeBtn.onclick = function() {
            modal.style.display = "none";
        }

        closeBtn1.onclick = function() {
            modal.style.display = "none";
        }

        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </script>
</body>
</html>
