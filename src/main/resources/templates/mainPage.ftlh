<#import "parts/page.ftlh" as p>

<@p.page>
    <h2>${name}<#if role == "DIRECTOR"> - Директор
        <#elseif  role == "SEMI_DIRECTOR"> - Заместитель директора
        <#elseif role == "SECRETARY"> - Секретарь</#if></h2>
    <script>
        function editEmployee(employeeId) {
            let tr = document.getElementById("tr:" + employeeId);
            let tds = tr.getElementsByTagName('td');
            let lastName = tds['lastName'].getElementsByTagName('input')[0];
            let firstMiddleName = tds['firstMiddleName'].getElementsByTagName('input')[0];
            let position = tds['position'].getElementsByTagName('input')[0];
            let address = tds['address'].getElementsByTagName('input')[0];
            let phone = tds['phone'].getElementsByTagName('input')[0];

            lastName.readOnly = false;
            firstMiddleName.readOnly = false;
            position.readOnly = false;
            address.readOnly = false;
            phone.readOnly = false;

            let btnEdit = tds['btn_edit'].getElementsByTagName('input')[0];
            btnEdit.value = "Завершить";
            tds['btn_edit'].id = "btn_finish";
            btnEdit.setAttribute('onclick', 'finishEditing(\'' + employeeId + '\')');
        }

        function finishEditing(employeeId) {
            let tr = document.getElementById("tr:" + employeeId);
            let tds = tr.getElementsByTagName('td');
            let lastName = tds['lastName'].getElementsByTagName('input')[0];
            let firstMiddleName = tds['firstMiddleName'].getElementsByTagName('input')[0];
            let position = tds['position'].getElementsByTagName('input')[0];
            let address = tds['address'].getElementsByTagName('input')[0];
            let phone = tds['phone'].getElementsByTagName('input')[0];
            let btnFinish = tds['btn_finish'].getElementsByTagName('input')[0];

            let form = document.createElement('form');
            if (employeeId === 'newEmployee') {
                form.action = '/add';
                form.method = 'post';
                form.innerHTML = getInnerHtmlForFinishEditForm(employeeId);
                tr.append(form);
                form.submit();

            } else {
                form.action = '/edit';
                form.method = 'post';
                form.innerHTML = getInnerHtmlForFinishEditForm(employeeId);
                tr.append(form);
                form.submit();

                lastName.readOnly = true;
                firstMiddleName.readOnly = true;
                position.readOnly = true;
                address.readOnly = true;
                phone.readOnly = true;

                btnFinish.value = "Редактировать";
                tds['btn_finish'].id = "btn_edit";
                btnFinish.setAttribute('onclick', 'editEmployee(\'' + employeeId + '\')');
            }
        }

        function getInnerHtmlForFinishEditForm(employeeId) {
            let tr = document.getElementById("tr:" + employeeId);
            let tds = tr.getElementsByTagName('td');
            let lastName = tds['lastName'].getElementsByTagName('input')[0];
            let firstMiddleName = tds['firstMiddleName'].getElementsByTagName('input')[0];
            let position = tds['position'].getElementsByTagName('input')[0];
            let address = tds['address'].getElementsByTagName('input')[0];
            let phone = tds['phone'].getElementsByTagName('input')[0];

            let employeeIdInput = '<input type=\'hidden\' name=\'employeeId\' value=\'' + employeeId + '\'>';
            let lastNameInput = '<input type=\'hidden\' name=\'lastName\' value=\'' + lastName.value + '\'>'
            let firstMiddleNameInput = '<input type=\'hidden\' name=\'firstMiddleName\' value=\'' + firstMiddleName.value + '\'>';
            let positionInput = '<input type=\'hidden\' name=\'position\' value=\'' + position.value + '\'>';
            let addressInput = '<input type=\'hidden\' name=\'address\' value=\'' + address.value + '\'>';
            let phoneInput = '<input type=\'hidden\' name=\'phone\' value=\'' + phone.value + '\'>';

            return employeeIdInput + lastNameInput + firstMiddleNameInput + positionInput + addressInput + phoneInput;
        }

        function deleteEmployee(employeeId) {
            let tr = document.getElementById("tr:" + employeeId);
            if (employeeId === 'newEmployee') {
                document.getElementById('employees').deleteRow(tr.rowIndex);
            } else {
                let form = document.createElement('form');
                form.action = '/delete'
                form.method = 'post';
                form.innerHTML = getInnerHtmlForFinishEditForm(employeeId);
                tr.append(form);
                form.submit();
            }
        }

        function addNewEmployee() {
            let table = document.getElementById('employees');
            if (table === null) {
                table = document.createElement('table');
                table.setAttribute('id', 'employees');

                let tr = table.insertRow(0);
                tr.insertCell(0).outerHTML = '<th>Фамилия</th>';
                tr.insertCell(1).outerHTML = '<th>Имя Отчество</th>';
                tr.insertCell(2).outerHTML = '<th>Должность</th>';
                tr.insertCell(3).outerHTML = '<th>Адрес</th>';
                tr.insertCell(4).outerHTML = '<th>Телефон</th>';

                document.getElementById('bodyDiv').append(table);
                let noEmployeesH2 = document.getElementById('noEmployeesH2');
                noEmployeesH2.parentNode.removeChild(noEmployeesH2);
            }
            let newRow = table.insertRow(table.rows.length);
            newRow.setAttribute('id', 'tr:newEmployee');

            let newCell = newRow.insertCell(0);
            newCell.setAttribute('id', 'lastName');
            let newElem = document.createElement('input');
            newElem.setAttribute('type', 'text');
            newElem.setAttribute('value', 'Новый сотрудник');
            newElem.readOnly = true;
            newCell.appendChild(newElem);

            newCell = newRow.insertCell(1);
            newCell.setAttribute('id', 'firstMiddleName');
            newElem = document.createElement('input');
            newElem.setAttribute('type', 'text');
            newElem.setAttribute('value', 'Новый сотрудник');
            newElem.readOnly = true;
            newCell.appendChild(newElem);

            newCell = newRow.insertCell(2);
            newCell.setAttribute('id', 'position');
            newElem = document.createElement('input');
            newElem.setAttribute('type', 'text');
            newElem.setAttribute('value', 'Новый сотрудник');
            newElem.readOnly = true;
            newCell.appendChild(newElem);

            newCell = newRow.insertCell(3);
            newCell.setAttribute('id', 'address');
            newElem = document.createElement('input');
            newElem.setAttribute('type', 'text');
            newElem.setAttribute('value', 'Новый сотрудник');
            newElem.readOnly = true;
            newCell.appendChild(newElem);

            newCell = newRow.insertCell(4);
            newCell.setAttribute('id', 'phone');
            newElem = document.createElement('input');
            newElem.setAttribute('type', 'text');
            newElem.setAttribute('value', 'Новый сотрудник');
            newElem.readOnly = true;
            newCell.appendChild(newElem);

            newCell = newRow.insertCell(5);
            newCell.setAttribute('id', 'btn_edit');
            newElem = document.createElement('input');
            newElem.setAttribute('type', 'button');
            newElem.setAttribute('value', 'Редактировать');
            newElem.setAttribute('onclick', 'editEmployee(\'newEmployee\')');
            newElem.readOnly = true;
            newCell.appendChild(newElem);

            newCell = newRow.insertCell(6);
            newCell.setAttribute('id', 'btn_delete');
            newElem = document.createElement('input');
            newElem.setAttribute('type', 'button');
            newElem.setAttribute('value', 'Удалить');
            newElem.setAttribute('onclick', 'deleteEmployee(\'newEmployee\')');
            newElem.readOnly = true;
            newCell.appendChild(newElem);
        }
    </script>
    <div id="bodyDiv">
        <#if (employees?size <= 0)>
            <h2 id="noEmployeesH2">Сотрудников нет!</h2>
        <#else>
            <table id="employees">
                <tr>
                    <th>Фамилия</th>
                    <th>Имя Отчество</th>
                    <th>Должность</th>
                    <#if role != "GUEST">
                        <th>Адрес</th>
                        <th>Телефон</th>
                    </#if>
                </tr>
                <#foreach employee in employees>
                    <tr id="tr:${employee.getId()}">
                        <td id="lastName"><input type="text" value="${employee.getLastName()}" readonly></td>
                        <td id="firstMiddleName"><input type="text" value="${employee.getFirstMiddleName()}" readonly>
                        </td>
                        <td id="position"><input type="text" value="${employee.getPosition()}" readonly></td>
                        <#if role != "GUEST">
                            <td id="address"><input type="text" value="${employee.getAddress()}" readonly></td>
                            <td id="phone"><input type="text" value="${employee.getPhone()}" readonly></td>
                        </#if>
                        <#if role == "DIRECTOR" || role == "SEMI_DIRECTOR">
                            <td id="btn_edit"><input type="button" value="Редактировать"
                                                     onclick="editEmployee(${employee.getId()})"></td>
                        </#if>
                        <#if role == "DIRECTOR">
                            <td id="btn_delete"><input type="button" value="Удалить"
                                                       onclick="deleteEmployee(${employee.getId()})"></td>
                        </#if>
                    </tr>
                </#foreach>
            </table>
        </#if>
    </div>
    <div>
        <#if role == "DIRECTOR">
            <div><input type="button" id="btn_add_new" value="Добавить сотрудника" onclick="addNewEmployee()"></div>
        </#if>

        <form action="/logout" method="post">
            <button type="submit">Выйти</button>
        </form>
    </div>
</@p.page>