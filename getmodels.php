<?php

$modelsPaths = [
    __DIR__ . '/models/',
];

$db = [];
function rd($path, $db)
{
    $platforms = array_diff(scandir($path), ['.', '..']);
    $folderName = array_pop($platforms);

    $models = array_diff(scandir($path . $folderName), ['.', '..']);
    foreach ($models as $model) {
        $r = array_diff(scandir($path . $folderName . '/' . $model), ['.', '..']);
    }
}

rd($modelsPaths[0], $db);
