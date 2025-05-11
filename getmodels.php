<?php

$modelsPaths = [
    __DIR__ . '/multiagent_models/',
];

$db = [];
function rd($path, $db)
{
    $files = [
        '.',
        '..',
        'Dockerfile',
        '__pycache__',
        'sugar-map.txt',
        'py',
        'agent_handler.py',
        'agenthandler.nls',
        'netlogo.log',
        'main.py'
    ];

    $platforms = array_diff(scandir($path), ['.', '..']);
    $folderName = array_pop($platforms);

    $models = array_diff(scandir($path . $folderName), $files);
    foreach ($models as $model) {
        $r = array_diff(scandir($path . $folderName . '/' . $model), $files);
        $db[] = array_pop($r);
    }
}

rd($modelsPaths[0], $db);
