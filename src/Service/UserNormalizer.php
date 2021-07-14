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
        // $projects = [];

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

        $interests = [];
        foreach($user->getInterests() as $interest) {
            array_push($interests, ["id" => $interest->getId(), "tag" => $interest->getTag()]);
        }
        
        $languages = [];
        foreach($user->getLanguage() as $language) {
            array_push($languages, ["id" => $language->getId(), "name" => $language->getName()]);
        }
        
        return [
            'id' => $user->getId(),
            'name' => $user->getName(),
            'lastName' => $user->getLastName(),
            'email' => $user->getEmail(),
            'age' => $user->getAge(),
            'bio' => $user->getBio(),
            'image' => $user->getImage(),
            'languages' => $languages,
            'interests' => $interests,
            'yearsLiving' => $user->getYearsLiving(),
            'cityId' => $user->getCity()->getName(),
            'roles' => $user->getRoles()
        ];
    }
}