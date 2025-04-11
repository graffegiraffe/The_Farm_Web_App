<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Доить корову</title>
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
            width: 450px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .add-box h2 {
            font-size: 30px;
            color: #f118a4;
            margin: 0 0 20px 0;
            font-weight: bold;
            text-align: center;
        }

        .add-box label {
            font-size: 18px;
            color: #f118a4;
            font-weight: bold;
            margin-bottom: 10px;
            display: block;
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

        .cow-list {
            margin: 20px 0;
            text-align: left;
            color: #333;
        }

        .cow-item {
            margin: 5px 0;
        }

        .status-message {
            margin-top: 20px;
            color: #f118a4;
            font-weight: bold;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
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
<div class="add-container">
    <div class="add-box">
        <h2>Доение коров</h2>

        <div class="cow-list">
            <h3>Доступные коровы:</h3>
            <#if cows?? && cows?size gt 0>
                <#list cows as cow>
                    <div class="cow-item">ID: ${cow.id} - Молока в день: ${cow.milkPerDay} л.</div>
                </#list>
            <#else>
                <div>Нет доступных коров</div>
            </#if>
        </div>

        <form action="/milk/onecow" method="post">
            <label for="cowId">Введите ID коровы:</label>
            <input type="number" id="cowId" name="cowId" required>
            <button type="submit">Доить корову</button>
        </form>

        <form action="/milk/allcows" method="post" onsubmit="return confirm('Вы уверены, что хотите подоить всех коров?');">
            <button type="submit">Доить всех коров</button>
        </form>

        <#if statusMessage??>
            <div class="status-message">${statusMessage}</div>
        </#if>
    </div>
</div>
<a href="/menu" class="back-button">Назад</a>
</body>
</html>