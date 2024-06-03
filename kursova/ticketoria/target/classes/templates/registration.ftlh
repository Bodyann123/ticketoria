<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ticketoria</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #F0F0F0;
            color: #333;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            color: #007BFF;
        }

        h4 {
            color: #FF6B6B;
        }

        form {
            max-width: 400px;
            margin: 20px auto;
            padding: 20px;
            background-color: #FFF;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 8px;
            margin: 8px 0;
            box-sizing: border-box;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            background-color: #007BFF;
            color: #FFF;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056B3;
        }

        .error-message {
            color: red;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<h1>TICKETORIA</h1>
<hr>
<h4>Реєстрація</h4>
<form action="/registration" method="post">
    Ім'я користувача: <input type="text" name="name"><br><br>
    Ел.Пошта: <input type="email" name="email"><br><br>
    Номер телефону: <input type="text" name="phoneNumber"><br><br>
    Пароль: <input type="password" name="password"><br><br>
    <input type="submit" value="Зареєструватись"/>
</form>
<#if errorMessage??>
    <div class="error-message">${errorMessage}</div>
</#if>
</body>
</html>
