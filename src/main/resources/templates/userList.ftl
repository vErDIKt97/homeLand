<!--Страница со списком всех пользователей которые уже есть в базе-->
<#import "parts/common.ftl" as c>
<@c.page>
    <table class="table align-middle">
        <thead>
        <th>Имя пользователя</th>
        <th>Роль</th>
        <th></th>
        </thead>
        <tbody>
        <#list userList as user>
            <tr>
                <td>${user.getUsername()}</td>
                <td><#list user.roles as role>${role}<#sep>, </#list></td>
                <td><a class="btn btn-info" href="/user/${user.id}">Редактировать</a></td>
            </tr>
        </#list>
        </tbody>
    </table>
</@c.page>