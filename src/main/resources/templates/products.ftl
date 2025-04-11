<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Добавить продукт</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            background: url('/static/fon_cow.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: Arial, sans-serif;
            color: white;
        }

        .add-container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .add-box {
            background-color: #FDE0E9;
            border-radius: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            padding: 40px;
            width: 500px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .add-box h2 {
            font-size: 28px;
            color: #f118a4;
            margin: 20px 0;
            font-weight: bold;
        }

        .message-box {
            width: 100%;
            margin-bottom: 20px;
            padding: 15px;
            border-radius: 10px;
            text-align: center;
            font-size: 18px;
            font-weight: bold;
        }

        .error-message {
            background-color: #f8d7da;
            color: #842029;
            border: 1px solid #f5c2c7;
        }

        .info-message {
            background-color: #cff4fc;
            color: #055160;
            border: 1px solid #b6effb;
        }

        .milk-info {
            font-size: 18px;
            color: black;
            margin-top: 15px;
            font-weight: bold;
        }

        .add-box label {
            font-size: 18px;
            color: #333333;
            margin-bottom: 10px;
            align-self: flex-start;
            font-weight: bold;
        }

        .add-box input {
            width: 100%;
            height: 35px;
            margin-bottom: 15px;
            border: none;
            border-radius: 8px;
            padding-left: 10px;
            font-size: 16px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .add-box button {
            width: 100%;
            height: 40px;
            margin-top: 15px;
            background-color: #f118a4;
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            transition: background-color 0.3s ease;
        }

        .add-box button:hover {
            background-color: #e01292;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        table th, table td {
            border: 1px solid #f118a4;
            padding: 10px;
            text-align: center;
            font-size: 16px;
            color: #333333;
        }

        table th {
            background-color: #f118a4;
            color: white;
            font-weight: bold;
        }

        .back-button {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background-color: #f118a4;
            color: white;
            border: none;
            border-radius: 10px;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            transition: background-color 0.3s ease;
            text-decoration: none;
            text-align: center;
        }

        .back-button:hover {
            background-color: #e01292;
        }

        table tr:nth-child(even) {
            background-color: #fdf7fa;
        }

        table tr:nth-child(odd) {
            background-color: #fde0e9;
        }
    </style>
</head>
<body>
<div class="add-container">
    <div class="add-box">
        <h2>Создание продукта</h2>

        <#if errorMessage??>
            <div class="message-box error-message">${errorMessage}</div>
        </#if>
        <#if infoMessage??>
            <div class="message-box info-message">${infoMessage}</div>
        </#if>

        <form action="/products/add" method="post">
            <label for="name">Название продукта:</label>
            <input type="text" id="name" name="name" placeholder="Введите название продукта" required>
            <label for="milkUsed">Объем молока (литры):</label>
            <input type="number" id="milkUsed" name="milkUsed" step="0.01" min="0.01" placeholder="Введите объем молока" required>
            <label for="shelfLifeDays">Срок хранения (дней):</label>
            <input type="number" id="shelfLifeDays" name="shelfLifeDays" min="1" placeholder="Введите срок хранения" required>
            <button type="submit">Создать продукт</button>
        </form>
        <h3 class="milk-info">Доступное молоко: ${availableMilk} литров</h3>
        <h2>Список продуктов</h2>
        <table>
            <thead>
            <tr>
                <th>Название</th>
                <th>Использовано молока</th>
                <th>Срок хранения</th>
            </tr>
            </thead>
            <tbody>
            <#list products as product>
                <tr>
                    <td>${product.name}</td>
                    <td>${product.milkUsed} литров</td>
                    <td>${product.shelfLifeDays} дней</td>
                </tr>
            </#list>
            </tbody>
        </table>
    </div>
</div>

<a href="/menu" class="back-button">Назад</a>
</body>
</html>