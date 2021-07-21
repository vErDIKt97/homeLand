<#import "parts/common.ftl" as c>
<@c.page>
<div class="container">
    <h1>Создание нового списка</h1>
    <form action="/createList" name="items" method="post">
        <h3>Введите название списка:</h3>
        <input name="listName" type="text"/>
        <table>
            <thead>
            <th>Наименование товара</th>
            <th>Требуемое количество</th>
            </thead>
            <tbody id="tableBody">
            <tr>
                <td>
                    <input type="text" name="prodName"/>
                </td>
                <td>
                    <input type="text" style="width: 50px" name="countRec"/>
                </td>
            </tr>
            </tbody>
        </table>
        <input type="Button" value="Добавить строку" onclick="addRow()"/>
        <br>
        <input type="submit" value="Создать"/>
    </form>
</div>
    <script>
        function addRow() {
            let tableBody = document.getElementById("tableBody");
            let newRow = document.createElement("tr");
            let newCellName = document.createElement("td");
            let newCellCount = document.createElement("td");
            let newProdName = "<input type=\"text\"  name=\"prodName\"/>"
            let newProdCount = "<input style='width: 50px' type=\"text\" name=\"countRec\">";
            newCellName.innerHTML = newProdName;
            newRow.appendChild(newCellName);
            newCellCount.innerHTML = newProdCount;
            newRow.appendChild(newCellCount)
            tableBody.appendChild(newRow);

        }
    </script>
</@c.page>