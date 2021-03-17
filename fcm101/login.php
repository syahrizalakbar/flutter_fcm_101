<?php
require "koneksi.php";

$response = array();
$username = $_POST['username'];
$password = $_POST['password'] ;

$cek = "SELECT * FROM users WHERE username='$username' AND password='$password'";
$result = mysqli_fetch_assoc(mysqli_query($connect, $cek));

header('Content-Type: application/json');
if (isset($result)) {
	$response['is_success'] = true;
	$response['message'] = "Login Berhasil";
	$response['data'] = $result;

	echo json_encode($response);
} else {
	$response['is_success'] = false;
	$response['message'] = "Login Gagal";
	echo json_encode($response);
}

?>
