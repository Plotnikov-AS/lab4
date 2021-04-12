<#import "parts/page.ftlh" as c>

<@c.page>
Страница авторизации
    <form action="/login" method="post">
        <div><label> Логин: <input type="text" name="username"/> </label></div>
        <div><label> Пароль: <input type="password" name="password"/> </label></div>
        <div><input type="submit" value="Войти"/></div>
    </form>
    <form action="/login" method="post">
        <div><label><input type="hidden" name="username" value="Guest"/></label></div>
        <div><label><input type="hidden" name="password" value="Guest"/></label></div>
        <div><input type="submit" value="Войти как гость"></div>
    </form>
<a href="/registration">Регистрация</a>
</@c.page>