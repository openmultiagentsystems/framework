<?php

namespace App\Utils;

use App\Repository\AgentRepository;

class MoveToM1 implements RoutingStrategy
{
    const M1_MODEL_ID = 1;

    public function __construct(private AgentRepository $agents)
    {}

    public function move($data)
    {
        return $this->agents->update($data, self::M1_MODEL_ID);
    }
}