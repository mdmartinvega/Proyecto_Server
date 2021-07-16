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
            'senderId' => $message->getSender()->getId(),
            'senderName' => $message->getSender()->getName(),
            'receiverId' => $message->getReceiver()->getId(),
            'receiverName' => $message->getReceiver()->getName(),
            'createdAt' => $message->getCreatedAt()
        ];
    }
}