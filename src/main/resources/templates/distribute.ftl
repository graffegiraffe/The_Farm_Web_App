<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Распределение продукции</title>
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

        .distribution-container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .distribution-box {
            background-color: #FDE0E9;
            border-radius: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            padding: 40px;
            width: 600px;
        }

        .distribution-box h2 {
            font-size: 28px;
            color: #f118a4;
            margin: 20px 0;
            font-weight: bold;
        }

        form {
            width: 100%;
            margin-top: 20px;
        }

        label {
            display: block;
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 8px;
            text-align: left;
            color: #333333;
        }

        input[type="text"], select {
            width: 100%;
            height: 40px;
            border: 1px solid #f118a4;
            border-radius: 10px;
            padding: 10px;
            font-size: 16px;
            margin-bottom: 20px;
            box-sizing: border-box;
        }

        .distribute-button {
            width: 100%;
            height: 40px;
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

        .distribute-button:hover {
            background-color: #e01292;
        }

        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
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

        table tr:nth-child(even) {
            background-color: #fdf7fa;
        }

        table tr:nth-child(odd) {
            background-color: #fde0e9;
        }

        .message {
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            font-weight: bold;
        }

        .success {
            background-color: #e8f5e9;
            color: #2e7d32;
            border: 1px solid #a5d6a7;
        }

        .error {
            background-color: #ffebee;
            color: #c62828;
            border: 1px solid #ef9a9a;
        }
    </style>
</head>
<body>
<div class="distribution-container">
    <div class="distribution-box">
        <h2>Распределение продукции</h2>

        <#if successMessage??>
            <div class="message success">${successMessage}</div>
        </#if>

        <#if errorMessage??>
            <div class="message error">${errorMessage}</div>
        </#if>

        <form action="/distribute" method="post">
            <label for="consumerName">Введите имя потребителя:</label>
            <input type="text" id="consumerName" name="consumerName" placeholder="Введите имя потребителя" required>

            <label for="productId">Выберите продукт для распределения:</label>
            <select id="productId" name="productId" required>
                <#list products as product>
                    <option value="${product.id}">${product.name} (Хранится: ${product.shelfLifeDays} дней)</option>
                </#list>
            </select>

            <button type="submit" class="distribute-button">Распределить</button>
        </form>

        <h3>Список распределений:</h3>
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Потребитель</th>
                <th>Продукт</th>
                <th>Дата</th>
            </tr>
            </thead>
            <tbody>
            <#list distributions as distribution>
                <tr>
                    <td>${distribution.id}</td>
                    <td>${distribution.consumerName}</td>
                    <td>${distribution.product.name}</td>
                    <td>${distribution.distributedAtFormatted}</td>
                </tr>
            </#list>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>