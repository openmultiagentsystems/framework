<?php

namespace App\Controller;

use App\Utils\RoutingContext;
use App\Utils\StrategyList;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class RoutingController extends AbstractController
{
    #[Route('/routing', name: 'app_routing')]
    public function index(): Response
    {
        return $this->render('routing/index.html.twig', [
            'controller_name' => 'RoutingController',
        ]);
    }

    #[Route('/routing/agent', name: 'app_routing_agent', methods: ['POST'])]
    public function route(): Response
    {
        // $strategy = StrategyList::get();
        // $routingContext = new RoutingContext($strategy);

        return $this->json([
            'data' => []
        ]);
    }

}
