<?php

namespace App\Controller;

use App\Entity\User;
use App\Repository\CityRepository;
use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Service\UserNormalizer;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityManagerInterface;

/**
 * @Route("/api/buddies", name="api_buddies_")
 */

class ApiBuddiesController extends AbstractController
{
    /**
     * @Route(
     *      "", 
     *      name="cget",
     *      methods={"GET"})
     */
    public function index(Request $request, UserRepository $userRepository, UserNormalizer $userNormalizer): Response
    {
        // if($request->query->has('city')) {
        //     $result= $userRepository->findBy([
        //         'role' => 'ROLE_BUDDY',
        //         'city' => $request->query->get('city')
        //         ]);

        //     $data = [];

        //     foreach ($result as $employee) {
        //         $data[]= $employeeNormalize->employeeNormalize($employee);
        //     }
        //     return $this->json($data);
        // }


       $result = $userRepository->findAll();

        $data = [];

        foreach ($result as $user) {
            $data[]= $userNormalizer->userNormalizer($user);
        }

        return $this->json($data);
    }

    // public function index(CityRepository $cityRepository): Response
    // {
    //     $result = $cityRepository->findAll();
    //     $data = $result;

    //     $resultado = [
    //         "total" => 15,
    //         "results" => $data
    //     ];

    //     return $this->json($resultado);
    // }

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
        CityRepository $cityRepository
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
        $user->setAge($data['age']);
        $user->setBio($data['bio']);
        $user->setYearsLiving($data['yearsLiving']);
        $user->setLanguages($data['languages']);
        $user->setInterests($data['interests']);

       $city = $cityRepository->find($data['cityId']);
       $user->setCity($city);

        $entityManager->persist($user);
        $entityManager->flush($user);

        return $this->json(
            $user,
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
    public function update(int $id, Request $request, UserRepository $userRepository, UserNormalizer $userNormalizer): Response
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
     *      "/{id}", 
     *      name="delete",
     *      methods={"DELETE"},
     *      requirements={
     *          "id": "\d+"
     *      }
     * )
     */
    public function remove(int $id, Request $request, UserRepository $userRepository, UserNormalizer $userNormalizer): Response
    {

       $result = $userRepository->findAll();

        $data = [];

        foreach ($result as $user) {
            $data[]= $userNormalizer->userNormalizer($user);
        }

        return $this->json($data);
    }

}
