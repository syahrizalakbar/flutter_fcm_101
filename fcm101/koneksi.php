<?php
    if (!function_exists('curl_version')) {
        die("CURL Disabled");
    }

    $connect = mysqli_connect("localhost", "root", "", "db_fcm") or  die('unable to connect');
?>