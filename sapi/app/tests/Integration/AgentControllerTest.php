<?php

namespace Tests;

use App\Factory\AgentFactory;
use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;
use Zenstruck\Foundry\Test\Factories;
use Zenstruck\Foundry\Test\ResetDatabase;

class AgentControllerTest extends WebTestCase
{
    use ResetDatabase, Factories;

    private static $client;

    public function setUp(): void
    {
        self::$client = static::createClient();
    }

    public function testExample()
    {
        $agent = AgentFactory::createOne();

        self::$client->request('GET', '/agent/check?modelId=1');
        $res = self::$client->getResponse();

        $resData = json_decode($res->getContent());

        $this->assertIsArray($resData);
        $this->assertCount(1, $resData);
    }
}