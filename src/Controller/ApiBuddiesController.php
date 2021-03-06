<?php

namespace App\Controller;

use App\Entity\User;
use App\Repository\CityRepository;
use App\Repository\InterestRepository;
use App\Repository\LanguageRepository;
use App\Repository\UserRepository;
use App\Service\CityNormalizer;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Service\UserNormalizer;
use App\Service\InterestNormalizer;
use App\Service\LanguageNormalizer;
use Doctrine\ORM\EntityManagerInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;


/**
 * @Route("/api/buddies", name="api_buddies_")
 */

class ApiBuddiesController extends AbstractController
{

    /**
     * @Route(
     *      "", 
     *      name="getAllBuddies",
     *      methods={"GET"}
     * )
     */

    public function allBuddies(
        User $user,
        UserNormalizer $userNormalizer,
        UserRepository $userRepository): Response
    {
        $result = $userRepository->findAll();

        $data = [];

        foreach ($result as $user) {
            $data[]= $userNormalizer->userNormalizer($user);
        }

        return $this->json($data);
    }

    /**
     * @Route(
     *      "/city/{id}", 
     *      name="cget",
     *      methods={"GET"})
     */
    public function getUsersByCity($id, 
    UserRepository $userRepository, 
    UserNormalizer $userNormalizer, 
    CityRepository $cityRepository,
    CityNormalizer $cityNormalizer,
    ValidatorInterface $validator): Response
    {
        $users = [];
        foreach($userRepository->findUsersByCity($id) as $user) {
            array_push($users, $userNormalizer->userNormalizer($user));
        };

        $buddies = [];
        $users = [];
        foreach($userRepository->findUsersByCity($id) as $user) {
            if (count($user->getRoles()) > 1) {
                array_push($buddies, $userNormalizer->userNormalizer($user));
            } elseif (count($user->getRoles()) === 1) {
                array_push($users, $userNormalizer->userNormalizer($user));
            }
        };


        $city = $cityNormalizer->cityNormalizer($cityRepository->find($id));

        $resultado = [
        "total" =>  count($userRepository->findUsersByCity($id)),
        "city" => $city,
        "buddies" => $buddies,
        "users" => $users
        // "results" => $userRepository->findUsersByRole($roles)
        ];

        $errors = $validator->validate($user);

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

        return $this->json($resultado);

    }

    /**
     * @Route(
     *      "/me",
     *      name="current_user_info",
     *      methods={"GET"},
     *  )
     *  @IsGranted("ROLE_USER")
     */
    public function me(UserNormalizer $userNormalizer): Response
    {
        return $this->json(
            $userNormalizer->userNormalizer($this->getUser())
        );
    }

    // /**
    //  * @Route(
    //  *      "/dashboard/{id}", 
    //  *      name="cget",
    //  *      methods={"GET"},
    //  *      requirements={
    //  *          "id": "\d+"
    //  *      })
    //  */
    // public function getUserByEmail($id, 
    // UserRepository $userRepository, 
    // UserNormalizer $userNormalizer): Response
    // {
    //     $result = $userRepository->findBy(['email' => $id]);

    //     $data = [];

    //     foreach ($result as $user) {
    //         $data[]= $userNormalizer->userNormalizer($user);
    //     }

    //     return $this->json($data);
    // }


    /**
     * @Route(
     *      "/interestsList", 
     *      name="interestslist",
     *      methods={"GET"})
     */
    public function interestsList( 
    InterestRepository $interestRepository, 
    InterestNormalizer $interestNormalizer): Response
    {
        $interests = [];

        foreach($interestRepository->findAll() as $interest) {
            array_push($interests, $interestNormalizer->interestNormalizer($interest));
        };

        return $this->json($interests);

    }

    /**
     * @Route(
     *      "/languagesList", 
     *      name="languages",
     *      methods={"GET"})
     */
    public function languagesList( 
        LanguageRepository $languageRepository, 
        LanguageNormalizer $languageNormalizer): Response
        {
            $languages = [];
    
            foreach($languageRepository->findAll() as $language) {
                array_push($languages, $languageNormalizer->languageNormalizer($language));
            };
    
            return $this->json($languages);
    
        }


    /**
     * @Route(
     *      "/{id}", 
     *      name="get",
     *      methods={"GET"},
     *      requirements={
     *          "id": "\d+"
     *      }
     * )
     */

    public function indexOneUser(
        User $user,
        UserNormalizer $userNormalizer): Response
    {
        return $this->json($userNormalizer->userNormalizer($user));
    }

