<?php

namespace App\Service;

use App\Entity\User;
use Symfony\Component\HttpFoundation\UrlHelper;

class UserNormalizer {

    private $urlHelper;
    public function __construct(UrlHelper $constructorDeUrl)
    {
        $this->urlHelper = $constructorDeUrl;
        
    }
    /**
     * Normalize an user.
     * 
     * @param User $user
     * 
     * @return array|null
     */
    public function userNormalizer (User $user): ?array {
        $projects = [];

        // foreach($employee->getProjects() as $project) {
        //     array_push($projects, [
        //         'id' => $project->getId(),    
        //         'name' => $project->getName(),    
        //     ]);
        // }

        // $avatar = '';

        // $avatar = '';
        // if($employee->getAvatar()) {
        //     $avatar = $this->urlHelper->getAbsoluteUrl('/employee/avatar/'.$employee->getAvatar());
        // }
        
        return [
            'id' => $user->getId(),
            'name' => $user->getName(),
            'lastName' => $user->getLastName(),
            'email' => $user->getEmail(),
            'age' => $user->getAge(),
            'bio' => $user->getBio(),
            'languages' => $user->getLanguages(),
            'interests' => $user->getInterests(),
            'yearsLiving' => $user->getYearsLiving(),
            'image' => $user->getImage(),
            'city' => $user->getCity()->getName() //Ponemos getName para evitar el error de relaciones
        ];
    }
}