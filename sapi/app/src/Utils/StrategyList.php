<?php

namespace App\Utils;

use App\Utils\MoveToM1;
use App\Utils\MoveToM2;

class StrategyList
{
    public static function get(): array
    {
        return [
            'm1' => new MoveToM1,
            'm2' => new MoveToM2,
        ];
    }
}