<?php

declare(strict_types=1);
namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class DefaultController  extends AbstractController {

    /**
     * @Route("/", name="index")
     */

    public function index(): Response {
        return new Response('Objeto');
    }

    /**
     * @Route("/profiles", name="profiles_list")
     */

    public function seeProfiles(): Response {
        return new Response('Objeto');
    }

    /**
     * @Route("/register", name="register_form")
     */

    public function register(): Response {
        return new Response('Objeto');
    }
}