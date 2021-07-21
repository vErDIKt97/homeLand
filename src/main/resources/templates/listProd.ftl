<#import "parts/common.ftl" as c>
<@c.page>
<script type="text/javascript">
    let ok = 0;
</script>
<div class="container">
    <form name="listProd" method="post" action="/listSave">
        <table>
            <tr>
                <th>Наименование</th>
                <th>Требуемое количество</th>
                <th>Текущее количество</th>
            </tr>
            <#list list.getListItems() as listItem>
                <tr>
                    <td width="100px" name="itemName" id="itemName">${listItem.getItemName()}</td>
                    <td width="20px" name="countRec"
                        id="countRec${listItem.getNumber()}">${listItem.getCountRec()}</td>
                    <td width="20px" name="countCur">
                        <input type="text" value="${listItem.getCountCur()}"
                               id="countCur${listItem.getNumber()}"
                               name="countCur">
                        <input type="hidden" value="${listItem.getNumber()}" name="number">
                    </td>
                    <td><input type="button" id="${listItem.getNumber()}" onclick="buttonClcPl(this.id)"
                               align="right"
                               value="+"></td>
                    <td><label class="checkOK" style="display: none"
                               id="equal${listItem.getNumber()}">OK</label>
                    </td>
                </tr>
            </#list>
        </table>
        <input type="hidden" name="listProdID" value="${list.getId()}">
        <input type="submit" value="Cохранить">
    </form>
    <form action="/listRemove}" method="get">
        <input type="hidden" value="${list.getId()}" name="listProdID">
        <input type="submit" value="Удалить список" id="removeList">
    </form>
    <form action="/list" method="get">
        <input type="submit" value="Вернутся к списку листов">
    </form>
    <script type="text/javascript">

        function buttonClcPl(event) {
            let id = event;
            let countRec = document.getElementById('countRec' + id);
            let countCur = document.getElementById('countCur' + id);
            let equal = document.getElementById('equal' + id);
            let checkOk = document.getElementsByClassName('checkOK');
            if (parseInt(countRec.innerText) > parseInt(countCur.value)) {
                countCur.value++;
                if (parseInt(countRec.innerText) === parseInt(countCur.value)) {
                    equal.removeAttribute('style');
                    ok++;
                }
            }
            if (ok === checkOk.length) {
                alert('Всё куплено!');
            }
        }
    </script>
</div>
</@c.page>