<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <fmt:message key="my_password" var="password"/>
    <fmt:message key="welcome" var="welcome"/>
</fmt:bundle>

<html lang="ru">
<head>
    <title>Вход</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
    </style>

</head>
<body>
<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <form class="login100-form validate-form" method="post" action="/fs/authorization">
                <span class="login100-form-title p-b-26">
                ${welcome}
                </span>
                <c:if test="${not empty login_error}">
                    <p class="error">${login_error}</p>
                </c:if>
                <span class="login100-form-title p-b-48">
                    <div class="home-icon"></div>
                </span>
                <select class="form-control" id="exampleFormControlSelect1" style="padding-top: 10px;    margin-bottom: 30px;" onChange="window.location.href=this.value">
                    <option value="/fs/set-lang?language=RU" <c:if test="${language == 'RU'}">selected="selected"</c:if>>Русский</option>
                    <option value="/fs/set-lang?language=EN" <c:if test="${language == 'EN'}">selected="selected"</c:if>>English</option>
                </select>
                <div class="wrap-input100 validate-input" >
                    <input class="input100" type="text" name="login">
                    <span class="focus-input100" data-placeholder="${login_ru}"></span>
                </div>
                <div class="wrap-input100 validate-input" >
                    <input class="input100" type="password" name="password">
                    <span class="focus-input100" data-placeholder="${password}"></span>
                </div>
                <div class="container-login100-form-btn">
                    <div class="wrap-login100-form-btn">
                        <div class="login100-form-bgbtn"></div>
                        <button class="login100-form-btn">
                            ${login}
                        </button>
                    </div>
                </div>
                <div class="text-center p-t-115">
                    <span class="txt1">
                    ${no_account}
                    </span>
                    <a class="txt2" href="/fs/registration">
                        ${create_him}
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>
<div id="dropDownSelect1"></div>

<script src="js/jquery-3.2.1.min.js"/>
<script src="js/animsition.min.js"/>
<script src="js/popper.js"/>
<script src="js/bootstrap.min.js"/>
<script src="js/select2.min.js"/>
<script src="js/daterangepicker.js"/>
<script src="js/countdowntime.js"/>
<script src="js/main.js"/>
</body>
</html>