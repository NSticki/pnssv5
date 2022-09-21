<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="<?= app()->route->getUrl('/css/style.css') ?>">
    <title>Телефонный узел связи</title>
</head>
<body>
<header>
        <nav>
            <div id="mainmenu">
            <div class="mainMenuItem">
                <a href="<?= app()->route->getUrl('/studyrooms') ?>">Главная</a>
            </div>
            <?php
            if (!app()->auth::check()):
                ?>
                <div class="mainMenuItem">
                    <a href="<?= app()->route->getUrl('/studyrooms/login') ?>">Вход</a>
                </div>

            <?php
            else:
                ?>
                <div class="mainMenuItem">
                    <a href="<?= app()->route->getUrl('/studyrooms/logout') ?>">Выход</a>
                </div>
            <?php
            endif;
            ?>
            </div>
        </nav>
</header>
<main id="workArea">
    <?= $content ?? '' ?>
</main>
<footer>
    <div>
    </div>
</footer>
</body>
</html>
