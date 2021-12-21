<?php
    session_start();
    header('Content-Type: application/json');
    require_once __DIR__.'db.php';

    $login = htmlspecialchars($_POST['email']);
    $password = htmlspecialchars($_POST['password']);
    $check_user = "SELECT * FROM `user` WHERE `email`= :login";
    $query = $pdo->prepare($check_user);
    $param = ['email' => $login];
    $row = $query->execute($param);
    $result = $query->fetch(PDO::FETCH_ASSOC);
    if ($row != 0){
        if (password_verify($password,$result['password'])){
            $_SESSION['user'] = [
                "id" => $result['id'],
                "name" => $result['name']
            ];
            echo json_encode(true);;
        }else{
            echo json_encode(false);
        }
    }else{
        $_SESSION['message'] = 'Не верный логин или пароль';
        echo json_encode(false);
    }
