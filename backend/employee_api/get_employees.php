<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

header("Content-Type: application/json");
include 'db.php';

$sql = "SELECT * FROM employees";
$result = $conn->query($sql);

if (!$result) {
    die("Query Failed: " . $conn->error);
}

$employees = [];

while ($row = $result->fetch_assoc()) {

    $joining_date = new DateTime($row['joining_date']);
    $today = new DateTime();
    $experience = $today->diff($joining_date)->y;

    $row['experience'] = $experience;

    $employees[] = $row;
}

echo json_encode($employees);
?>