<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored = "false" %>
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
                Добро пожаловать
                </span>
                <c:if test="${not empty login_error}">
                    <p class="error">${login_error}</p>
                </c:if>

                <span class="login100-form-title p-b-48">
                    <div class="home-icon"></div>
                </span>
                <div class="wrap-input100 validate-input" >
                    <input class="input100" type="text" name="login">
                    <span class="focus-input100" data-placeholder="Логин"></span>
                </div>
                <div class="wrap-input100 validate-input" >
                    <input class="input100" type="password" name="password">
                    <span class="focus-input100" data-placeholder="Пароль"></span>
                </div>
                <div class="container-login100-form-btn">
                    <div class="wrap-login100-form-btn">
                        <div class="login100-form-bgbtn"></div>
                        <button class="login100-form-btn">
                            Войти
                        </button>
                    </div>
                </div>
                <div class="text-center p-t-115">
                    <span class="txt1">
                    Нет аккаунта?
                    </span>
                    <a class="txt2" href="/fs/registration">
                        Создайте его
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
