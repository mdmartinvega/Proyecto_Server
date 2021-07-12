<?php

namespace App\Controller;

use App\Entity\Message;
use App\Repository\MessageRepository;
use App\Service\MessageNormalizer;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Validator\Validator\ValidatorInterface;

/**
 * @Route("/api/messages", name="api_messages_")
 */

class ApiMessagesController extends AbstractController
{
     /**
     * @Route(
     *      "/{id}", 
     *      name="cget",
     *      methods={"GET"})
     */

    public function index(MessageNormalizer $messageNormalizer, MessageRepository $messageRepository): Response
    {
    //    $user = $this->getUser();
       $result = $messageRepository->findAll();

        $data = [];

        foreach ($result as $message) {
            $data[]= $messageNormalizer->messageNormalizer($message);
        }

        return $this->json($data);
    }

    /**
     * @Route(
     *      "", 
     *      name="addBuddy",
     *      methods={"POST"},
     * )
     */
    public function add(
        Request $request,
        EntityManagerInterface $entityManager,
        MessageRepository $messageRepository,
        ValidatorInterface $validator,
        MessageNormalizer $messageNormalizer
    ): Response {

        $data = json_decode($request->getContent(), true);
        // dump($data);
        // dump($data['name']);
        // die();

        $message = new Message();

        $message->setMessage($data['message']);
        $message->setSender($data['sender']);
        $message->setReceiver($data['receiver']);
        $message->setCreatedAt($data['createdAt']);


       $errors = $validator->validate($message);
        
       if(count($errors) > 0) {
           $dataErrors = [];

           /** @var \Symfony\Component\Validator\ConstraintViolation $error */
           foreach($errors as $error) {
               $dataErrors[] = $error->getMessage();
           }

           return $this->json([
               'status' => 'error',
               'data' => [
                   'errors' => $dataErrors
                   ]
               ],
               Response::HTTP_BAD_REQUEST);
       } 

        $entityManager->persist($message);
        $entityManager->flush($message);

        return $this->json(
            $messageNormalizer->messageNormalizer($message),
            Response::HTTP_CREATED
        );
    }
}