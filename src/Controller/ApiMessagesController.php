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
     *      "/receivedMessages/{id}", 
     *      name="getMessage",
     *      methods={"GET"},
     *      requirements={
     *          "id": "\d+"
     *      }
     * )
     */

     public function getMessageByReceiver(int $id, 
        MessageRepository $messageRepository, 
        MessageNormalizer $messageNormalizer): Response
    {
        $result = $messageRepository->findMessagesByReceiver($id);

        $data = [];
        

        foreach ($result as $message) {
            array_push($data, $messageNormalizer->messageNormalizer($message));
        }

        $resultado = [
            "total" => count($data),
            "messages" => $data];

        return $this->json($resultado);
    }

    /**
     * @Route(
     *      "/sentMessages/{id}", 
     *      name="sentMessage",
     *      methods={"GET"},
     *      requirements={
     *          "id": "\d+"
     *      }
     * )
     */

//     public function getMessageBySender(int $id, 
//     MessageRepository $messageRepository, 
//     MessageNormalizer $messageNormalizer): Response
// {
//     $result = $messageRepository->findMessagesBySender($id);

//     $data = [];
    

//     foreach ($result as $message) {
//         array_push($data, $messageNormalizer->messageNormalizer($message));
//     }

//     $resultado = [
//         "total" => count($data),
//         "messages" => $data];

//     return $this->json($resultado);
// }

    /**
     * @Route(
     *      "/{id}", 
     *      name="sendMessage",
     *      methods={"POST"},
     *      requirements={
     *          "id": "\d+"
     *      }
     * )
     */
    public function addMessage(
        Request $request,
        EntityManagerInterface $entityManager,
        MessageRepository $messageRepository,
        ValidatorInterface $validator,
        MessageNormalizer $messageNormalizer,
        UserRepository $userRepository
    ): Response {

        $data = json_decode($request->getContent(), true);

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