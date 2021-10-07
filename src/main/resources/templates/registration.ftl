<#import "parts/common.ftl" as c>
    <#import "parts/login.ftl" as l>
<@c.page>
    <h3>Регистрация</h3>
    <@l.login "/registration"/>
    <div>Уже есть аккаунт?</div>
    <a href="/login">Войти</a>
</@c.page>