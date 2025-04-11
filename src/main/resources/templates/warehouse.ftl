<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Содержимое склада</title>
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

        .warehouse-container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .warehouse-box {
            background-color: #FDE0E9;
            border-radius: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            padding: 40px;
            width: 600px;
        }

        .warehouse-box h2 {
            font-size: 28px;
            color: #f118a4;
            margin: 20px 0;
            font-weight: bold;
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

        table tr:nth-child(even) {
            background-color: #fdf7fa;
        }

        table tr:nth-child(odd) {
            background-color: #fde0e9;
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
    </style>
</head>
<body>
<div class="warehouse-container">
    <div class="warehouse-box">
        <h2>Содержимое склада</h2>
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Название</th>
                <th>Использовано молока</th>
                <th>Срок хранения (дней)</th>
            </tr>
            </thead>
            <tbody>
            <#if products?has_content>
                <#list products as product>
                    <tr>
                        <td>${product.id}</td>
                        <td>${product.name}</td>
                        <td>${product.milkUsed} л</td>
                        <td>${product.shelfLifeDays} дней</td>
                    </tr>
                </#list>
            <#else>
                <tr>
                    <td colspan="4">Склад пуст</td>
                </tr>
            </#if>
            </tbody>
        </table>
        <a href="/menu" class="back-button">Назад в меню</a>
    </div>
</div>
</body>
</html>