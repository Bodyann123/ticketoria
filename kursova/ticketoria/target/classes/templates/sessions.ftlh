<!doctype html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="/static/css/style.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-s15y6DxywsA9hU4d53pH+Ng7qzT7wC09h6Xn+tbVx+VDDVu2k5ZITu1tGrKJXK6A" crossorigin="anonymous"></script>
    <title>Ticketoria</title>
    <style>
        body {
            background-color: #f0f0f0;
            color: #333333;
            font-family: 'Roboto', sans-serif;
        }

        span{
            color: white;
        }
        h1 {
            margin-top: 20px;
            text-align: center;
            font-weight: bold;
            color: #ff5722;
        }
        .container {
            margin-top: 30px;
        }
        .search-bar, .new-session-form {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .search-bar input, .new-session-form input, .new-session-form select, .new-session-form textarea {
            margin-bottom: 15px;
            background-color: #ffffff;
            border: 1px solid #ff5722;
            color: #333333;
        }
        .search-bar input:focus, .new-session-form input:focus, .new-session-form select:focus, .new-session-form textarea:focus {
            background-color: #ffffff;
            color: #ff5722;
            border-color: #ff5722;
        }
        .session-item {
            margin-bottom: 15px;
            transition: background-color 0.3s;
        }
        .session-item p {
            font-size: 18px;
        }
        .session-item a {
            color: #ff5722;
            text-decoration: none;
            transition: color 0.3s, transform 0.3s;
        }
        .session-item a:hover {
            color: #ffccbc;
            transform: scale(1.1);
        }
        .btn-custom {
            background-color: #ff5722;
            border: none;
            color: #ffffff;
            transition: background-color 0.3s, color 0.3s;
        }
        .btn-custom:hover {
            background-color: #ffccbc;
            color: #333333;
        }



        .session-list {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            max-height: 400px;
            overflow-y: auto;
        }

        .session-item {
            background-color: #ffffff;
            border-radius: 10px;
            padding: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            flex-grow: 1; /* Заповнює рядок */
        }

        .session-item a.btn-primary {
            background-color: #f44336;
            border-color: #f44336;
        }

        .session-item a.btn-primary:hover {
            background-color: #e57373;
            border-color: #e57373;
        }

        .btn-danger {
            background-color: #f44336;
            border: none;
            color: #ffffff;
            transition: background-color 0.3s, color 0.3s;
        }
        .btn-danger:hover {
            background-color: #e57373;
            color: #ffffff;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>TICKETORIA | <a href="/login" class="text-muted" style="font-style: italic">Вхід</a></h1>    <hr>
    <div class="text-right mb-4">
        <form action="/logout" method="get">
            <button type="submit" class="btn btn-danger">Logout</button>
        </form>


    </div>
    <h4 class="h4">Квитки на будь який фільм</h4>

    <div class="search-bar mb-4">
        <form action="/" method="get">
            <div class="form-group">
                <label for="title">Пошук по назві сеансу:</label>
                <input type="text" id="title" name="title" class="form-control">
            </div>
            <button type="submit" class="btn btn-custom">Шукати</button>
        </form>
    </div>
    <div class="session-list">
        <#list sessions as session>
        <div class="session-item rounded p-3 mb-3" style="width: 25%; box-sizing: border-box;">
            <p><b>${session.title}</b></p>
            <p>${session.price} грн. ${session.rating}</p>
            <a href="/session/${session.id}" class="btn btn-primary"> <span>Детальніше</span></a>
        </div>
    <#else>
            <h3>Сеансів нема</h3>
        </#list>
    </div>
    <hr>
    <h3>Створити новий сеанс</h3>
    <div class="new-session-form">
            <form action="/session/create" method="post">
                <div class="form-group">
                    <label for="title">Назва фільму:</label>
                    <input type="text" id="title" name="title" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="description">Опис:</label>
                    <input type="text" id="description" name="description" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="price">Ціна квитка на сеанс:</label>
                    <input type="number" id="price" name="price" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="duration">Тривалість(хв):</label>
                    <input type="number" id="duration" name="duration" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="rating">Оцінка фільму:</label>
                    <input type="number" id="rating" name="rating" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-custom">Додати новий сеанс</button>
            </form>
        </div>

    </div>
    <div id="message" style="display: none;"></div>
    <script>
        $(document).ready(function() {
            // Show the message after the order is created
            $("#message").text("Your order has been successfully created. Please check your email.").show();
        });
    </script>
</div>
</body>
</html>

