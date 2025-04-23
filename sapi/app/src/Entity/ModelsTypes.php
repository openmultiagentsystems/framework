<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use App\Repository\ModelsTypesRepository;

#[ORM\Entity(repositoryClass: ModelsTypesRepository::class)]
#[ORM\Table(name: "models_types")]
class ModelsTypes
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: "smallint")]
    private ?int $id = null;

    #[ORM\Column(type: "string", length: 30)]
    private string $name;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function setName(string $name): void
    {
        $this->name = $name;
    }

    public function getName(): string
    {
        return $this->name;
    }
}
