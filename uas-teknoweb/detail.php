<?php
include_once "fungsi.php";
include_once "header.php";

$id_reptile = $_GET['id_reptile'];
$sql = "SELECT*FROM view_reptile WHERE id_reptile ='$id_reptile'";
$query = $koneksi->prepare($sql);
$query->execute ();
$data = $query->fetch(PDO::FETCH_OBJ);
?>


        <h2 class="text-secondary text-center"><?php echo $data->nama_reptile;?></h2>
        <div class="row">
            <div class="sm-6 md-6 col mb0">
                <a href="#">
                    <img src="aset/gambar/<?php echo $data->foto;?>">
                </a>
            </div>
            <div class="sm-6 md-6 col mb0">
                <dl>
                    <dt><b>KATEGORI</b></dt>
                    <dd><?php echo $data->nama_kategori;?></dd>

                    <dt><b>HEWAN</b></dt>
                    <dd><?php echo $data->nama_reptile;?></dd>

                    <dt><b>HABITAT</b></dt>
                    <dd><?php echo $data->habitat;?></dd>

                    <dt><b>DESKRIPSI</b></dt>
                    <dd><?php echo $data->deskripsi;?></dd>
                </dl>
            </div>
        </div>
    
        <?php
include_once "footer.php";
?>
