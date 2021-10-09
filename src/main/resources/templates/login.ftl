<!--Страница входа-->
<#import "parts/common.ftl" as a>
    <#import "parts/login.ftl" as c>
<@a.page>
    <h3>Вход в сервис</h3>
    <@c.login "/login"/>
    <div class="mx-1">Нет аккаунта?</div>
    <form method="get" action="/registration">
        <input type="submit" class="btn btn-primary my-1" value="Зарегистрироваться">
    </form>
</@a.page>