<?php

namespace App\Utils;

use Exception;

use App\Utils\MoveToM1;
use App\Utils\MoveToM2;

class StrategyList
{
    public static function get(string $name): RoutingStrategy
    {
        $strategies = [
            'm1' => new MoveToM1,
            'm2' => new MoveToM2,
        ];

        $models = array_keys($strategies);
        if(!in_array($name, $models)) {
            throw new Exception('$name does not exist in your strategy list. please check for a typo or implement it.');
        }

        return $strategies[$name];
    }
}
