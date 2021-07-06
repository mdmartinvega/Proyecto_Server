<?php

namespace App\Service;

use App\Entity\City;
use Symfony\Component\HttpFoundation\UrlHelper;

class CityNormalizer {

    private $urlHelper;
    public function __construct(UrlHelper $constructorDeUrl)
    {
        $this->urlHelper = $constructorDeUrl;
        
    }
    /**
     * Normalize a city.
     * 
     * @param City $city
     * 
     * @return array|null
     */
    public function cityNormalizer (City $city): ?array {
        
        return [
            'id' => $city->getId(),
            'name' => $city->getName()
        ];
    }
}