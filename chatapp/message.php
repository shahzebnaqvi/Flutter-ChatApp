<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
require('connection/config.php');
$sql = "SELECT `id`, `create_time`, `person`, `message` FROM `chat` order by id";
$result = mysqli_query(connect_db(),$sql);
$row = mysqli_fetch_all($result,MYSQLI_ASSOC);
echo json_encode($row);

?>