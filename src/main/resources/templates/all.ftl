<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Все коровки Катюши</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background: url('/static/fon_cow.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: Arial, sans-serif;
            color: white;
        }

        .table-container {
            text-align: center;
            margin-top: 50px;
        }

        table {
            margin: 0 auto;
            border-collapse: collapse;
            width: 80%;
            background-color: #FDE0E9;
            color: black;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            border-radius: 10px;
            overflow: hidden;
        }

        table th, table td {
            padding: 15px;
            text-align: center;
            border: 1px solid #f118a4;
        }

        table th {
            background-color: #f118a4;
            color: white;
            font-size: 18px;
        }

        table tr:nth-child(even) {
            background-color: #FEE0EB;
        }

        .back-btn {
            margin: 20px auto;
            display: block;
            text-decoration: none;
            font-size: 24px;
            font-weight: bold;
            background-color: #f118a4;
            color: white;
            padding: 0;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
            cursor: pointer;
            width: 300px;
            height: 100px;
            text-align: center;
            line-height: 100px;
            transition: background-color 0.3s;
        }

        .back-btn:hover {
            background-color: #e01292;
        }
    </style>
</head>
<body>
<div class="table-container">
    <h2>Список всех коров Катюши</h2>
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Молоко в день (л)</th>
        </tr>
        </thead>
        <tbody>
        <#list cows as cow>
            <tr>
                <td>${cow.id}</td>
                <td>${cow.milkPerDay}</td>
            </tr>
        </#list>
        </tbody>
    </table>
    <a href="/menu" class="back-btn">Вернуться в меню</a>
</div>
</body>
</html>
