<?php

namespace Tests;

use Exception;
use PHPUnit\Framework\TestCase;

use App\Utils\MoveToM1;
use App\Utils\RoutingContext;
use App\Utils\StrategyList;

use App\Tests\FakeStrategy;
use App\Utils\MoveToM2;

/**
 * Test case for the strategy execution.
 *
 * This test ensures that the strategy executes as expected under
 * certain conditions.
 *
 * @return void
 */
class StrategyTest extends TestCase
{
    /**
     * Tests that the move method returns an array.
     *
     * @throws Throwable if an error occurs during testing
     */
    public function test_move_method_should_return_an_array()
    {
        $strategy = new FakeStrategy();
        $context = new RoutingContext($strategy);

        $this->assertIsArray($context->move([]));
    }

    /**
     * Tests that the StrategyList returns a MoveToM1 strategy.
     *
     * @throws Throwable if an error occurs during testing
     */
    public function test_strategy_list_should_return_correct_strategy()
    {
        $m1 = $this->createMock(MoveToM1::class);
        $m2 = $this->createMock(MoveToM2::class);

        $strategyList = new StrategyList($m1, $m2);

        $this->assertSame($m1, $strategyList->get('m1'));
        $this->assertSame($m2, $strategyList->get('m2'));
    }

    /**
     * 
     * Tests that the StrategyList throws an exception for a non-existent model.
     *
     * @throws Throwable if an error occurs during testing
     */
    public function test_strategy_list_fails_because_model_name_does_not_exist()
    {
        $this->expectException(\Exception::class);

        $strategyList = new StrategyList(
            $this->createMock(MoveToM1::class),
            $this->createMock(MoveToM2::class)
        );

        $strategyList->get('invalid');
    }
}