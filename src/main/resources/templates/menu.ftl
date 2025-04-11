<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Меню</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            background: url('/static/cow_menu.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: Arial, sans-serif;
            color: white;
        }

        .menu-container {
            position: absolute;
            left: 40px;
            top: 50%;
            transform: translateY(-50%);
            width: 500px;
            height: 850px;
            background-color: #FDE0E9;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: start;
            padding-top: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            border-radius: 18px;
        }

        .menu-title {
            font-size: 43px;
            color: #FF0000;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .menu-button {
            width: 346px;
            height: 66px;
            margin-bottom: 17px;
            background-color: #FB5BA8;
            color: white;
            font-size: 18px;
            font-weight: bold;
            text-align: center;
            line-height: 66px;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.15);
            transition: background-color 0.3s ease;
        }

        .menu-button:hover {
            background-color: #E04A9C;
        }


    </style>
</head>
<body>
<div class="menu-container">
    <div class="menu-title">Меню</div>
    <button class="menu-button" onclick="window.location.href='/add'">Добавить корову</button>
    <button class="menu-button" onclick="window.location.href='/all'">Показать всех коров</button>
    <button class="menu-button" onclick="window.location.href='/milk'">Доить коров</button>
    <button class="menu-button" onclick="window.location.href='/products'">Производство продукции</button>
    <button class="menu-button" onclick="window.location.href='/distribute'">Распределить продукцию</button>
    <button class="menu-button" onclick="window.location.href='/warehouse'">Показать содержимое склада</button>
    <button class="menu-button" onclick="window.location.href='/dance'">Почухать корову</button>
    <button class="menu-button" onclick="window.location.href='/delete'">Удалить продукт из склада</button>
    <a class="menu-button" onclick="window.location.href='/'">Выйти</a>
</div>
</body>
</html>