<?php

namespace App\Controller;

use App\Repository\CityRepository;
use App\Service\CityNormalizer;
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

    public function index(CityNormalizer $cityNormalizer, CityRepository $cityRepository): Response
    {
       $result = $cityRepository->findAll();

        $data = [];

        foreach ($result as $city) {
            $data[]= $cityNormalizer->cityNormalizer($city);
        }

        return $this->json($data);
    }
}
