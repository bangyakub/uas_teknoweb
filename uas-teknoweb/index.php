<?php
include_once "fungsi.php";
include_once "header.php";
?>

<div class="row">
<?php
$sql = "SELECT * FROM view_reptile";
$query = $koneksi->prepare($sql);
$query->execute();
while($data = $query->fetch(PDO::FETCH_OBJ)) {
?>
		<div class="sm-6 md-4 col mb0">
			<a href="detail.php?id_reptile=<?php echo $data->id_reptile;
			?>">
				<img src="aset/gambar/<?php echo $data->foto; ?>">
			</a>
		</div>
<?php
}
?>
	</div>

<?php
include_once "footer.php";
?>
