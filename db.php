<?php
global $dbh;
$parameters=parse_ini_file('cfg/dbconf.ini');
$dsn='mysql:host=' . $parameters['host'] . ';dbname=' . $parameters['name'];
try{
    $holder = new PDO($dsn, $parameters['login'], $parameters['password']);

} catch (PDOException $e) {
    print "Error!: " . $e->getMessage() . "<br/>";
    die();
}
?>