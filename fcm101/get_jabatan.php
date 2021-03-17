<?php

    require "koneksi.php";

    $cek = "SELECT DISTINCT jabatan FROM users";
    $result = mysqli_query($connect, $cek);

    $users = array();

    while ($row = mysqli_fetch_assoc($result)) {
        $users[] = $row['jabatan'];
    }
    
    header('Content-Type: application/json');
    echo json_encode($users);

?>