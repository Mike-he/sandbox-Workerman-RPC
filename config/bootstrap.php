<?php

namespace MyBootstrap;

// bootstrap.php
use Doctrine\ORM\Tools\Setup;
use Doctrine\ORM\EntityManager;
use Symfony\Component\Yaml\Yaml;

require_once "./vendor/autoload.php";

// Create a simple "default" Doctrine ORM configuration for Annotations
$isDevMode = true;
$config = Setup::createAnnotationMetadataConfiguration(array(__DIR__."/../app/Entity"), $isDevMode);
// or if you prefer yaml or XML
//$config = Setup::createXMLMetadataConfiguration(array(__DIR__."/config/xml"), $isDevMode);
//$config = Setup::createYAMLMetadataConfiguration(array(__DIR__."/config/yaml"), $isDevMode);

// database configuration parameters
$yaml = Yaml::parse(file_get_contents(__DIR__.'/config.yaml'));
$conn = $yaml['database'];

// obtaining the Entity manager
global $entityManager;
return $entityManager = EntityManager::create($conn, $config);