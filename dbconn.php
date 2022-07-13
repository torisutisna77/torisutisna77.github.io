<?php
$host = "localhost";
$dbusername = "root";
$dbpassword = "";
$dbname = "bukudb";

$link = mysqli_connect($host, $dbusername, $dbpassword, $dbname);
if (mysqli_connect_errno()) {
	echo "Koneksi Gagal";
	exit();
} else {
	//echo "koneksi Sukses";
}
?>