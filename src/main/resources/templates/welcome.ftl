<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Начальная страница</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            background: url('/static/background.jpg ') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: flex-start;
            padding-left: 6%;
            overflow: hidden;
        }

        .title {
            font-size: 36px;
            color: white;
            font-weight: bold;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);
            margin-bottom: 10px;
        }

        .subtitle {
            font-size: 28px;
            color: white;
            font-weight: normal;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);
            margin-bottom: 20px;
        }

        .button {
            background-color: #f17bb2;
            border: none;
            color: white;
            padding: 15px 30px;
            font-size: 18px;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
            transition: background-color 0.3s;
        }

        .button:hover {
            background-color: #db4690;
        }
    </style>
</head>

<body>
<div class="title">ДОБРО ПОЖАЛОВАТЬ</div>
<div class="subtitle">В ФЕРМУ КАТЮШКИ</div>
<a href="/menu" class="button">Продолжить</a>
</body>

</html>