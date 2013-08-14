<?php

namespace Ikdoeict\Provider\Controller;

use Silex\Application;
use Silex\ControllerProviderInterface;
use Silex\ControllerCollection;
use Symfony\Component\Validator\Constraints as Assert;

class PropertiesController implements ControllerProviderInterface {

	public function connect(Application $app) {
                $controllers = $app['controllers_factory'];
		$controllers->get('/', array($this, 'overview'));
                $controllers->get('/buy', array($this, 'buy'));
                $controllers->get('/rent', array($this, 'rent'));
                $controllers->get('/{id}', array($this, 'detail'))->assert('id', '\d+');
                $controllers->get('/contact/{properties_id}/{brokers_id}', array($this, 'contactFilled'))
                        ->assert('properties_id', '\d+')
                        ->assert('brokers_id', '\d+');
                $controllers->get('/contact', array($this, 'contact'));
                $controllers->post('/contact', array($this, 'contact'));
                $controllers->get('/estimation', array($this, 'estimation'));
                $controllers->post('/estimation', array($this, 'estimation'));
                $controllers->post('/contact', array($this, 'contact'));
		return $controllers;

	}

	public function overview(Application $app) {
                $properties = $app['properties']->getAll();
                return $app['twig']->render('properties/overview.twig', array('properties' => $properties));
	}


	public function detail(Application $app, $id) {
                $property = $app['properties']->getDetail($id);
                
                $dir = realpath(__DIR__ . '/../../../..') . DIRECTORY_SEPARATOR . 'resources' . DIRECTORY_SEPARATOR . 'pictures' . DIRECTORY_SEPARATOR . $property['pictures'] . '\*.*';
                $images = glob($dir);
                
                for ($i = 0; $i < count($images); $i++) {
                    $images[$i] = str_replace('C:\\wamp\\www\\Herexamens\\SWS2PR\\', '../../', $images[$i]);
                    $images[$i] = str_replace('\\', '/', $images[$i]);
                }
                
		if (!$property) {
			$app->abort(404, 'The requested property (id #' . $app->escape($id) . ') does not exist');
		}
		return $app['twig']->render('properties/detail.twig', array('property' => $property, 'images' => $images));
	}
        
        public function buy(Application $app) {
                $properties = $app['properties']->getBuy();
                return $app['twig']->render('properties/overview.twig', array('properties' => $properties));
        }
        
        public function rent(Application $app) {
                $properties = $app['properties']->getRent();
                return $app['twig']->render('properties/overview.twig', array('properties' => $properties));
        }
        
        public function contact (Application $app) {
                $brokers = $app['brokers']->getBrokers();
                $options = array();
                for ($i = 0; $i < count($brokers); $i++) {
                    $options[$i] = $brokers[$i]['name'];
                }
            
                $contactform = $app['form.factory']->createNamed('loginform')
			->add('Mail', 'text', array(
				'constraints' => array(new Assert\NotBlank())
			))
                        ->add('Makelaar', 'choice', array(
                                'choices' => $options
                        ))
                        ->add('Bericht', 'textarea', array(
				'constraints' => array(new Assert\NotBlank())
			));
                
                if ('POST' == $app['request']->getMethod()) {
			$contactform->bind($app['request']);

			if ($contactform->isValid()) {
				$data = $contactform->getData();
                                $broker = $app['brokers']->getBroker(($data['Makelaar'] + 1));
                                $mail = array(
                                    'message' => $data['Bericht'],
                                    'broker_id' => $data['Makelaar'],
                                    'mailTo' => $data['Mail']
                                );
                                
                                // 2DO; send mail to broker
                                
                                return $app['twig']->render('/static/home.twig');
			}
		}
                
                $title = 'Contact';
                return $app['twig']->render('properties/contact.twig', array('title' => $title, 'contactform' => $contactform->createView()));
        }
        
        public function estimation (Application $app) {
                $brokers = $app['brokers']->getBrokers();
                $options = array();
                for ($i = 0; $i < count($brokers); $i++) {
                    $options[$i] = $brokers[$i]['name'];
                }
            
                $contactform = $app['form.factory']->createNamed('loginform')
			->add('Mail', 'text', array(
				'constraints' => array(new Assert\NotBlank())
			))
                        ->add('Bericht', 'textarea', array(
				'constraints' => array(new Assert\NotBlank())
			));
                
                if ('get' == $app['request']->getMethod()) {
			$contactform->bind($app['request']);

			if ($contactform->isValid()) {
				$data = $contactform->getData();
                                $broker = $app['brokers']->getBroker(($data['Makelaar'] + 1));
                                $mail = array(
                                    'message' => $data['Bericht'],
                                    'broker_id' => 1,
                                    'mailTo' => $data['Mail']
                                );
                                
                                // 2DO; send mail to broker
                                
                                return $app['twig']->render('/');
			}
		}
                
                $title = 'Maak een afspraak';
                return $app['twig']->render('properties/contact.twig', array('title' => $title, 'contactform' => $contactform->createView()));
        }
        
        public function contactFilled (Application $app, $properties_id, $brokers_id) {
                $brokerArray = $app['brokers']->getBroker($brokers_id);
                $broker = $brokerArray[0];
                $property = $app['properties']->getDetail($properties_id);
            
                $contactform = $app['form.factory']->createNamed('loginform')
			->add('Emailadres', 'text', array(
				'constraints' => array(new Assert\NotBlank())
			))
                        ->add('Eigendom', 'text', array(
				'constraints' => array(new Assert\NotBlank()),
                                'data' => ($property['type'] . ' te ' . $property['city'] . ' (' . $property['zip_code'] . ')'),
                                'disabled' => true
			))
                        ->add('Makelaar', 'text', array(
                                'constraints' => array(new Assert\NotBlank()),
                                'data' => $broker['name'],
                                'disabled' => true
                        ))
                        ->add('Bericht', 'textarea', array(
				'constraints' => array(new Assert\NotBlank())
			));
                
                if ('POST' == $app['request']->getMethod()) {
			$contactform->bind($app['request']);

			if ($contactform->isValid()) {
				$data = $contactform->getData();
                                $broker = $app['brokers']->getBroker(($data['Makelaar'] + 1));
                                $mail = array(
                                    'message' => $data['Bericht'],
                                    'broker_id' => $data['Makelaar'],
                                    'mailTo' => $data['Mail']
                                );
                                
                                var_dump($mail);
                                
                                // 2DO; send mail to broker
                                
                                return $app['twig']->render('/static/home.twig');
			}
		}
                
                $title = 'Contact';
                return $app['twig']->render('properties/contact.twig', array('title' => $title, 'contactform' => $contactform->createView()));
        }

}