<#import "parts/common.ftl" as c>
<@c.page>
    <div class="row">
        <div class="col-8">
            <form name="listProd" method="post" action="/listSave">
                <div class="row">
                    <table class="table caption-top align-middle">
                        <caption>${list.getListName()}</caption>
                        <thead>
                        <tr>
                            <th scope="col">Наименование</th>
                            <th scope="col">Требуемое количество</th>
                            <th scope="col">Текущее количество</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <#list list.getListItems() as listItem>
                            <tr>
                                <td name="itemName" id="itemName">${listItem.getItemName()}</td>
                                <td name="countRec"
                                    id="countRec${listItem.getNumber()}">${listItem.getCountRec()}</td>
                                <td name="countCur">
                                    <input class="form-control" type="text" value="${listItem.getCountCur()}"
                                           id="countCur${listItem.getNumber()}"
                                           name="countCur">
                                    <input type="hidden" value="${listItem.getNumber()}" name="number">
                                </td>
                                <td><input class="btn btn-outline-dark" type="button" id="${listItem.getNumber()}" onclick="buttonClcPl(this.id)"
                                           value="+"></td>
                            </tr>
                        </#list>
                        </tbody>
                    </table>

                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <input type="hidden" name="listProdID" value="${list.getId()}">
                <input class="btn btn-success" type="submit" value="Cохранить">
            </form>
        </div>
    </div>
    <div class="row">
        <form action="/list" method="get">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <input class="btn btn-secondary my-2" type="submit" value="Вернутся к списку листов">
        </form>
    </div>

    <script type="text/javascript">

        function buttonClcPl(event) {
            let id = event;
            let countRec = document.getElementById('countRec' + id);
            let countCur = document.getElementById('countCur' + id);
            let checkOk = document.getElementsByClassName('checkOK');
            if (parseInt(countRec.innerText) > parseInt(countCur.value)) {
                countCur.value++;
            }
        }
    </script>
</@c.page>