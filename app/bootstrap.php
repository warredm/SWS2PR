<?php

// Require Composer Autoloader
require_once __DIR__ . DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR . 'vendor' . DIRECTORY_SEPARATOR . 'autoload.php';

// Create new Silex App
$app = new Silex\Application();

// App Configuration
$app['debug'] = true;

$app->register(new Silex\Provider\TwigServiceProvider(), array(
	'twig.path' => __DIR__ .  DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR . 'src' . DIRECTORY_SEPARATOR . 'views'
));

$app->register(new Silex\Provider\DoctrineServiceProvider(), array(
    'db.options' => array(
        'driver' => 'pdo_mysql',
        'host' => 'localhost',
        'dbname' => 'struttura',
        'user' => 'root',
        'password' => 'Azerty123'
    )
));

$app->register(new Knp\Provider\RepositoryServiceProvider(), array(
	'repository.repositories' => array(
		'properties' => 'Ikdoeict\\Repository\\PropertiesRepository',
		'brokers' => 'Ikdoeict\\Repository\\BrokersRepository'
	)
));

// Use Validator Service Provider - @note: Be sure to install "symfony/validator" via Composer first!
$app->register(new Silex\Provider\ValidatorServiceProvider());

// Use Form Service Provider - @note: Be sure to install "symfony/form" & "symfony/twig-bridge" via Composer first!
$app->register(new Silex\Provider\FormServiceProvider());

// Use Translation Service Provider because without it our form won't work
$app->register(new Silex\Provider\TranslationServiceProvider(), array(
	'translator.messages' => array(),
));