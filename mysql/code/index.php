<?php


$servername = "mysql:dbname=mysql_db;host=db";
$username = "admin";
$password = "mysql-admin";

// Create connection
try {
    $conn = new PDO($servername, $username, $password);
} catch (PDOException $e){
    die ("Verbindung konnte nicht hergestellt werden: " . $e);
}

$sql = "SELECT * FROM test";
$stmt = $conn->prepare($sql);
$stmt->execute();
$test = $stmt->fetchAll();
echo "<pre>";
    print_r($test);
echo "</pre>";

/*
$servername = "db";
$username = "admin";
$password = "mysql-admin";

// Create connection
$conn = new mysqli($servername, $username, $password);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";
*/