<#import "parts/common.ftl" as c>
<@c.page>
<div class="container">
    <h1>Войти</h1>
    <form action="/index" method="post" name="user">
        <p>Имя пользователя: <input type="text" name="userName"/></p>
        <p><input type="submit" value="Войти"/> <input type="reset" value="Reset"/></p>
    </form>
</div>
</@c.page>