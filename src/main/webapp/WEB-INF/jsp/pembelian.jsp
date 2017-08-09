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
<h1 align="center">Form Pembelian Obat</h1>
<hr>
<div class="container">
<div class="form-group">
<select id="resep" class="form-control col-md-4" style="width:auto">
	<option>No Resep</option>
	<option>R001</option>
</select>
<input type="submit" name="pilih" id="pilih" value="PILIH" class="btn btn-default" style="margin-left:10px">
</div>
<table class="table table-bordered">
	<thead>
		<tr>
			<th>NAMA OBAT</th>
			<th>HARGA</th>
			<th>JUMLAH</th>
			<th>TOTAL</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>Panadol</td>
			<td>1000</td>
			<td>2</td>
			<td>2000</td>
		</tr>
	</tbody>
</table>

<table align="right">
	<tr>
		<td><input type="text" class="form-control" name="total" placeholder="Total Harga Obat"> </td>
	</tr>
	<tr>
		<td><input type="text" class="form-control" name="bayar" placeholder="Bayar Obat"></td>
	</tr>
	<tr>
		<td><input type="text" class="form-control" name="kembalian" placeholder="Kembalian Uang"> </td>
	</tr>
	<tr>
		<td><input type="submit" value="SELESAI" class="btn btn-default"> </td>
	</tr>
</table>
</div> 
</body>
</html>