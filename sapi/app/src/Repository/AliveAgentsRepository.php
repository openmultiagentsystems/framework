<?php

namespace App\Repository;

use App\Entity\AliveAgents;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\Persistence\ObjectManager;

/**
 * @extends ServiceEntityRepository<AliveAgents>
 */
class AliveAgentsRepository extends ServiceEntityRepository
{
    private int $batchSize = 30;
    private ObjectManager $em;

    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, AliveAgents::class);
        $this->em = $registry->getManager();
    }

    public function batchInsert(array $data)
    {
        $ids = explode(',', $data['agent_id']);
        foreach ($ids as $i => $id) {
            $agent = new AliveAgents();
            $agent->setAgentId($id);
            $agent->setModelId($data['model_id']);

            if (($i % $this->batchSize) === 0) {
                $this->em->flush();
                $this->em->clear();
            }
        }

        $this->em->flush();
        $this->em->clear();
    }


    //    /**
    //     * @return AliveAgents[] Returns an array of AliveAgents objects
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

    //    public function findOneBySomeField($value): ?AliveAgents
    //    {
    //        return $this->createQueryBuilder('a')
    //            ->andWhere('a.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->getQuery()
    //            ->getOneOrNullResult()
    //        ;
    //    }
}
