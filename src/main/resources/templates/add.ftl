<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Добавить корову</title>
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
            font-size: 22px;
            color: black;
            margin-bottom: 10px;
            font-weight: bold;
            text-align: center;
            width: 100%;
        }

        .add-box input {
            width: 100%;
            height: 35px;
            margin-bottom: 20px;
            border: none;
            border-radius: 8px;
            padding-left: 10px;
            font-size: 18px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .add-box button {
            width: 200px;
            height: 40px;
            margin-top: 20px;
            background-color: #f118a4;
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            transition: background-color 0.3s ease;
        }

        .add-box button:hover {
            background-color: #e01292;
        }

        .success-popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #ffffff;
            border-radius: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            padding: 30px;
            text-align: center;
            color: #f118a4;
            z-index: 10;
        }

        .success-popup h3 {
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: bold;
        }

        .success-popup button {
            width: 100px;
            height: 40px;
            background-color: #f118a4;
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .success-popup button:hover {
            background-color: #e01292;
        }
    </style>
</head>

<body>
<div class="add-container">
    <div class="add-box">
        <h2>Тут можно добавить коровку</h2>
        <form id="cowForm" action="/add" method="post">
            <label for="cowMilk">Введите количество молока (литры/в день):</label>
            <input type="text" id="cowMilk" name="cowMilk" placeholder="Например: 24.5" required>
            <button type="submit">Добавить</button>
        </form>
    </div>
</div>

<div class="success-popup" id="successPopup">
    <h3>Мы успешо добавили коровку!!!!</h3>
    <button onclick="goToMenu()">Ура</button>
</div>

<script>
    const cowForm = document.getElementById('cowForm');
    const cowMilkInput = document.getElementById('cowMilk');
    const successPopup = document.getElementById('successPopup');

    cowForm.addEventListener('submit', function (event) {
        const cowMilkValue = cowMilkInput.value.trim();
        if (!/^\d+(\.\d+)?$/.test(cowMilkValue) || parseFloat(cowMilkValue) <= 0) {
            event.preventDefault();
            alert('Количество молока должно быть положительным числом');
            return;
        }
        document.querySelector('.add-box').style.display = 'none';
        successPopup.style.display = 'block';
    });

    function goToMenu() {
        window.location.href = '/menu';
    }
</script>
</body>
</html>