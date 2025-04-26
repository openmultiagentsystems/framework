<?php

namespace Tests;

use ApiPlatform\Symfony\Bundle\Test\ApiTestCase;
use Zenstruck\Foundry\Test\Factories;
use Zenstruck\Foundry\Test\ResetDatabase;

use App\Factory\AgentFactory;
use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class AgentControllerTest extends WebTestCase
{
    use ResetDatabase, Factories;

    private static $client;

    public function setUp(): void
    {
        self::$client = static::createClient();
    }

    public function test_get_agent_check_with_modelId_1_shoulf_return_keys()
    {
        AgentFactory::createOne();

        self::$client->request('GET', '/agent/check?modelId=1');
        $res = self::$client->getResponse();

        $resDecoded = json_decode($res->getContent(), true);
        $data = $resDecoded[0];

        $this->assertIsArray($resDecoded);
        $this->assertCount(3, $data);
    }
}

