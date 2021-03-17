<?php

    require "koneksi.php";

    $id = $_POST['id'];

    $cek = "SELECT * FROM tasks WHERE id_user = $id ORDER BY id DESC";
    $result = mysqli_query($connect, $cek);

    $task = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $task[] = $row;
    }

    header('Content-Type: application/json');
    if ($task != null) {
        $res['is_success'] = true;
        $res['message'] = "Berhasil";
        $res['data'] = $task;
    } else {
        $res['is_success'] = false;
        $res['message'] = "Gagal";
        $res['data'] = $task;
    }

    echo json_encode($res);

?>