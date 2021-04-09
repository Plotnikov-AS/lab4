<#import "parts/page.ftlh" as p>

<@p.page>
    <h1>Main Page</h1>
    <div>
        <#if (employees?size <= 0)>
            <h2>Сотрудников нет!</h2>
        <#else>
            <table id="employees">
                <tr>
                    <th>Фамилия</th>
                    <th>Имя Отчество</th>
                    <th>Должность</th>
                    <th>Адресс</th>
                    <th>Телефон</th>
                </tr>
                <#foreach employee in employees>
                    <tr id="tr:${employee.getId()}">
                        <td id="lastName"><input type="text" value="${employee.getLastName()}" readonly></td>
                        <td id="firstMiddleName"><input type="text" value="${employee.getFirstMiddleName()}" readonly></td>
                        <td id="position"><input type="text" value="${employee.getPosition()}" readonly></td>
                        <#if role != "GUEST">
                            <td id="address"><input type="text" value="${employee.getAddress()}" readonly></td>
                            <td id="phone"><input type="text" value="${employee.getPhone()}" readonly></td>
                        </#if>
                        <#if role == "DIRECTOR" || role == "SEMI_DIRECTOR">
                            <td><input type="button" value="Редактировать"></td>
                        </#if>
                        <#if role == "DIRECTOR">
                            <td><input type="button" value="Удалить"></td>
                        </#if>
                    </tr>
                </#foreach>
            </table>
            <#if role == "DIRECTOR">
                <div><input type="button" value="Добавить сотрудника"></div>
            </#if>
        </#if>


        <form action="/logout" method="post">
            <button type="submit">Sign out</button>
        </form>
    </div>
</@p.page>