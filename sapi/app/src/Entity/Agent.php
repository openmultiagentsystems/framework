<?php

namespace App\Entity;

use App\Repository\AgentRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Table(name: 'agents')]
#[ORM\Entity(repositoryClass: AgentRepository::class)]
class Agent
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'bigint')]
    private ?int $id = null;

    #[ORM\Column(type: 'smallint')]
    private ?int $type_id = null;

    #[ORM\Column(type: 'bigint')]
    private ?int $model_id = null;

    #[ORM\Column(type: 'string', length: 255)]
    private string $data;

    #[ORM\Column(type: 'text')]
    private string $path;

    #[ORM\Column(type: 'string', length: 255, options: ['default' => ''])]
    private string $asl_file_path = '';

    #[ORM\Column(type: 'boolean', options: ['default' => false])]
    private bool $processed = false;

    #[ORM\Column(type: 'datetime_immutable', options: ['default' => 'CURRENT_TIMESTAMP'])]
    private \DateTimeInterface $created_at;

    #[ORM\Column(type: 'datetime_immutable', options: ['default' => 'CURRENT_TIMESTAMP'])]
    private \DateTimeInterface $updated_at;

    public function getId(): ?int
    {
        return $this->id;
    }
    public function getTypeId(): ?int
    {
        return $this->type_id;
    }

    public function setTypeId(int $type_id): static
    {
        $this->type_id = $type_id;
        return $this;
    }

    public function getModelId(): ?int
    {
        return $this->model_id;
    }

    public function setModelId(int $model_id): static
    {
        $this->model_id = $model_id;
        return $this;
    }

    public function getData(): ?string
    {
        return $this->data;
    }

    public function setData(string $data): static
    {
        $this->data = $data;
        return $this;
    }

    public function getPath(): ?string
    {
        return $this->path;
    }

    public function setPath(string $path): static
    {
        $this->path = $path;
        return $this;
    }

    public function getAslFilePath(): ?string
    {
        return $this->asl_file_path;
    }

    public function setAslFilePath(string $asl_file_path): static
    {
        $this->asl_file_path = $asl_file_path;
        return $this;
    }

    public function isProcessed(): bool
    {
        return $this->processed;
    }

    public function setProcessed(bool $processed): static
    {
        $this->processed = $processed;
        return $this;
    }

    public function getCreatedAt(): ?\DateTimeInterface
    {
        return $this->created_at;
    }

    public function setCreatedAt(\DateTimeInterface $created_at): static
    {
        $this->created_at = $created_at;
        return $this;
    }

    public function getUpdatedAt(): ?\DateTimeInterface
    {
        return $this->updated_at;
    }

    public function setUpdatedAt(\DateTimeInterface $updated_at): static
    {
        $this->updated_at = $updated_at;
        return $this;
    }
}
