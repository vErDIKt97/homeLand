<div class="row">
    <div class="col-4">
        <label class="form-label" for="listName">Название списка:</label>
        <#if list.getListName()??>
            <input class="form-control mx-2" id="listName" name="listName" type="text" value="${list.getListName()}"
                   required/>
        <#else>
            <input class="form-control mx-2" id="listName" name="listName" type="text" placeholder="Продукты" required/>
        </#if>
    </div>
</div>
<table class="table">
    <thead>
    <tr>
        <th><label class="form-label" for="prodname">Наименование товара</label></th>
        <th><label class="form-label" for="countRec">Требуемое количество</label></th>
        <#if list.getListName()??>
        <th><label class="form-label" for="countCur">Текущее количество</label></th>
    </tr>
    </thead>
    <tbody id="tableBody">
    <#list list.getListItems() as listItem>
        <tr>
            <td name="itemName" id="itemName">
                <input class="form-control" type="text" name="prodName" id="prodName"
                       value="${listItem.getItemName()}" required/>
            </td>
            <td name="countRec" id="countRec${listItem.getNumber()}">
                <input class="form-control" type="text" style="width: 50px" name="countRec" id="countRec"
                       value="${listItem.getCountRec()}" required/>
            </td>
            <td name="countCur">
                <input class="form-control" type="text" value="${listItem.getCountCur()}"
                       id="countCur${listItem.getNumber()}"
                       name="countCur">
                <input type="hidden" value="${listItem.getNumber()}" name="number">
            </td>
        </tr>
    </#list>
    <#else>
    <th></th>
    </tr>
    </thead>
    <tbody id="tableBody">
    <tr>
        <td>
            <input class="form-control" type="text" name="prodName" id="prodname" placeholder="Помидор" required/>
        </td>
        <td>
            <input class="form-control" type="text" style="width: 50px" name="countRec" id="countRec"
                   placeholder="1" required/>
        </td>
        <td></td>
    </tr>
    </#if>
    </tbody>
</table>
<input type="hidden" name="_csrf" value="${_csrf.token}"/>
<input type="Button" class="btn btn-secondary" value="Добавить строку" onclick="addRow()"/>
