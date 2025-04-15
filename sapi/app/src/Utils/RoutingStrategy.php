<?php

namespace App\Utils;

interface RoutingStrategy {
    public function move(array $data): array;
}