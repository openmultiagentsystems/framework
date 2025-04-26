<?php

namespace App\Repository;

use App\Entity\Agent;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Agent>
 */
class AgentRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Agent::class);
    }

    /**
     * Updates all the records from the agents table
     * setting the processed from false to true
     * 
     * @param $modelId: the model_id (m1, m2 etc..)
     * @return all updated records 
     */
    public function updateUnprocessed(int $modelId)
    {
        $conn = $this->getEntityManager()->getConnection();

        $sql = '
            UPDATE agents
            SET processed = :isProcessed
            WHERE processed = :notProcessed
            AND model_id = :modelId
            RETURNING id, data, path
        ';

        $stmt = $conn->prepare($sql);
        $stmt->bindValue('isProcessed', 1);
        $stmt->bindValue('notProcessed', 0);
        $stmt->bindValue('modelId', $modelId);

        $result = $stmt->executeQuery();

        return $result->fetchAllNumeric();
    }

    /**
     * Updates all the records from the agents table
     * setting the processed from false to true
     * 
     * @param $modelId: the model_id (m1, m2 etc..)
     * @return all updated records 
     */
    public function update(array $data, $newAgentId): array
    {
        $conn = $this->getEntityManager()->getConnection();

        $sql = '
            UPDATE agents
            SET data = :data,
            path = :path,
            processed = false,
            model_id = :newAgentId 
            WHERE id = :agentId
        ';

        $stmt = $conn->prepare($sql);
        $stmt->bindValue('data', $data['data']);
        $stmt->bindValue('path', $data['path']);
        $stmt->bindValue('newAgentId', $newAgentId);
        $stmt->bindValue('agentId', $data['agent_id']);

        $result = $stmt->executeQuery();

        return $result->fetchAllAssociative();
    }
}
