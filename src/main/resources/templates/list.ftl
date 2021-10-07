<#import "parts/common.ftl" as c>
<@c.page>
    <div class="col-6">

        <#if lists??>
            <table class="table">
                <caption class="caption-top">Списки продуктов</caption>
                <thead>
                <tr>
                    <th class="col-4">Название списка</th>
                    <th class="col">Все куплено</th>
                    <th class="col">Действия</th>
                </tr>
                </thead>
                <tbody>
                <#list lists as list>
                    <tr>
                        <td>
                            <form action="/list/listProd" method="get">
                                <input type="submit" class="btn btn-info" value="${list.getListName()}"
                                       id="${list.getId()}"/>
                                <input type="hidden" name="id" value="${list.getId()}">
                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            </form>
                        </td>
                        <td>
                            <#if list.checkFill()>
                            <i class="bi bi-check-square-fill" style="font-size: 150%; color: green"></i>
                            <#else> <i class="bi bi-x-square-fill" style="font-size: 150%; color: red"></i>
                            </#if>
                        </td>
                        <td>
                            <form method="get" action="/list/listProd">
                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                <input type="hidden" value="${list.getId()}" name="id">
                                <input type="hidden" name="edit" value="edit">
                                <input type="submit" class="btn btn-danger mx-2" value="Редактировать список">
                            </form>
                            <form action="/listRemove" method="get">
                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                <input type="hidden" value="${list.getId()}" name="listProdID">
                                <input type="submit" class="btn btn-danger mx-2" value="Удалить список" id="removeList">
                            </form>
                        </td>
                    </tr>
                </#list>
                </tbody>
            </table>
        </#if>

        <#if message??>
            <h3>${message}</h3>
        </#if>
    </div>
    <form method="get" action="/createList">
        <input type="submit" class="btn btn-primary my-2" value="Создать список">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    </form>
</@c.page>