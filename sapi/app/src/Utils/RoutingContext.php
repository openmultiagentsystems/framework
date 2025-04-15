<?php

namespace App\Utils;

use App\Utils\RoutingStrategy;

class RoutingContext {
    private RoutingStrategy $strategy;

    public function __construct(RoutingStrategy $strategy) {
        $this->strategy = $strategy;
    }

    public function setStrategy(RoutingStrategy $strategy) {
        $this->strategy = $strategy;
    }

    public function move(array $data): array {
        return $this->strategy->move($data);
    }
}