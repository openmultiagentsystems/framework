<?php

namespace App\Utils;

use Exception;

use App\Utils\MoveToM1;
use App\Utils\MoveToM2;

class StrategyList
{
    public function __construct(
        private MoveToM1 $moveToM1,
        private MoveToM2 $moveToM2
    )
    {}

    public function get(string $name): RoutingStrategy
    {
        return match($name) {
            'm1' => $this->moveToM1,
            'm2' => $this->moveToM2,
            default => throw new Exception('strategy name not found.')
        };
    }
}
