<?php

namespace App\Controller;

use App\Utils\RoutingContext;
use App\Utils\StrategyList;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class RoutingController extends AbstractController
{
    public function __construct(private StrategyList $strategyList) {}

    #[Route('/routing', name: 'app_routing')]
    public function index(): Response
    {
        return $this->render('routing/index.html.twig', [
            'controller_name' => 'RoutingController',
        ]);
    }

    #[Route('/routing/agent', name: 'app_routing_agent', methods: ['POST'])]
    public function route(Request $req): Response
    {
        $data = $req->toArray();
        $modelName = $req->toArray()['model_name'];
        $strategy = $this->strategyList->get($modelName);

        $context = new RoutingContext($strategy);
        $context->move($data);

        return $this->json([
            'error' => false,
            'data' => []
        ]);
    }
}
