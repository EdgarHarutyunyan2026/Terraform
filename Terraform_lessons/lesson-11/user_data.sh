#!/bin/bash
yum -y update
yum -y install httpd

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Build by Power of Terraform</title>
    <style>
        body {
            background-color: black;
            color: gold;
            font-family: Arial, sans-serif;
            text-align: center;
            padding-top: 50px;
        }
        h1 {
            font-size: 50px;
            margin-bottom: 20px;
        }
        .ip-address {
            font-size: 25px;
            margin-top: 30px;
        }
    </style>
</head>
<body>

    <h1>Build by Power of Terraform</h1>
    <div class="ip-address" id="ip-address">
        Загружается IP-адрес...
    </div>

    <script>
        // Функция для получения IP-адреса
        async function fetchIP() {
            try {
                const response = await fetch('https://api.ipify.org?format=json');
                const data = await response.json();
                document.getElementById('ip-address').innerText = `IP-адрес вашего сервера: ${data.ip}`;
            } catch (error) {
                document.getElementById('ip-address').innerText = 'Не удалось получить IP-адрес';
            }
        }

        // Вызов функции для получения IP-адреса при загрузке страницы
        fetchIP();
    </script>

</body>
</html>
EOF

sudo systemctl start httpd
sudo systemctl enable httpd
