<!--Шаблон формы регистрации/входа-->
<#macro login path>
    <form class="needs-validation" action="${path}" method="post" name="user">
        <div class="row">
            <div class="row">
                <label class="form-label" for="username">Имя пользователя: </label>
                <input  class="form-control mx-2" style="width: 200px" type="text" id="username" name="username" placeholder="user" required/>
            </div>
            <div class="row my-1">
                <label class="form-label" for="password">Пароль: </label>
                <input class="form-control mx-2" style="width: 200px" type="password" id="password" name="password" placeholder="password" required/>
            </div>
        </div>
        <#--noinspection FtlReferencesInspection-->
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <div><input type="submit" class="btn btn-primary my-2" value="Подтвердить"></div>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <#--noinspection FtlReferencesInspection-->
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit" class="btn btn-primary">Выход</button>
    </form>
</#macro>