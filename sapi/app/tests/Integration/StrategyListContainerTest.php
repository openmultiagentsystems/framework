<?php

namespace Tests;

use App\Utils\MoveToM1;
use App\Utils\MoveToM2;

use App\Utils\StrategyList;

use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

/**
 * Test case for the strategy execution.
 *
 * This test ensures that the strategy executes as expected under
 * certain conditions.
 *
 * @return void
 */
class StrategyListContainerTest extends KernelTestCase
{
    public function test_DI()
    {
        self::bootKernel();

        $container = static::getContainer();
        $strategyList = $container->get(StrategyList::class);

        $m1 = $strategyList->get('m1');
        $m2 = $strategyList->get('m2');

        $this->assertInstanceOf(StrategyList::class, $strategyList);
        $this->assertInstanceOf(MoveToM1::class, $m1);
        $this->assertInstanceOf(MoveToM2::class, $m2);
    }
}