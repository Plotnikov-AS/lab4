<#import "parts/page.ftlh" as c>

<@c.page>
    Регистрация
    <#if (message)??>
        ${message}
    </#if>
    <form action="/registration" method="post">
        <div><label> Имя: <input type="text" name="name"> </label></div>
        <div><label> Логин: <input type="text" name="username"/> </label></div>
        <div><label> Пароль: <input type="password" name="password"/> </label></div>
        <div><label> Роль: <select name="role" id="role">
                    <option value="DIRECTOR">Директор</option>
                    <option value="SEMI_DIRECTOR">Заместитель директора</option>
                    <option value="SECRETARY">Секретарь</option>
                </select> </label></div>
        <div><input type="submit" value="Регистрация"/></div>
    </form>
</@c.page>