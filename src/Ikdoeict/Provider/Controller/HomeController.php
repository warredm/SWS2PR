<?php

namespace Ikdoeict\Provider\Controller;

use Silex\Application;
use Silex\ControllerProviderInterface;
use Silex\ControllerCollection;
use Symfony\Component\Validator\Constraints as Assert;

class HomeController implements ControllerProviderInterface {

	public function connect(Application $app) {
                $controllers = $app['controllers_factory'];
                $controllers->get('/', array($this, 'home'));
                $controllers->post('/', array($this, 'home'));
		return $controllers;

	}

	public function home(Application $app) {                
                $results = null;
                $recentProperties = $app['properties']->get4MostRecentProperties();
                $searchform = $app['form.factory']->createNamed('searchform')
                        ->add('Type', 'choice', array(
                            'constraints' => array(new Assert\NotBlank()),
                            'choices'   => array(
                                'Woning'  => 'Woning',
                                'Appartement' => 'Appartement',
                                'Grond' => 'Grond',
                                'Bedrijfsvastgoed' => 'Bedrijfsvastgoed',
                                'Garage' => 'Garage',
                            ),
                            'expanded'  => true,
                            'multiple'  => false,
                        ))
                        ->add('MaxPrijs', 'text', array(
				'constraints' => array(new Assert\NotBlank())
			))
                        ->add('KopenHuren', 'choice', array(
                            'constraints' => array(new Assert\NotBlank()),
                            'choices'   => array(
                                'buy'   => 'Kopen',
                                'rent' => 'Huren',
                            ),
                            'expanded'  => true,
                        ));
                
                if ('POST' == $app['request']->getMethod()) {
			$searchform->bind($app['request']);

			if ($searchform->isValid()) {
				$data = $searchform->getData();
                                $results = $app['properties']->filter($data['Type'], $data['MaxPrijs'], $data['KopenHuren']);
                                return $app['twig']->render('home/home.twig', array('recentProperties' => $recentProperties, 'results' => $results, 'maxprijs' => $data['MaxPrijs'], 'searchform' => $searchform->createView()));
			}
		}
                
                return $app['twig']->render('home/home.twig', array('recentProperties' => $recentProperties, 'results' => $results, 'searchform' => $searchform->createView()));
	}
}