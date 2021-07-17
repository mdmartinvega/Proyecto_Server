<?php

namespace App\EventListener;

use Lexik\Bundle\JWTAuthenticationBundle\Event\JWTCreatedEvent;
use Symfony\Component\Security\Core\Authentication\Token\Storage\UsageTrackingTokenStorage;

class JWTCreatedListener 
{
    private $tokenStorage;

    public function __construct(
        UsageTrackingTokenStorage $tokenStorage,
        )
    {
        $this->tokenStorage = $tokenStorage;
    }
    /** 
     * @param JWTCreatedEvent $event
     *
     * @return void
     */
    public function onJWTCreated(JWTCreatedEvent $event)
    {
        $payload = $event->getData();
        /**  @var \App\Entity\User $user */
        $user = $this->tokenStorage->getToken()->getUser();

        $payload['user'] = [
            'id' => $user->getId(),
            'name' => $user->getName(),
        ];

        $event->setData($payload);
    }
}