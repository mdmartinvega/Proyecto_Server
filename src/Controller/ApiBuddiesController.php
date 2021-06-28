<?php

namespace App\Controller;

use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Service\UserNormalizer;

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

}
