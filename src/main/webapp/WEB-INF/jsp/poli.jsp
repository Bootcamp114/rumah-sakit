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
<h2 align="center">DATA POLI</h2><br><br><br><br>
<div class="container">
<table class="table" style="width: 50%; margin-left: 25%;">
<tr>
<td><input type="text" name="id" id="id" hidden/></td>
</tr>
<tr>
<td><input type="text" name="poli" id="poli"  class="form-control" placeholder="masukan Poli"/></td>
</tr>
<tr>
<td><input type="text" name="ruangan" id="ruangan"  class="form-control" placeholder="masukan ruangan"/></td>
</tr>
<tr>
<td><input type="text" name="biaya" id="biaya"  class="form-control" placeholder="masukan biaya"/></td>
</tr>
<input type="submit" value="SIMPAN" class="btn btn-default" style="margin-left: 10px;">
<table class="table table-bordered"><br>
	<thead>
		<tr>
			<th>POLI</th>
			<th>RUANGAN</th>
			<th>BIAYA</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>Mata</td>
			<td>A012</td>
			<td>500000</td>
		</tr>
	</tbody>
</table>
</div>
</body>
<script type="text/javascript" src="/resources/assets/js/bootstrap.min.js"></script>
</html>