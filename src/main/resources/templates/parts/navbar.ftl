<!--Навигационная панель, используется на всех страницах-->
<#include "security.ftl">
<#import "login.ftl" as l>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Переключить навигацию">
            <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand" href="/"><i class="bi bi-house-fill"></i> HomeLand</a>
        <div class="navbar-collapse collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/main">Главная</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/list">Списки покупок</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Чат</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Медиа</a>
                </li>
                <#if isAdmin>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/userList">Список пользователей</a>
                    </li>
                </#if>
            </ul>

        </div>
        <div class="row justify-content-end">
            <div class="col my-2">
                <span class="navbar-text">
                 ${name}
                </span>
            </div>
            <div class="col">
                <#if name!="Гость">
                    <@l.logout/>
                <#else>
                    <a href="/login" class="btn btn-primary" role="button" aria-pressed="true">Войти</a>
                </#if>
            </div>
        </div>
    </div>
</nav>