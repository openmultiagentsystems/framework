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

        return $result->fetchAllAssociative();
    }

    //    /**
    //     * @return Agent[] Returns an array of Agent objects
    //     */
    //    public function findByExampleField($value): array
    //    {
    //        return $this->createQueryBuilder('a')
    //            ->andWhere('a.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->orderBy('a.id', 'ASC')
    //            ->setMaxResults(10)
    //            ->getQuery()
    //            ->getResult()
    //        ;
    //    }

    //    public function findOneBySomeField($value): ?Agent
    //    {
    //        return $this->createQueryBuilder('a')
    //            ->andWhere('a.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->getQuery()
    //            ->getOneOrNullResult()
    //        ;
    //    }
}
