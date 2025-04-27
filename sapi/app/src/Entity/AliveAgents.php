<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use DateTimeInterface;

#[ORM\Entity]
#[ORM\Table(name: "alive_agents")]
class AliveAgents
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: "bigint")]
    private ?int $id = null;

    #[ORM\Column(type: "integer")]
    private int $agentId;

    #[ORM\Column(type: "string", length: 255)]
    private string $modelId;

    #[ORM\Column(type: 'datetime_immutable', options: ['default' => 'CURRENT_TIMESTAMP'])]
    private \DateTimeInterface $created_at;

    #[ORM\Column(type: 'datetime_immutable', options: ['default' => 'CURRENT_TIMESTAMP'])]
    private \DateTimeInterface $updated_at;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getAgentId(): int
    {
        return $this->agentId;
    }

    public function setAgentId(int $agentId): self
    {
        $this->agentId = $agentId;

        return $this;
    }

    public function getModelId(): string
    {
        return $this->modelId;
    }

    public function setModelId(string $modelId): self
    {
        $this->modelId = $modelId;

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
