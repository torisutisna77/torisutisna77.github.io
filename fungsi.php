<?php
include("dbconn.php");
function getKategori($id) {
	global $link;
	$query = "select
				kategori_nama
			from
				kategori
			where
				kategori_id = $id";
	$namakategori = "";
	$result = mysqli_query($link, $query);
	if ($result) {
		list($namakategori) = mysqli_fetch_array($result);
		mysqli_free_result($result);
	}
	return $namakategori;
}
?>