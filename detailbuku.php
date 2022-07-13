<html>
<head>
<title>Toko Buku Online</title>
<link href="framelayout.css" rel="stylesheet"
	type="text/css" />
</head>
<body>
<?php
include("dbconn.php");

$isbn = $_GET['isbn'];
?>
<h2>Detail Buku</h2>

<?php

$query = "select
				a.buku_isbn,
				a.buku_judul,
				c.pengarang_nama,
				b.penerbit_nama,
				a.buku_harga,
				a.buku_tglterbit,
				a.buku_jmlhalaman,
				a.buku_deskripsi
			from
				buku a,
				penerbit b,
				pengarang c,
				link_buku_pengarang d
			where
				a.penerbit_id = b.penerbit_id and
				a.buku_isbn = d.buku_isbn and
				c.pengarang_id = d.pengarang_id and
				a.buku_isbn = '$isbn'";
				
$result = mysqli_query($link, $query);
if ($result) {
	list($buku_isbn, $buku_judul, $pengarang_nama,
		 $penerbit_nama, $buku_harga, $buku_tglterbit,
		 $buku_jmlhalaman, $buku_deskripsi) = 
		mysqli_fetch_array($result);
		?>
		<table class="buku">
		<tr>
			<td width="200" align="left">ISBN</td>
			<td width="490" align="left">
			<strong><?php echo $buku_isbn; ?></strong></td>
		</tr>
		<tr>
			<td width="200" align="left">Judul</td>
			<td width="490" align="left">
			<strong><?php echo $buku_judul; ?></strong></td>
		</tr>
		<tr>
			<td width="200" align="left">Pengarang</td>
			<td width="490" align="left">
			<strong><?php echo $pengarang_nama; ?></strong></td>
		</tr>
		<tr>
			<td width="200" align="left">Harga</td>
			<td width="490" align="left">
			<strong><?php echo $buku_harga; ?></strong></td>
		</tr>
		<tr>
			<td width="200" align="left">Tanggal</td>
			<td width="490" align="left">
			<strong><?php echo $buku_tglterbit; ?></strong></td>
		</tr>
		<tr>
			<td width="200" align="left">Jumlah Halaman</td>
			<td width="490" align="left">
			<strong><?php echo $buku_jmlhalaman; ?></strong></td>
		</tr>
		<tr>
			<td width="200" align="left"
			valign="top">Deskripsi</td>
			<td width="490" align="left">
			<?php echo $buku_deskripsi; ?></td>
		</tr>
		</table>
		<?php
		mysqli_free_result($result);
}
?>

<p><input type="button" value="Pesan"
onClick="document.location.href='pesan.php'"></p>

</body>
</html>