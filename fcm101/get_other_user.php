<?php

    require "koneksi.php";

    $id = $_POST['id'];


    $cek = "SELECT * FROM users WHERE id != $id";
    $result = mysqli_query($connect, $cek);

    $users = array();

    while ($row = mysqli_fetch_assoc($result)) {
        $users[] = $row;
    }
    
    header('Content-Type: application/json');
    echo json_encode($users);

?>