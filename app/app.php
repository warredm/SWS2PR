<?php

// Bootstrap
require __DIR__ . DIRECTORY_SEPARATOR . 'bootstrap.php';

$app->error(function (\Exception $e, $code) use ($app) {
	if ($code == 404) {
		return $app['twig']->render('errors/404.twig', array('error' => $e->getMessage()));
	} else {
		return 'We have found an error, let\'s solve it // ' . $e->getMessage();
	}
});

// All URLs starting with /tweets should be handled by the TweetsController
$app->mount('/properties', new Ikdoeict\Provider\Controller\PropertiesController());
$app->mount('/broker', new Ikdoeict\Provider\Controller\BrokerController());
$app->mount('/', new Ikdoeict\Provider\Controller\HomeController());