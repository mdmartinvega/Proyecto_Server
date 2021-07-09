<?php

namespace App\Service;

use App\Entity\Language;
use Symfony\Component\HttpFoundation\UrlHelper;

class LanguageNormalizer {

    private $urlHelper;
    public function __construct(UrlHelper $constructorDeUrl)
    {
        $this->urlHelper = $constructorDeUrl;
        
    }
    /**
     * Normalize a language.
     * 
     * @param Language $language
     * 
     * @return array|null
     */
    public function languageNormalizer (Language $language): ?array {
        
        return [
            'id' => $language->getId(),
            'name' => $language->getName()
        ];
    }
}