    /**
     * @Route(
     *      "/addBuddy", 
     *      name="addBuddy",
     *      methods={"POST"},
     * )
     */
    public function add(
        Request $request,
        EntityManagerInterface $entityManager,
        CityRepository $cityRepository,
        ValidatorInterface $validator,
        UserNormalizer $userNormalizer,
        InterestRepository $interestRepository,
        LanguageRepository $languageRepository,
        UserPasswordHasherInterface $hasher
    ): Response {

        $data = json_decode($request->getContent(), true);
        // dump($data);
        // dump($data['name']);
        // die();

        $user = new User();

        $unhashedPassword = $data['password'];
        $hashedPassword = $hasher->hashPassword($user, $unhashedPassword);

        $user->setName($data['name']);
        $user->setLastName($data['lastName']);
        $user->setEmail($data['email']);
        $user->setPassword($hashedPassword);
        $user->setAge($data['age']);
        $user->setBio($data['bio']);
        $user->setYearsLiving($data['yearsLiving']);

        foreach ($data['interests'] as $interestId) {
            $interest = $interestRepository->find($interestId);
            $user->addInterest($interest);
        }
        foreach ($data['languages'] as $languageId) {
            $language = $languageRepository->find($languageId);
            $user->addLanguage($language);
        }

       $city = $cityRepository->find($data['cityId']);
       $user->setCity($city);

        if($user->getRoles(['ROLE_BUDDY'])) {
            $user->setRoles(['ROLE_BUDDY']);
        }

       $errors = $validator->validate($user);
        
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

        $entityManager->persist($user);
        $entityManager->flush($user);

        return $this->json(
            $userNormalizer->userNormalizer($user),
            Response::HTTP_CREATED
        );
    }

    /**
     * @Route(
     *      "/addUser", 
     *      name="addUser",
     *      methods={"POST"},
     * )
     */
    public function addUser(
        Request $request,
        EntityManagerInterface $entityManager,
        CityRepository $cityRepository,
        ValidatorInterface $validator,
        UserNormalizer $userNormalizer,
        InterestRepository $interestRepository,
        LanguageRepository $languageRepository,
        UserPasswordHasherInterface $hasher
    ): Response {

        $data = json_decode($request->getContent(), true);
        // dump($data);
        // dump($data['name']);
        // die();

        $user = new User();

        $unhashedPassword = $data['password'];
        $hashedPassword = $hasher->hashPassword($user, $unhashedPassword);

        $user->setName($data['name']);
        $user->setLastName($data['lastName']);
        $user->setEmail($data['email']);
        $user->setPassword($hashedPassword);
        $user->setAge($data['age']);
        $user->setBio($data['bio']);
        

        foreach ($data['interests'] as $interestId) {
            $interest = $interestRepository->find($interestId);
            $user->addInterest($interest);
        }
        foreach ($data['languages'] as $languageId) {
            $language = $languageRepository->find($languageId);
            $user->addLanguage($language);
        }

       $city = $cityRepository->find($data['cityId']);
       $user->setCity($city);

        if($user->getRoles(['ROLE_USER'])) {
            $user->setRoles(['ROLE_USER']);
        }

       $errors = $validator->validate($user);
        
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

        $entityManager->persist($user);
        $entityManager->flush($user);

        return $this->json(
            $userNormalizer->userNormalizer($user),
            Response::HTTP_CREATED
        );
    }

    

    /**
    * @Route(
    *      "/imageupdated/{id}",
    *      name="imageUpdated",
    *      methods={"POST"},
    *      requirements={
    *          "id": "\d+"
    *      }
    * )
    */
    public function updatedImage(
        User $user, 
        Request $request, 
        EntityManagerInterface $entityManager):Response {
        // dump($request->request);
        // dump($request->files);
        // dump($user);
        // die();

        if($request->files->has('File')) {
            $imageFile = $request->files->get('File');

            $newFilename = uniqid().'.'.$imageFile->guessExtension();

            // Intentamos mover el fichero a la carpeta public
            try {
                $imageFile->move(
                    $request->server->get('DOCUMENT_ROOT') . DIRECTORY_SEPARATOR . 'images', // El primer par??metro es la ruta
                    $newFilename // El 2?? param es el nombre del fichero
                );
            } catch (FileException $error) {
                throw new \Exception($error->getMessage());
            }

            $user->setImage($newFilename);
        }

        $entityManager->flush();

        return $this->json(
            null,
            Response::HTTP_CREATED
        );
    }


    /**
     * @Route(
     *      "/updatedUser/{id}", 
     *      name="update",
     *      methods={"PUT"},
     *      requirements={
     *          "id": "\d+"
     *      }
     * )
     */
    public function update(
        User $user,
        EntityManagerInterface $entityManager,
        Request $request,
        UserPasswordHasherInterface $hasher
        ): Response

    {
        $data = json_decode($request->getContent(), true);

        $unhashedPassword = $data['password'];
        $hashedPassword = $hasher->hashPassword($user, $unhashedPassword);

        $user->setName($data['name']);
        $user->setLastName($data['lastName']);
        $user->setEmail($data['email']);
        $user->setAge($data['age']);
        $user->setBio($data['bio']);
        $user->setPassword($hashedPassword);



        $entityManager->flush();

        return $this->json(null, Response::HTTP_OK);
    }

        /**
     * @Route(
     *      "/delete/{id}", 
     *      name="delete",
     *      methods={"DELETE"},
     *      requirements={
     *          "id": "\d+"
     *      }
     * )
     */
    public function remove(
        int $id,
        EntityManagerInterface $entityManager,
        UserRepository $userRepository
    ): Response
    {
        $user = $userRepository->find($id);

        if(!$user) {
            return $this->json([
                'message' => sprintf('No he encontrado el usuario con id.: %s', $id)
            ], Response::HTTP_NOT_FOUND);
        }

        dump($user);

        // remove() prepara el sistema pero NO ejecuta la sentencia.
        $entityManager->remove($user);
        $entityManager->flush();

        return $this->json(null, Response::HTTP_OK);
    }

}
