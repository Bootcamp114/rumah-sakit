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
<script type="text/javascript">
$(document).ready(function(){
	$(".pilih").on("click",function(){
		var id = $(this).attr("id_resep");
		$.ajax({
			url : '/pembayaran/getbyresep/' + id,
			type : 'GET',
			success : function(data) {
				tampilObat(data);
			}
		});
	})

})

</script>
<body>
	<h1 align="center">Form Pembayaran Obat</h1>
	<hr>
	<div class="container">
		<div class="row">
			<div class="col-md-3">
			<input type="hidden" id="idResep" >
					<input type="text" id="resep" name="no_resep" class="form-control" readonly> 
			</div>
			<div class="col-md-2">
				<input type="submit" data-toggle="modal" data-target="#modalPilih" value="PILIH" class="btn btn-default btn-md"  > 
			</div>
		</div>
		<br>
		<table id="tableObat" class="table table-bordered">
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
				<td><input type="submit" id="selesai" value="SELESAI"
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
					<c:forEach var="listResep" items="${listResep}">
						<td><a href="#" class="pilih" id_resep="${listResep.id }">${listResep.noResep }</a></td>
						<td>${listResep.pendaftaran.id }</td>
						<td>${listResep.pendaftaran.pasien.nama }</td>
						<td>${listResep.dokter.nama }</td>
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
<script type="text/javascript">
function tampilObat(){
	var dt = $("#tableObat");
	var tbody = dt.find("tbody");
	tbody.find("tr").remove();
	$.each(data, function(index , detailResep){
		var trString = "<tr>";
				trString += "<td>" + detailResep.obat.obat + "</td>";
				trString += "<td>" + detailResep.obat.harga + "</td>";
				trString += "<td>" + detailResep.jumlah + "</td>";
				trString += "<td>" + detailResep.total + "</td>";
			trString +="</tr>";
		tbody.append(trString);
		$('#idResep').val(detailResep.id);
	});
}

function selesai(){
	var noBeli = $('#noBeli');
	var total = $('#total');
	var resep = $('#resep');
	
	var tableDetail = {
		noBeli : noBeli,
		tanggal : tanggal,
		total : total,
		resep : {
			id : idResep
		}
	}
	
	$.ajax({
		url : '/pembayaran/save',
		type : 'POST',
		contentType : 'application/json',
		dataType : 'json',
		data : JSON.stringify(tableObat),
		success : function(data,x,xhr){
			clearForm();
		}
	});
}
</script>

<script type="text/javascript" src="/resources/assets/js/bootstrap.min.js"></script>
</html>