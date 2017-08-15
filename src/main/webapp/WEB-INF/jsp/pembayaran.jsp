<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/resources/assets/css/bootstrap-theme.min.css" />
<script type="text/javascript"
	src="/resources/assets/jquery-3.2.1.min.js"></script>
<body>
	<h1 align="center">Form Pembayaran Obat</h1>
	<hr>
	<div class="container">
		<div class="row">
			<div class="col-md-3">
					<input type="text" name="no_resep" class="form-control" readonly> 
			</div>
			<div class="col-md-2">
				<input type="submit" data-toggle="modal" data-target="#modalPilih" value="PILIH" class="btn btn-default btn-md"  > 
			</div>
		</div>
		<br>
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
				<td><input type="text" class="form-control" name="total"
					placeholder="Total Harga Obat"></td>
			</tr>
			<tr>
				<td><input type="text" class="form-control" name="bayar"
					placeholder="Bayar Obat"></td>
			</tr>
			<tr>
				<td><input type="text" class="form-control" name="kembalian"
					placeholder="Kembalian Uang"></td>
			</tr>
			<tr>
				<td><input type="submit" value="SELESAI"
					class="btn btn-default"></td>
			</tr>
		</table>
	</div>
	
	<!-- modal Resep  -->
	<div class="modal fade bs-example-modal-lg" id="modalPilih" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  		<div class="modal-dialog modal-lg" role="document">
    		<div class="modal-content">
      			<div class="modal-header">
        			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>
        			<h4 class="modal-title" id="myModalLabel">Pilih Data Resep</h4>
      			</div>
      			<div class="modal-body">
        			<table class="table table-striped" id="tablePeriksa">
				<thead>
					<tr class="info">
						<th>NO RESEP</th>
						<th>NO URUT</th>
						<th>NAMA PASIEN</th>
						<th>NAMA DOKTER</th>
					</tr>
				</thead>
				<tbody>
					<tr>
					<c:forEach var="listResep" items="${listResep }">
						<td><a href="#">${listResep.noResep }</a></td>
						<td>${listResep.pendaftaran }</td>
						<td>${listResep.pendaftaran }</td>
						<td>${listResep.pendaftaran }</td>
					</c:forEach>
					</tr>
				</tbody>
			</table>
      			</div>
      			<div class="modal-footer">
        			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      			</div>
    		</div>
  		</div>
	</div>
<!-- end modal diagnosa  -->
</body>
<script type="text/javascript" src="/resources/assets/js/bootstrap.min.js"></script>
</html>