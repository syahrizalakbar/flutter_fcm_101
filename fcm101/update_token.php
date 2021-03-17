<?php

    require "koneksi.php";

    $idUser = $_POST['id_user'];
    $deviceId = $_POST['device_id'];
    $token = $_POST['token'];

    $queryCheck = "SELECT * FROM users_token WHERE device_id = '$deviceId' AND id_user = $idUser";
    $resultCheck = mysqli_query($connect, $queryCheck);

    header('Content-Type: application/json');
    if (mysqli_num_rows($resultCheck) > 0) {
        $queryUpdate = "UPDATE users_token SET firebase_token = '$token', still_valid = 1, updated_at = NOW()  WHERE id_user = $idUser AND device_id = '$deviceId'";
        $result = mysqli_query($connect, $queryUpdate);

        if ($result > 0) {
            $res['is_success'] = true;
            $res['message'] = "Berhasil update token firebase";
        } else {
            $res['is_success'] = false;
            $res['message'] = "Gagal update token firebase";
        }

        echo json_encode($res);
    } else {
        $queryInsert = "INSERT INTO users_token (id_user, device_id, firebase_token) VALUES ($idUser, '$deviceId', '$token')";
        $result = mysqli_query($connect, $queryInsert);

        if ($result > 0) {
            $res['is_success'] = true;
            $res['message'] = "Berhasil menambahkan token firebase";
        } else {
            $res['is_success'] = false;
            $res['message'] = "Gagal menambahkan token firebase";
        }

        echo json_encode($res);
    }
?>