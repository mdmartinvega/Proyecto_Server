<?php

namespace App\Controller;

use App\Entity\Message;
use App\Repository\MessageRepository;
use App\Repository\UserRepository;
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
     *      methods={"GET"},
     *      requirements={
     *          "id": "\d+"
     * )
     */

    // public function index(MessageNormalizer $messageNormalizer, MessageRepository $messageRepository): Response
    // {
    // //    $user = $this->getUser();
    //    $result = $messageRepository->findAll();

    //     $data = [];

    //     foreach ($result as $message) {
    //         $data[]= $messageNormalizer->messageNormalizer($message);
    //     }

    //     return $this->json($data);
    // }

    /**
     * @Route(
     *      "/{id}", 
     *      name="addBuddy",
     *      methods={"POST"},
     *      requirements={
     *          "id": "\d+"
     * )
     */
    public function add(
        Request $request,
        EntityManagerInterface $entityManager,
        MessageRepository $messageRepository,
        ValidatorInterface $validator,
        MessageNormalizer $messageNormalizer,
        UserRepository $userRepository
    ): Response {
        // Necesitas un usuario autenticado, remitente (sender), que será el asociado al token JWT que debes enviar a este endpoint.
        // Recuperas el usuario del token con el método $this->getUser();
        // $message->setSender($this->getUser());

        // Para el receptor, necesitamos el id del usuario (receiver_id) que debe recibir el mensaje.
        // Instanciamos el usuario receptor:
        // $receiver = $userRepository->find($data['receiver_id']);
        // $message->setReceiver($receiver);

        $data = json_decode($request->getContent(), true);
        // dump($data);
        // dump($data['name']);
        // die();

        $message = new Message();

        $message->setMessage($data['message']);

        $sender = $userRepository->findOneBy(['email' => $data['sender']]);
        $message->setSender($sender);

        $receiver = $userRepository->find($data['receiver']);
        $message->setReceiver($receiver);
        
        $message->setCreatedAt(new \DateTimeImmutable());


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