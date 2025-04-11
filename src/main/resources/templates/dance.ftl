<!DOCTYPE html>
<html lang="ru">
<head>
    <title>Видео на весь экран</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
            background-color: black;
        }
        video {
            width: 100vw;
            height: 100vh;
            object-fit: cover;
        }
    </style>
</head>
<body>
<video autoplay loop controls>
    <source src="static/danceCow.mp4" type="video/mp4">
    Ваш браузер не поддерживает видео.
</video>
</body>
</html>