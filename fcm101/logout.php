<?php
require "koneksi.php";

$response = array();
$id = $_POST['id'];
$deviceId = $_POST['device_id'] ;

$deleteQuery = "DELETE FROM users_token WHERE id_user = $id AND device_id = '$deviceId'";
$result = mysqli_query($connect, $deleteQuery);

header('Content-Type: application/json');
$res['is_success'] = true;
$res['message'] = "Berhasil logout";
echo json_encode($res);

?>
