<?php

namespace App\DataFixtures;

use App\Entity\Models;
use App\Entity\ModelsTypes;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {

        $tmp = new Models();
        $tmp->setName('m1');
        $manager->persist($tmp);

        $tmp = new Models();
        $tmp->setName('m2');
        $manager->persist($tmp);

        $tmp = new ModelsTypes();
        $tmp->setName('netlogo');
        $manager->persist($tmp);

        $manager->flush();
    }
}
