<?php

namespace App\Controller;

use App\Repository\AgentRepository;
use App\Repository\AliveAgentsRepository;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
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

    #[Route('/agents/check', name: 'app_agent_check', methods: ['GET'])]
    public function checkAgents(
        #[MapQueryParameter] int $modelId,
        AgentRepository $agents
    ): Response {
        $processedAgents = $agents->updateUnprocessed($modelId);
        return $this->json($processedAgents);
    }

    #[Route('/agents/alive', name: 'app_agent_alive', methods: ['POST'])]
    public function aliveAgents(
        Request $req,
        AliveAgentsRepository $aliveAgents
    ): Response {
        $data = $req->toArray();
        $aliveAgents->batchInsert($data);
        return $this->json([true]);
    }
}
