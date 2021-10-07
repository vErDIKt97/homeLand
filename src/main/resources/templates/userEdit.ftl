<#import "parts/common.ftl" as c>
<@c.page>
    <h3>Редатор пользователя</h3>
    <form class="col-6" action="/user" method="post">
        <table class="table align-middle">
            <thead>
            <tr>
                <th>Имя пользователя</th>
                <th>Роли</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th><input class="form-control" type="text" name="username" value="${user.username}"></th>
                <th>
                    <#list roles as role>
                        <div>
                            <label>
                                <input type="checkbox"
                                       name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}
                            </label>
                        </div>
                    </#list>
                </th>
            </tr>
            </tbody>
        </table>
        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button class="btn btn-success" type="submit">Сохранить</button>
    </form>
</@c.page>