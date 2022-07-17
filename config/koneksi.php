<?php

$host = "sql311.epizy.com";
$username = "epiz_32187797";
$password = "8p7AXC92Iwl";
$database = "epiz_32187797_dbpendaftaran";

$koneksi = mysqli_connect($host, $username, $password, $database);

if($koneksi->connect_error){
    echo "Koneksi database gagal: ". mysqli_connect_error();
    die;
} else {
    // echo "Koneksi database berhasil";
}

?>