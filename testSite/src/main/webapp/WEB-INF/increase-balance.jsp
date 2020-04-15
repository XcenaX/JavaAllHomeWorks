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
    <fmt:message key="continue" var="my_continue"/>
    <fmt:message key="login_ru" var="login_ru"/>
    <fmt:message key="no_account" var="no_account"/>
    <fmt:message key="create_him" var="create_him"/>
    <fmt:message key="has_account" var="has_account"/>
    <fmt:message key="login_now" var="login_now"/>
    <fmt:message key="retype" var="retype"/>
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
    <title>Пополнить кошелек</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" media="all" href="https://cdn2.hexlet.io/assets/application-6c79ff11f91a2bc1f99cd07b254b3f0c28c107706cefef4d910ca3b4ba7f5266.css">
    <link rel="stylesheet" media="screen" href="https://cdn2.hexlet.io/packs/css/41-4310e18e.chunk.css">
    <link id="avast_os_ext_custom_font" href="chrome-extension://eofcbnmajmjmplflapaojjnihcjkigck/common/ui/fonts/fonts.css" rel="stylesheet" type="text/css">
    <style>
        <jsp:directive.include file="styles/cource.css"/>
        <jsp:directive.include file="styles/main.css"/>
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
                <a class="nav-link hexlet-navbar-link px-3 active" href="/fs/increase-balance">
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
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-md-8">
                <h1 class="text-center mt-4 mb-5 font-weight-light">${increase_balance_text}</h1>
            </div>
        </div>
        <div id="subscription">
            <div class="row justify-content-center">
                <div class="col-12 col-sm-11 col-md-8 col-lg-6">
                    <div class="card shadow-sm">
                        <div class="card-body">
                            <div class="row row-cols-4 mx-5 w-50 mb-4 mx-auto"><img src="https://ru.hexlet.io/packs/media/flat/visa-bca381c0.svg" class="pr-1" alt="Visa"><img src="https://ru.hexlet.io/packs/media/flat/mastercard-04088ba3.svg" class="pr-1" alt="MasterCard"><img src="https://ru.hexlet.io/packs/media/flat/amex-4d5c06d0.svg" class="pr-1" alt="American Express"><img src="https://ru.hexlet.io/packs/media/flat/discover-60a47d2e.svg" alt="Discover"></div>
                            <form action="/fs/increase-balance" method="post">
                                <div class="form-group">
                                    <label class="form-label" for="card">${card_data}</label>
                                    <input type="tel" name="card-number" class="form-control nums" id="card"  autocomplete="cc-number" required="" pattern=".{19,19}" maxlength="19" placeholder="xxxx xxxx xxxx xxxx" onkeydown="javascript: return event.keyCode === 8 || event.keyCode === 46 ? true : (!isNaN(Number(event.key)) && event.key != ' ')">
                                </div>
                                <div class="form-group">
                                    <label class="form-label" for="name">${name}</label>
                                    <input name="name" required="" type="text" id="name" class="form-control" value=""><small class="text-muted form-text">${as_indicated_on_the_card}</small>
                                </div>
                                <div class="form-group">
                                    <label class="form-label" for="name">${amount_to_replenish}</label>
                                    <input name="sum" type="tel" id="sum" class="form-control" value="" minlength="1" required="" autocomplete="cc-number" maxlength="7" onkeydown="javascript: console.log(event.key);return event.keyCode === 8 || event.keyCode === 46  ? true : (!isNaN(Number(event.key)) && event.key != ' ')">
                                </div>
                                <div class="row justify-content-center mt-3">
                                    <button type="submit" class="btn btn-success px-4 btn-lg" data-facebook-pixel-id="Purchase">${my_continue}</button>
                                </div>
                            </form>
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
    $('.nums').on('keyup', function() {
        var foo = $(this).val().split(" ").join("");
        if (foo.length > 0) {
            foo = foo.match(new RegExp('.{1,4}', 'g')).join(" ");
        }
        $(this).val(foo);
    });
</script>

</body>
</html>
