<?php

namespace App\Tests\Integration;

use ApiPlatform\Symfony\Bundle\Test\ApiTestCase;
use Zenstruck\Foundry\Test\Factories;
use Zenstruck\Foundry\Test\ResetDatabase;

/* use App\Factory\AgentFactory; */

class RoutingControllerTest extends ApiTestCase
{
    use ResetDatabase, Factories;

    private static $client;

    public function setUp(): void
    {
        self::$client = static::createClient();
    }

    public function test_post(): void
    {
        self::$client->request('POST', '/routing/agent', [
            'headers' => ['content' => 'application/json'],
            'body' => json_encode([
                'agent_id' => 1,
                'data' => '[1 2 3]',
                'path' => '',
                'model_name' => 'm1',
            ]),
        ]);

        $this->assertResponseIsSuccessful();
    }
}
