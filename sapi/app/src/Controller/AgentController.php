<?php

namespace App\Controller;

use App\Repository\AgentRepository;
use App\Request\AgentCheckRequest;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpKernel\Attribute\MapQueryParameter;
use Symfony\Component\Routing\Attribute\Route;


final class AgentController extends AbstractController
{
    #[Route('/agent', name: 'app_agent')]
    public function index(): Response
    {
        return $this->render('agent/index.html.twig', [
            'controller_name' => 'AgentController',
        ]);
    }

    #[Route('/agent/check', name: 'app_agent_check', methods: ['GET'])]
    public function checkAgents(
        #[MapQueryParameter] int $modelId,
        AgentRepository $agents
    ): Response
    {
        $processedAgents = $agents->updateUnprocessed($modelId);
        return $this->json($processedAgents);
    }
}
