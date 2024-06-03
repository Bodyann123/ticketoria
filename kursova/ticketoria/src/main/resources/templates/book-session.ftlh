<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Book Session</title>
    <style>
        body {
            background-color: #f0f0f0;
            color: #333333;
            font-family: 'Roboto', sans-serif;
            padding: 20px;
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #ff5722;
        }
        form {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin-bottom: 10px;
        }
        input[type="email"],
        select {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            background-color: #ffffff;
            border: 1px solid #ff5722;
            color: #333333;
            box-sizing: border-box;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #ff5722;
            border: none;
            color: #ffffff;
            border-radius: 4px;
            cursor: pointer;
            transition: 0.5s;
        }
        input[type="submit"]:hover {
            background-color: #ffccbc;
            color: #333333;
        }
        img {
            display: block;
            margin: 20px auto;
            max-width: 100%;
            height: auto;
        }
    </style>
</head>
<body>
<h1>Замовити квиток на фільм: ${session.title}</h1>
<form action="/session/${session.id}/order" method="post">
    <input type="hidden" th:field="*{id}" />
    <input type="hidden" th:field="*{id}" />
    <label for="quantity">Кількість квитків: 1</label>
    <br>
    <label for="customerEmail">Email:</label>
    <input type="email" id="customerEmail" name="customerEmail" />
    <br>
    <label for="row">Виберіть ряд:</label>
    <select id="row" name="seatRowNumber" th:field="*{seatRowNumber}">
        <script th:inline="javascript">
            for (let i = 1; i <= 20; i++) {
                document.write("<option value='" + i + "'>" + i + "</option>");
            }
        </script>
    </select>

    <label for="seat">Виберіть місце:</label>
    <select id="seat" name="seatNumber" th:field="*{seatNumber}">
        <script th:inline="javascript">

            for (let i = 1; i <= 20; i++) {
                document.write("<option value='" + i + "'>" + i + "</option>");
            }
        </script>
    </select>
    <label for="totalPrice">Price: ${session.price} UAH</label>
    <br>
    <input type="submit" class="btn btn-primary" value="Create Order" />


</form>
</body>
</html>
