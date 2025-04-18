<?php

namespace App\Utils;

use App\Repository\AgentRepository;

class MoveToM2 implements RoutingStrategy
{
    const M2_MODEL_ID = 2;

    public function __construct(private AgentRepository $agents)
    {}

    public function move($data)
    {
        return $this->agents->update($data, self::M2_MODEL_ID);
    }
}