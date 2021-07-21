<#import "parts/common.ftl" as c>
<@c.page>
</head>
<div class="container">
    <p>Добро пожаловать, ${user.nickname}</p>
    <h1 align="center">Меню</h1>
    <h2 align="center"><a href="/list">Списки покупок</a></h2>
    <h2 align="center"><a href="/chat">Чат</a></h2>
    <h2 align="center"><a href="/media">Медиа</a></h2>
</div>

</@c.page>