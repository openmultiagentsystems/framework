<?php

namespace App\Tests;

use App\Utils\RoutingStrategy;

class FakeStrategy implements RoutingStrategy {
    public function move(array $data): array {
        return [];
    }
}
