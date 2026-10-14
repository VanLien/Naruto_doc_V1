<?php
function connectGame($server, $dbh) {
    try {
        // Sử dụng câu lệnh chuẩn bị để ngăn chặn SQL Injection
        $stmt = $dbh->prepare("SELECT `data` FROM `ip_web_sv` WHERE `id` = :server LIMIT 1");
        $stmt->bindParam(':server', $server, PDO::PARAM_STR);
        $stmt->execute();
        $server_data = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$server_data) {
            throw new Exception('Server data not found.');
        }

        $dbName = $server_data['data'];

        // Sử dụng biến môi trường để lưu trữ thông tin nhạy cảm
        $dbHost = getenv('DB_HOST') ?: 'localhost';
        $dbUser = getenv('DB_USER') ?: 'root';
        $dbPass = getenv('DB_PASS') ?: 'Vanlien1503';

        $config = array(
            'dbHost' => $dbHost,
            'dbUser' => $dbUser,
            'dbPass' => $dbPass,
            'dbName' => $dbName,
            'dbOptions' => array(
                PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8',
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            )
        );

        $dsn = "mysql:host={$config['dbHost']};port=3306;dbname={$config['dbName']}";
        $dbh = new PDO($dsn, $config['dbUser'], $config['dbPass'], $config['dbOptions']);

    } catch (PDOException $e) {
        $json['status'] = false;
        $json['msg'] = "Lỗi không xác định, vui lòng báo với hỗ trợ viên!";
        // Log lỗi chi tiết để kiểm tra sau, không tiết lộ thông tin chi tiết cho người dùng
        error_log($e->getMessage());
        echo json_encode($json);
        die();
    } catch (Exception $e) {
        $json['status'] = false;
        $json['msg'] = $e->getMessage();
        echo json_encode($json);
        die();
    }
    return $dbh;
}
?>
