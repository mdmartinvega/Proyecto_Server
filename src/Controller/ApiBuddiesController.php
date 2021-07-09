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
use Symfony\Component\Validator\Validator\ValidatorInterface;

/**
 * @Route("/api/buddies", name="api_buddies_")
 */

class ApiBuddiesController extends AbstractController
{
    /**
     * @Route(
     *      "/city/{id}", 
     *      name="cget",
     *      methods={"GET"})
     */
    public function index($id, 
    UserRepository $userRepository, 
    UserNormalizer $userNormalizer, 
    CityRepository $cityRepository,
    CityNormalizer $cityNormalizer): Response
    {
        $users = [];
        foreach($userRepository->findUsersByCity($id) as $user) {
            array_push($users, $userNormalizer->userNormalizer($user));
        };

        $city = $cityNormalizer->cityNormalizer($cityRepository->find($id));

        $resultado = [
        "total" =>  count($userRepository->findUsersByCity($id)),
        "city" => $city,
        "results" => $users
        ];

        return $this->json($resultado);

    }


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
        UserNormalizer $employeeNormalize): Response
    {
        return $this->json($employeeNormalize->userNormalizer($user));
    }

    /**
     * @Route(
     *      "", 
     *      name="post",
     *      methods={"POST"},
     * )
     */
    public function add(
        Request $request,
        EntityManagerInterface $entityManager,
        CityRepository $cityRepository,
        ValidatorInterface $validator,
        UserNormalizer $userNormalizer
    ): Response {

        $data = json_decode($request->getContent(), true);
        // dump($data);
        // dump($data['name']);
        // die();

        $user = new User();

        $user->setName($data['name']);
        $user->setLastName($data['lastName']);
        $user->setEmail($data['email']);
        $user->setPassword($data['password']);
        // $user->setAge($data['age']);
        // $user->setBio($data['bio']);
        // $user->setYearsLiving($data['yearsLiving']);
        // $user->setLanguages($data['languages']);
        // $user->setInterests($data['interests']);

//        if(Si el data indica que es un anfitrion) {
//        $user->setRoles(['ROLE_BUDY']);
        // }

    //    $city = $cityRepository->find($data['cityId']);
    //    $user->setCity($city);

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
            // [
            //     'Location' => $this->generateUrl(
            //         'api_user_get',
            //         [
            //             'id' => $user->getId()
            //         ]
            //     )
            // ]
        );
    }

    /**
     * @Route(
     *      "/{id}", 
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
        CityRepository $cityRepository
        ): Response

    {
        $data = json_decode($request->getContent(), true);

        $user->setName($data['name']);
        $user->setLastName($data['lastName']);
        $user->setEmail($data['email']);
        $user->setAge($data['age']);
        $user->setBio($data['bio']);
        // $user->setLanguages($data['languages']);
        // $user->setInterests($data['interests']);
        $user->setYearsLiving($data['yearsLiving']);
        $user->setImage($data['image']);

        $city = $cityRepository->find($data['cityId']);
        $user->setCity($city);

        $entityManager->flush();

        return $this->json(null, Response::HTTP_NO_CONTENT);
    }

        /**
     * @Route(
     *      "/{id}", 
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

        return $this->json(null, Response::HTTP_NO_CONTENT);
    }

}
