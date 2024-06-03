<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Order Details</title>
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
        p {
            margin-bottom: 10px;
        }
        h3 {
            text-align: center;
            margin-top: 20px;
            color: #ff5722;
        }
    </style>
</head>
<body>
<h1>Order Details</h1>
<#list orders as order>
    <div style="background-color: #ffffff; padding: 20px; margin-bottom: 20px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
        <p>Order ID: ${order.id}</p>
        <p>Customer Email: ${order.customerEmail}</p>
        <p>Seat Row Number: ${order.seatRowNumber}</p>
        <p>Seat Number: ${order.seatNumber}</p>
    </div>
<#else>
    <h3>Нема замовлень</h3>
</#list>
</body>
</html>
