<?php

namespace Ikdoeict\Provider\Controller;

use Silex\Application;
use Silex\ControllerProviderInterface;
use Silex\ControllerCollection;
use Symfony\Component\Validator\Constraints as Assert;

class BrokerController implements ControllerProviderInterface {

	public function connect(Application $app) {
                session_start();
                $controllers = $app['controllers_factory'];
		$controllers->get('/', array($this, 'login'));
                $controllers->get('/edit/{id}', array($this, 'edit'))->assert('id', '\d+');
                $controllers->get('/add/', array($this, 'add'));
                $controllers->get('/delete/{id}', array($this, 'delete'))->assert('id', '\d+');
                $controllers->post('/edit/{id}', array($this, 'edit'))->assert('id', '\d+');
                $controllers->post('/add/', array($this, 'add'));
                $controllers->post('/', array($this, 'login'));
                $controllers->post('/overview/', array($this, 'overview'));
		return $controllers;

	}

	public function login(Application $app) {
            // Create “Add Link” Form
		$loginform = $app['form.factory']->createNamed('loginform')
			->add('Naam', 'text', array(
				'constraints' => array(new Assert\NotBlank())
			))
			->add('Wachtwoord', 'password', array(
				'constraints' => array(new Assert\NotBlank())
			));

		// “Add Link” form was submitted: process it
		if ('POST' == $app['request']->getMethod()) {
			$loginform->bind($app['request']);

			if ($loginform->isValid()) {
				$data = $loginform->getData();

                                $brokers = $app['brokers']->getBrokers();
                                foreach ($brokers as $broker) {
                                    if ($broker['name'] == $data['Naam'] && $broker['password'] == $data['Wachtwoord']) {
                                        $_SESSION['broker_id'] = $broker['brokers_id'];
                                        
                                        $properties = $app['properties']->getBrokerProperties($_SESSION['broker_id']);
                                        return $app['twig']->render('broker/overview.twig', array('properties' => $properties));
                                    }
                                }
                                
			}
		}

		return $app['twig']->render('broker/login.twig', array('loginform' => $loginform->createView()));
	}

	public function overview(Application $app) {
                $properties = $app['properties']->getBrokerProperties($_SESSION['broker_id']);
		return $app['twig']->render('broker/overview.twig', array('properties' => $properties));
	}
        
        public function add(Application $app) {
                $form = $app['form.factory']->createNamed('form')
			->add('Type', 'text', array(
				'constraints' => array(new Assert\NotBlank())
			))
			->add('Prijs', 'text', array(
				'constraints' => array(new Assert\NotBlank())
			))
                        ->add('KI', 'text', array(
				'constraints' => array(new Assert\NotBlank())
			))
                        ->add('KopenHuren', 'choice', array(
                            'constraints' => array(new Assert\NotBlank()),
                            'choices'   => array(
                                'buy'   => 'Kopen',
                                'rent' => 'Huren',
                            ),
                            'expanded'  => true,
                        ))
                        ->add('Oppervlakte', 'text', array(
				'constraints' => array(new Assert\NotBlank())
			))
                        ->add('Straat', 'text', array(
				'constraints' => array(new Assert\NotBlank())
			))
			->add('Huisnummer', 'text', array(
				'constraints' => array(new Assert\NotBlank())
			))
                        ->add('Postcode', 'text', array(
				'constraints' => array(new Assert\NotBlank())
			))
                        ->add('Stad', 'text', array(
				'constraints' => array(new Assert\NotBlank())
			))
                        ->add('Provincie', 'text', array(
				'constraints' => array(new Assert\NotBlank())
			))
			->add('Slaapkamers', 'text', array())
                        ->add('Badkamers', 'text', array())
                        ->add('Bouwjaar', 'text', array())
                        ->add('Omschrijving', 'textarea', array(
				'constraints' => array(new Assert\NotBlank())
			));
                
                if ('POST' == $app['request']->getMethod()) {
			$form->bind($app['request']);

			if ($form->isValid()) {
				$data = $form->getData();
                                $toAdd = array(
                                    'KI' => $data['KI'],
                                    'price' => $data['Prijs'],
                                    'buyRent' => $data['KopenHuren'],
                                    'date' => date('Y-m-d H:m:s'),
                                    'acreage' => $data['Oppervlakte'],
                                    'street' => $data['Straat'],
                                    'number' => $data['Huisnummer'],
                                    'zip_code' => $data['Postcode'],
                                    'city' => $data['Stad'],
                                    'province' => $data['Provincie'],
                                    'bedrooms' => $data['Slaapkamers'],
                                    'type' => $data['Type'],
                                    'bouwjaar' => $data['Bouwjaar'],
                                    'restrooms' => $data['Badkamers'],
                                    'brokers_id' => $_SESSION['broker_id'],
                                    'pictures' => '21',
                                    'omschrijving' => $data['Omschrijving']
                                );
                                
                                $app['properties']->insert($toAdd);
                                $properties = $app['properties']->getBrokerProperties($_SESSION['broker_id']);
                                return $app['twig']->render('broker/overview.twig', array('properties' => $properties));
			}
		}
            
		return $app['twig']->render('broker/add.twig', array('form' => $form->createView()));
	}
        
