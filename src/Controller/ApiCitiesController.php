<?php

namespace App\Controller;

use App\Repository\CityRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/api/cities", name="api_cities_")
 */

class ApiCitiesController extends AbstractController
{
     /**
     * @Route(
     *      "", 
     *      name="cget",
     *      methods={"GET"})
     */

    public function index(CityRepository $cityRepository): Response
    {

       $result = $cityRepository->findAll();

        $data = [];

        foreach ($result as $city) {
            $data[]= $city;
        }

        return $this->json($result);
    }
}
