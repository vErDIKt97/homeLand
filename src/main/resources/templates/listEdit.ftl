<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">
<@c.page>
    <form method="post" action="/listSave/${list.getId()}">
    <#include "parts/listEditPrt.ftl">
        <input type="submit" class="btn btn-success my-2" value="Сохранить"/>
    </form>
    <script>
        function addRow() {
            let tableBody = document.getElementById("tableBody");
            let newRow = document.createElement("tr");
            let newCellName = document.createElement("td");
            let newCellCount = document.createElement("td");
            let newCellDel = document.createElement("td");
            let newProdName = "<input  class=\"form-control\" type=\"text\"  name=\"prodName\" id=\"prodname\" required/>"
            let newProdCount = "<input  class=\"form-control\" style='width: 50px' type=\"text\" name=\"countRec\" id=\"countRec\" required>";
            let newDeleteButton = document.createElement("input");
            newDeleteButton.type = "button";
            newDeleteButton.value = "Удалить строку";
            newDeleteButton.className = "btn btn-danger";
            newDeleteButton.addEventListener('click', function () {
                var element = this;
                deleteRow(this);
            })
            newCellName.innerHTML = newProdName;
            newRow.appendChild(newCellName);
            newCellCount.innerHTML = newProdCount;
            newRow.appendChild(newCellCount)
            newCellDel.appendChild(newDeleteButton);
            newRow.appendChild(newCellDel);
            tableBody.appendChild(newRow);
        }
    </script>
    <script>
        function deleteRow(e) {
            let ell = e.parentElement.parentElement;
            ell.parentElement.removeChild(ell);
        }
    </script>
</@c.page>
