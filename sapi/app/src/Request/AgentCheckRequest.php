<?php

namespace App\Request;

use App\Request\GenericRequest;
use Symfony\Component\Validator\Constraints\NotBlank;

class AgentCheckRequest extends GenericRequest
{
    #[NotBlank()]
    protected $modelName;
}