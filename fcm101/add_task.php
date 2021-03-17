<?php
    require "koneksi.php";
    require "utils.php";

    $debug = isset($_POST['debug']) ? $_POST['debug'] : false;

    $createdBy = $_POST['created_by'];
    $title = $_POST['title'];
    $description = $_POST['description'];
    
    $toIds = $_POST['to_ids'];
    $toJabatans = $_POST['to_jabatans'];

    $res;
    header('Content-Type: application/json');

    if (($createdBy == null || $title == null) || ($toIds == null && $toJabatans == null)) {
        $res['is_success'] = false;
        $res['message'] = "Field tidak lengkap";
        die(json_encode($res));
    }

    //
    // Collect data token, topic, and idUser
    //

    $tokenFirebase = [];
    $topic = [];
    $idUser = [];


    /// Add Task by Jabatan
    if ($toJabatans != null) {
        try {
            $q = "SELECT * FROM users WHERE jabatan IN (\"" . implode("\",\"", $toJabatans) . "\")";
            $result = mysqli_query($connect, $q);

            while ($row = mysqli_fetch_assoc($result)) {
                $idUser[] = $row['id'];
            }
            $topic = $toJabatans;
        } catch (Exception $e) {
            if ($debug) {
                echo $e;
            }
        }
    }

    /// Add Task by Id User
    if ($toIds != null) {
        try {
            $q = "SELECT * FROM users_token WHERE id_user IN (" . implode(",", $toIds) . ") AND still_valid = 1 AND updated_at >= DATE_SUB(NOW(), INTERVAL 30 DAY)";
            
            $result = mysqli_query($connect, $q);
            
            while ($row = mysqli_fetch_assoc($result)) {
                if (!in_array($row['id_user'], $idUser)) { // prevent duptlicate notification
                    $tokenFirebase[] = $row['firebase_token'];
                }
            }
            foreach ($toIds as $id) {
                if (!in_array($id, $idUser)) { // prevent duptlicate notification
                    $idUser[] = $id;
                }
            }
        } catch (Exception $e) {
            if ($debug) {
                echo $e;
            }
        }
    }

    if ($debug) {
        // $res['token_firebase'] = $tokenFirebase;
        // $res['topic'] = $topic;
        // $res['id_user'] = $idUser;
        // echo json_encode($res);
    }

    //
    // Save Task
    //

    foreach ($idUser as $id) {
        $queryInsert = "INSERT INTO tasks (title, description, id_user, created_by) VALUES ('$title', ". ($description == null ? 'NULL' : "'$description'") .", $id, $createdBy)";
        // die($queryInsert);
        $result = mysqli_query($connect, $queryInsert);
    }

    // 
    // Send Notification
    //
    sendPushNotification($connect, [
        "title" => "Tugas Baru",
        "body" => $title,
    ], [
        "title" => $title,
        "description" => $description,
        "click_action" => "FLUTTER_NOTIFICATION_CLICK"
    ], $tokenFirebase, $topic, $debug);

    echo json_encode([
        "is_success" => true,
        "message" => "Berhasil menambahkan tugas",
    ]);
?>