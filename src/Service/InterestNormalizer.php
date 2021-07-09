<?php

namespace App\Service;

use App\Entity\Interest;
use Symfony\Component\HttpFoundation\UrlHelper;

class InterestNormalizer {

    private $urlHelper;
    public function __construct(UrlHelper $constructorDeUrl)
    {
        $this->urlHelper = $constructorDeUrl;
        
    }
    /**
     * Normalize an interest.
     * 
     * @param Interest $interest
     * 
     * @return array|null
     */
    public function interestNormalizer (Interest $interest): ?array {
        
        return [
            'id' => $interest->getId(),
            'tag' => $interest->getTag()
        ];
    }
}