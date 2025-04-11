<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Удаление продуктов</title>
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

        .delete-container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .delete-box {
            background-color: #FDE0E9;
            border-radius: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            padding: 40px;
            width: 600px;
        }

        .delete-box h2 {
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

        .delete-button {
            margin-top: 20px;
            width: 100%;
            height: 40px;
            background-color: #e74c3c;
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            transition: background-color 0.3s ease;
        }

        .delete-button:hover {
            background-color: #c0392b;
        }

        .back-button {
            margin-top: 20px;
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
            display: inline-block;
        }

        .back-button:hover {
            background-color: #e01292;
        }

        .message {
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            font-weight: bold;
        }

        .error {
            background-color: #ffebee;
            color: #c62828;
            border: 1px solid #ef9a9a;
        }

        .success {
            background-color: #e8f5e9;
            color: #2e7d32;
            border: 1px solid #a5d6a7;
        }

        tr.selected {
            background-color: #f62d2a;
            color: #333333;
            font-weight: bold;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        tr.selected:hover {
            background-color: #ee4242;
        }

        .checkbox-cell {
            width: 20px;
        }

        .checkbox-cell input[type="checkbox"] {
            width: 18px;
            height: 18px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="delete-container">
    <div class="delete-box">
        <h2>Удаление продуктов</h2>

        <#if errorMessage??>
            <div class="message error">${errorMessage}</div>
        </#if>
        <#if successMessage??>
            <div class="message success">${successMessage}</div>
        </#if>

        <form action="/delete" method="post" onsubmit="return validateForm()">
            <table>
                <thead>
                <tr>
                    <th class="checkbox-cell">Выбрать</th>
                    <th>ID</th>
                    <th>Название</th>
                    <th>Молоко</th>
                    <th>Срок хранения</th>
                </tr>
                </thead>
                <tbody>
                <#if products?has_content>
                    <#list products as product>
                        <tr>
                            <td class="checkbox-cell">
                                <input type="checkbox" name="productIds" value="${product.id}"
                                       onchange="this.closest('tr').classList.toggle('selected', this.checked)">
                            </td>
                            <td>${product.id}</td>
                            <td>${product.name}</td>
                            <td>${product.milkUsed} л</td>
                            <td>${product.shelfLifeDays} дней</td>
                        </tr>
                    </#list>
                <#else>
                    <tr>
                        <td colspan="5">Склад пуст</td>
                    </tr>
                </#if>
                </tbody>
            </table>
            <button type="submit" class="delete-button">Удалить выбранные</button>
        </form>

        <a href="/menu" class="back-button">Назад в меню</a>
    </div>
</div>

<script>
    function validateForm() {
        const checkboxes = document.querySelectorAll('input[name="productIds"]:checked');
        if (checkboxes.length === 0) {
            alert('Выберите хотя бы один продукт для удаления!');
            return false;
        }
        return confirm('Вы уверены, что хотите удалить выбранные продукты?');
    }

    document.addEventListener('DOMContentLoaded', function() {
        document.querySelectorAll('input[name="productIds"]').forEach(checkbox => {
            if (checkbox.checked) {
                checkbox.closest('tr').classList.add('selected');
            }
        });
    });
</script>
</body>
</html>