        public function edit(Application $app, $id) {
                $property = $app['properties']->getDetail($id);
            
                $form = $app['form.factory']->createNamed('form')
			->add('Type', 'text', array(
                                'constraints' => array(new Assert\NotBlank()),
                                'data' => $property['type']
			))
			->add('Prijs', 'text', array(
				'constraints' => array(new Assert\NotBlank()),
                                'data' => $property['price']
			))
                        ->add('KI', 'text', array(
				'constraints' => array(new Assert\NotBlank()),
                                'data' => $property['KI']
			))
                        ->add('KopenHuren', 'choice', array(
                            'constraints' => array(new Assert\NotBlank()),
                            'choices'   => array(
                                'buy'   => 'Kopen',
                                'rent' => 'Huren',
                            ),
                            'data' => $property['buyRent'],
                            'expanded'  => true,
                        ))
                        ->add('Oppervlakte', 'text', array(
				'constraints' => array(new Assert\NotBlank()),
                                'data' => $property['acreage']
			))
                        ->add('Straat', 'text', array(
				'constraints' => array(new Assert\NotBlank()),
                                'data' => $property['street']
			))
			->add('Huisnummer', 'text', array(
				'constraints' => array(new Assert\NotBlank()),
                                'data' => $property['number']
			))
                        ->add('Postcode', 'text', array(
				'constraints' => array(new Assert\NotBlank()),
                                'data' => $property['zip_code']
			))
                        ->add('Stad', 'text', array(
				'constraints' => array(new Assert\NotBlank()),
                                'data' => $property['city']
			))
                        ->add('Provincie', 'text', array(
				'constraints' => array(new Assert\NotBlank()),
                                'data' => $property['province']
			))
			->add('Slaapkamers', 'text', array(
                                'data' => $property['bedrooms']
			))
                        ->add('Badkamers', 'text', array(
                                'data' => $property['restrooms']
			))
                        ->add('Bouwjaar', 'text', array(
                                'data' => $property['bouwjaar']
			))
                        ->add('Omschrijving', 'textarea', array(
				'constraints' => array(new Assert\NotBlank()),
                                'data' => $property['omschrijving']
			));
                
                if ('POST' == $app['request']->getMethod()) {
			$form->bind($app['request']);

			if ($form->isValid()) {
				$data = $form->getData();
                                $toAdd = array(
                                    'properties_id' => $property['properties_id'],
                                    'KI' => $data['KI'],
                                    'price' => $data['Prijs'],
                                    'buyRent' => $data['KopenHuren'],
                                    'date' => $property['date'],
                                    'soldRented' => $property['soldRented'],
                                    'acreage' => $data['Oppervlakte'],
                                    'street' => $data['Straat'],
                                    'number' => $data['Huisnummer'],
                                    'zip_code' => $data['Postcode'],
                                    'city' => $data['Stad'],
                                    'province' => $data['Provincie'],
                                    'bedrooms' => $data['Slaapkamers'],
                                    'type' => $data['Type'],
                                    'bouwjaar' => $data['Bouwjaar'],
                                    'restrooms' => $data['Badkamers'],
                                    'brokers_id' => $_SESSION['broker_id'],
                                    'pictures' => $property['pictures'],
                                    'omschrijving' => $data['Omschrijving']
                                );
                                
                                $app['properties']->update($toAdd, $property);
                                $properties = $app['properties']->getBrokerProperties($_SESSION['broker_id']);
                                return $app['twig']->render('broker/overview.twig', array('properties' => $properties));
			}
		}
            
		return $app['twig']->render('broker/edit.twig', array('form' => $form->createView()));
	}
        
        public function delete(Application $app, $id) {
                $app['properties']->delete(array('properties_id' => $id), $app);
                $properties = $app['properties']->getBrokerProperties($_SESSION['broker_id']);
                return $app['twig']->render('broker/overview.twig', array('properties' => $properties));
        }

}