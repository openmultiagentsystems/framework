<?php

namespace Tests;

use PHPUnit\Framework\TestCase;

use App\Tests\FakeStrategy;
use App\Utils\RoutingContext;


class StrategyTest extends TestCase
{
    public function setUp(): void
    {
    }

    public function testIfMoveReturnsAnArray()
    {
        $strategy = new FakeStrategy();
        $context = new RoutingContext($strategy);

        $this->assertIsArray($context->move([]));
    }
}