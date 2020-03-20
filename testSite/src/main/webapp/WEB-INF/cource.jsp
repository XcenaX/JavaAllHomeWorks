<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored = "false" %>
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
    </style>
</head>
<body>
    <!-- HEADER BLOCK -->
    <nav class="navbar navbar-expand-lg navbar-light bg-white hexlet-navbar border-bottom">
        <a aria-hidden="true" class="navbar-brand mr-4" href="/">
            Nice Cources Bro
        </a>
        <button aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler" data-target="#navbarResponsive" data-toggle="collapse" type="button">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link hexlet-navbar-link px-3 active" href="/fs/cources">
                        <div class="my-2">Курсы</div>
                    </a>
                </li>
            </ul>
            <ul class="navbar-nav">
                <li class="nav-item">

                    <a class="nav-link hexlet-navbar-link px-3 " href="https://ru.hexlet.io/session/new?from=https%3A%2F%2Fru.hexlet.io%2Fcourses">
                        <div class="my-2">${currentUser.firstName} ${currentUser.lastName}</div>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link hexlet-navbar-link px-3 " href="/u/new?from=https%3A%2F%2Fru.hexlet.io%2Fcourses">
                        <div class="my-2" style="color: red;">Выйти</div>
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
                        <span class="badge badge-light mr-1">${cource.price} $</span>
                        <span>курс</span>
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

                    ${cource.htmlBlock}

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
                                            продолжительность
                                            <div class="h3 mt-1">${cource.duration} часов</div>
                                        </div>
                                        <div class="text-center mt-3">
                                            стоимость
                                            <div class="h3 mt-1">${cource.price}$</div>
                                        </div>
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
                            <a class="x-link-only-hover" href="/fs/about">О проекте</a>
                        </li>
                        <li>
                            <a class="x-link-only-hover" href="/fs/tos">Условия использования</a>
                        </li>
                        <li>
                            <a class="x-link-only-hover" href="/fs/privacy">Политика конфиденциальности</a>
                        </li>
                    </ul>
                </div>
                <div class="col-12 col-sm-6 col-lg-3 mt-5">
                    <div class="h5 mt-5 mb-3" style="margin-top: 0px !important;">Подписка</div>
                    <ul class="list-unstyled">
                        <li>
                            <a class="x-link-only-hover" target="_blank" rel="noopener noreferrer" href="/fs/subscription">Что такое подписка?</a>
                        </li>
                        <li>
                            <a class="x-link-only-hover" href="/fs/pricing">Цены</a>
                        </li>
                    </ul>
                </div>
                <div class="col-12 col-sm-6 col-lg-3 mt-5">
                    <div class="h5 mb-3">Компаниям</div>
                    <ul class="list-unstyled">
                        <li>
                            <a class="x-link-only-hover" href="/fs/teams">Обзор возможностей</a>
                        </li>
                    </ul>
                </div>
                <div class="col-12 col-sm-6 col-lg-2 mt-5">
                    <div class="h5 mb-3">Помощь</div>
                    <ul class="list-unstyled">
                        <li>
                            <a class="x-link-only-hover" href="/fs/knowledge">База знаний</a>
                        </li>
                        <li>
                            <a class="x-link-only-hover" href="/fs/community">Топики</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
    <!-- FOOTER BLOCK -->


</body>
</html>
