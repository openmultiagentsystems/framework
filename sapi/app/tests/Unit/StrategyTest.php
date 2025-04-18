<?php

namespace Tests;

use Exception;
use PHPUnit\Framework\TestCase;

use App\Utils\MoveToM1;
use App\Utils\RoutingContext;
use App\Utils\StrategyList;

use App\Tests\FakeStrategy;

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
        $strategy = StrategyList::get('m1');
        $this->assertInstanceOf(MoveToM1::class, $strategy);
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
        StrategyList::get('m12');
    }
}