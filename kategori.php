<html>
<head>
<title>Toko Buku Online</title>
<link href="layout.css" rel="stylesheet" type="text/css"/>
</head>
<body>

<?php
include("dbconn.php");

$query = "select
				kategori_id,
				kategori_nama
			from
				kategori
			order by kategori_nama";
$result = mysqli_query($link, $query);
if ($result) {
	?>
	<ul>
	<?php
	while ($row = mysqli_fetch_array($result)) {
		?>
		<li>
			<a href="daftarbuku.php?kat=<?php echo $row[0];?>"
			   target="frmMain"><?php echo $row[1];?></a>
		</li>
		<?php
	}
	mysqli_free_result($result);
	?>
	</ul>
	<?php
}
?>
</body>
</html>