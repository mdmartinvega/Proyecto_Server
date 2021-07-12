<?php

namespace App\Service;

use App\Entity\Message;
use Symfony\Component\HttpFoundation\UrlHelper;

class MessageNormalizer {

    private $urlHelper;
    public function __construct(UrlHelper $constructorDeUrl)
    {
        $this->urlHelper = $constructorDeUrl;
        
    }
    /**
     * Normalize a message.
     * 
     * @param Message $message
     * 
     * @return array|null
     */
    public function messageNormalizer (Message $message): ?array {
        
        return [
            'id' => $message->getId(),
            'message' => $message->getMessage(),
            'sender' => $message->getSender(),
            'receiver' => $message->getReceiver(),
            'createdAt' => $message->getCreatedAt()
        ];
    }
}