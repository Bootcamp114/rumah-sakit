<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

	<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css" />
	<link rel="stylesheet" href="/resources/assets/css/bootstrap-theme.min.css" />
	<script type="text/javascript" src="/resources/assets/jquery-3.2.1.min.js"></script>
<body>
<br>
<h2 align="center">DATA PASIEN</h2><br><br><br><br>
<div class="container">
<table class="table" style="width: 50%; margin-left: 25%;">
<tr>
<td><input type="text" name="id" id="id" hidden/></td>
</tr>
<tr>
<td><input type="text" name="nama" id="nama"  class="form-control" placeholder="masukan nama"/></td>
</tr>
<tr>
<td><input type="text" name="alamat" id="alamat"  class="form-control" placeholder="masukan alamat"/></td>
</tr>
<tr>
<td><input type="text" name="nohp" id="nohp"  class="form-control" placeholder="masukan No.Hp"/></td>
</tr>
<tr>
<td><input type="text" name="umur" id="umur"  class="form-control" placeholder="masukan umur"/></td>
</tr>
<tr>
<td><input type="text" name="jeniskelamin" id="jeniskelamin"  class="form-control" placeholder="masukan jenis kelamin"/></td>
</tr>
<table class="table table-bordered"><br>
	<thead>
		<tr>
			<th>NAMA</th>
			<th>ALAMAT</th>
			<th>NO.HP</th>
			<th>UMUR</th>
			<th>JENIS KELAMIN</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>ZEIN</td>
			<td>BATUNG</td>
			<td>1234567891011</td>
			<td>4</td>
			<td>LAKI-LAKI</td>
		</tr>
	</tbody>
</table>
</div>
</body>
<script type="text/javascript" src="/resources/assets/js/bootstrap.min.js"></script>
</html>