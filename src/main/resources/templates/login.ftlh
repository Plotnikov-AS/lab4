<#import "parts/page.ftlh" as c>

<@c.page>
Login page
    <form action="/login" method="post">
        <div><label> Username: <input type="text" name="username"/> </label></div>
        <div><label> Password: <input type="password" name="password"/> </label></div>
        <div><input type="submit" value="Sign In"/></div>
    </form>
    <form action="/login" method="post">
        <div><label><input type="hidden" name="username" value="Guest"/></label></div>
        <div><label><input type="hidden" name="password" value="Guest"/></label></div>
        <div><input type="submit" value="Guest login"></div>
    </form>
<a href="/registration">Add new user</a>
</@c.page>