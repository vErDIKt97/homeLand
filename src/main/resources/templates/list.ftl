<#import "parts/common.ftl" as c>
<@c.page>
<div class="container">
    <div>
        <table>
            <tr>
                <#list lists as list>
                <td>
                    <form action="/list/listProd" method="get">
                        <input type="submit" value="${list.getListName()}" id="${list.getId()}"/>
                        <input type="hidden" name="id" value="${list.getId()}">
                    </form>
                </td>
                <td>
                    <form action="/listRemove" method="get">
                        <input type="hidden" value="${list.getId()}" name="listProdID">
                        <input type="submit" value="Удалить список" id="removeList">
                    </form>
                </td>
                </#list>
            </tr>
        </table>
    </div>
    <a href="createList">Создать список</a>
</div>
</@c.page>