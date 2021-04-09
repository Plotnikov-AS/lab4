<#import "parts/page.ftlh" as c>

<@c.page>
    Add new user
    <#if (message)??>
        ${message}
    </#if>
    <form action="/registration" method="post">
        <div><label> Name: <input type="text" name="name"> </label></div>
        <div><label> Username: <input type="text" name="username"/> </label></div>
        <div><label> Password: <input type="password" name="password"/> </label></div>
        <div><label> Role: <select name="role" id="role">
                    <option value="DIRECTOR">Директор</option>
                    <option value="SEMI_DIRECTOR">Заместитель директора</option>
                    <option value="SECRETARY">Секретарь</option>
                    <option value="GUEST">Гость</option>
                </select> </label></div>
        <div><input type="submit" value="Sign Up"/></div>
    </form>
</@c.page>