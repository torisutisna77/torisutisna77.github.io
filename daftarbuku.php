<html>
<head>
<title>Toko Buku Online</title>
<link href="framelayout.css" rel="stylesheet"
	type="text/css" />
</head>
<body>
<?php
include("dbconn.php");
include("fungsi.php");

$idkategori = $_GET['kat'];
$namakategori = getKategori($idkategori);
?>
<h2>Daftar Buku <?php echo $namakategori; ?></h2>

<?php
$query = "select
				a.buku_isbn,
				a.buku_judul,
				b.penerbit_nama,
				a.buku_harga
			from
				buku a,
				penerbit b,
				link_buku_kategori c
			where
				a.penerbit_id = b.penerbit_id and
				a.buku_isbn = c.buku_isbn and
				c.kategori_id = $idkategori";
				
$result = mysqli_query($link, $query);
if ($result) {
	?>
	<table class="buku">
	<tr>
		<th width="100">ISBN</th>
		<th width="250">Judul</th>
		<th width="150">Penerbit</th>
		<th width="80">Harga</th>
		<th>Detail</th>
	</tr>
	<?php
while ($row = mysqli_fetch_array($result)) {
	?>
	<tr>
		<td><?php echo $row[0];?></td>
		<td align="left"><?php echo $row[1];?></td>
		<td align="left"><?php echo $row[2];?></td>
		<td align="right">
		<?php echo "Rp".
		number_format($row[3],0,'','.') . ",-";?>
		</td>
			<td><a href="detailbuku.php?isbn=
			<?php echo $row[0];?>">Lihat Detail</a>
		</td>
	</tr>
		<?php
	}
	?>
	</table>
	<?php
	mysqli_free_result($result);
}
?>
</body>
</html>