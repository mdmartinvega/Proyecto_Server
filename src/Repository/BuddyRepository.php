<?php

namespace App\Repository;

use App\Entity\Buddy;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Buddy|null find($id, $lockMode = null, $lockVersion = null)
 * @method Buddy|null findOneBy(array $criteria, array $orderBy = null)
 * @method Buddy[]    findAll()
 * @method Buddy[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class BuddyRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Buddy::class);
    }

    // /**
    //  * @return Buddy[] Returns an array of Buddy objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('b')
            ->andWhere('b.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('b.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Buddy
    {
        return $this->createQueryBuilder('b')
            ->andWhere('b.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
