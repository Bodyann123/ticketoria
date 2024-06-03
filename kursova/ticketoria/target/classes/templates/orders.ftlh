<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Order Details</title>
</head>
<body>
<h1>Order Details</h1>
<#list orders as order>
    <p>Order ID: ${order.id}</p>
    <p>Customer Email: ${order.customerEmail}</p>
    <p>Seat Row Number: ${order.seatRowNumber}</p>
    <p>Seat Number: ${order.seatNumber}</p>

    <#else>
    <h3>Нема замовлень</h3>
</#list>


</body>
</html>
