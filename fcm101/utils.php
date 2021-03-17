<?php

    function sendPushNotification($connect, $notification, $data, $token = [], $topic = [], $debug = false) {
        if ((empty($token) || empty($topic)) && ($notification == null || $data == null)) {
            return;
        }

        // 
        // Set Json Data
        //
        $notifToken = false;
        $notifTopic = false;
        
        if (!empty($token)) {
            $notifToken = true;
        }
        if (!empty($topic)) {
            $notifTopic = true;
        }
        $notif = '';
        if ($notification != null) {
            $notif = "\"notification\": " . json_encode($notification);
        }
        $dataNotif = "";
        if ($data != null) {
            $dataNotif = ",\"data\": " . json_encode($data);
        }

        // if ($debug) {
        //     echo "Notif with Token: $notifToken";
        //     echo "Notif with Topic: $notifTopic";
        // }

        //
        // Send Notifications by token and topic
        //

        if ($notifToken) {
            // {
            //     "registration_ids": ["user_firebase_token", ...],
            //     "notification": {
            //       "title": "Breaking News",
            //       "body": "New news story available.",
            //     },
            //     "data": {
            //       "story_id": "story_12345"
            //       "click_action" => "FLUTTER_NOTIFICATION_CLICK",    
            //     }
            //   }
            $payload = '{
                "registration_ids": '.json_encode($token).',
                '.$notif.''.$dataNotif.'
              }';
            //   die($payload);
            sendNow($connect, $token, $payload, $debug);
            // if ($debug) print_r($token);
        }

        if ($notifTopic) {
            // {
            //     "to": "/topics/YOUR_TOPIC_NAME",
            //     "notification": {
            //       "title": "Breaking News",
            //       "body": "New news story available.",
            //     },
            //     "data": {
            //       "story_id": "story_12345"
            //       "click_action" => "FLUTTER_NOTIFICATION_CLICK",    
            //     }
            //   }
            foreach ($topic as $tp) {
                $payload = '{
                    "to": "/topics/'.$tp.'",
                    '.$notif.''.$dataNotif.'
                  }';

                //   die($payload);
                sendNow($connect, [], $payload, $debug);
                // if ($debug) echo $payload;
            }
        }
    }

    function sendNow($connect, $tokens, $payload, $debug = false) {
        $authKey ="key=AAAAtag31JM:APA91bFNQBhRLQURw7G4z4X8dgu3jbdXUDYSnekUgCOEnnc4N6dbYT8YvnOaKUJAax4t4978aNClD-7IlSj_qH3drMih6kx28VmZokhxREUheZIuYCa6f6NygJIeUQrh0DcZX_u0sIwO";
        $curl = curl_init();      
        curl_setopt_array($curl, array(
          CURLOPT_URL => "https://fcm.googleapis.com/fcm/send",
          CURLOPT_RETURNTRANSFER => true,
          CURLOPT_ENCODING => "",
          CURLOPT_MAXREDIRS => 10,
          CURLOPT_TIMEOUT => 30,
          CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
          CURLOPT_CUSTOMREQUEST => "POST",
          CURLOPT_POSTFIELDS => $payload,
          CURLOPT_HTTPHEADER => array(
            "Authorization: " . $authKey,
            "Content-Type: application/json",
            "cache-control: no-cache"
          ),
        ));
        $response = curl_exec($curl);

        $err = curl_error($curl);
        $res = json_decode($response);
        curl_close($curl);

        if ($err) {
            die($err);
        } else {
            if (isset($res->results)) { /////
                for($i = 0; $i < count($res->results); $i++) {
                    if (isset($res->results[$i]->error)) {
                        // echo $res->results[$i]->error;
                        disableUserToken($connect, $tokens[$i]);
                    }
                }
            }
        } 

        // if ($debug) {
        //     echo $response;
        // }

        return $response;
    }

    function disableUserToken($connect, $token) {
        $deleteQuery = "UPDATE users_token SET still_valid = 0 WHERE firebase_token = '$token'";
        mysqli_query($connect, $deleteQuery);
    }
?>