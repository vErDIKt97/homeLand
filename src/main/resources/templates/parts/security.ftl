<!--Проверяем знаем ли мы пользователя-->
<#assign
known = Session.SPRING_SECURITY_CONTEXT??
>
<!--Если знаем, то запоминаем пользователя, имя и проверяем является ли он администратором-->
<#if known>
    <#assign
    user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
    name = user.getUsername()
    isAdmin = user.isAdmin()
    >
<!--Если не знаем то помечаем его как гостя и указываем что это не администратор-->
<#else>
    <#assign
    name = "Гость"
    isAdmin = false
    >
</#if>

