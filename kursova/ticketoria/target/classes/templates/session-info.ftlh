<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" type="text/css" href="/static/css/style.css">
    <title>Ticketoria</title>
    <style>
        body {
            background-color: #f0f0f0;
            color: #333333;
            font-family: 'Roboto', sans-serif;
        }
        h1.session_h1 {
            text-align: center;
            font-weight: bold;
            color: #ff5722;
            margin-top: 20px;
        }
        h4 {
            color: #333333;
            margin-top: 20px;
        }
        hr {
            border: 0;
            height: 1px;
            background-color: #cccccc;
            margin: 20px 0;
        }
        b {
            color: #ff5722;
        }
        .btn-primary {
            background-color: #ff5722;
            border: none;
            color: #ffffff;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 10px 2px;
            transition: background-color 0.3s, color 0.3s;
            cursor: pointer;
            border-radius: 5px;
        }
        .btn-primary:hover {
            background-color: #ffccbc;
            color: #333333;
        }
        input[type="submit"] {
            background-color: #ff5722;
            border: none;
            color: #ffffff;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 10px 2px;
            transition: background-color 0.3s, color 0.3s;
            cursor: pointer;
            border-radius: 5px;
        }
        input[type="submit"]:hover {
            background-color: #ffccbc;
            color: #333333;
        }
    </style>
</head>
<body>
<h1 class="session_h1">TICKETORIA</h1>
<hr>
<h4>Детальна інформація про сеанс</h4>

<p><b>Назва сеансу: </b> ${session.title}</p>
<p><b>Опис сеансу: </b> ${session.description}</p>
<p><b>Ціна: </b> ${session.price} грн.</p>
<p><b>Тривалість сеансу (у хв): </b> ${session.duration}</p>
<p><b>Оцінка від наших експертів: </b> ${session.rating}</p>
<hr>
<form action="/session/delete/${session.id}" method="post">
    <input type="submit" value="Видалити сеанс"/>
</form>
<br>
<form action="/session/${session.id}/book" method="get">
    <input type="submit" class="btn btn-primary" value="Замовити квиток"/>
</form>
</body>
</html>
