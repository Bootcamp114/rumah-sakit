<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
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
	$(document).ready(function() {

		$("#save").on("click",function(){	
			save();
			window.location.href="/pembelian/index";
		});
		
		
		$(document).on("click", ".edit", function() {
			var id = $(this).attr("id_edit");

			$.ajax({
				url : '/pembelian/edit/' + id,
				type : 'GET',
				success : function(data) {
					pilihObat(data);
				}
			});
		});
		
		$(document).on("click",".delete",function(){
			var conf = confirm("Yakin mau dihapus?");
			if(conf == true){
				doDelete(this);	
				window.location.href="/pembelian/index";
			}
			
		});
	})
</script>
<body>
	<div class="container">
		<div style="width: 500px; margin: 0 auto">
			<div class="form-group">
				<label>NoFaktur</label> <input readonly type="text" value="FK0${noFaktur }" class="form-control"
					id="noFaktur">
			</div>
			<div class="form-group">
				<label>Obat</label>
				<input type="hidden" id="idObat">
				 <input type="text" readonly class="form-control"
					id="obat">
				<button class="btn btn-info" id="pilih" data-toggle="modal"
					data-target=".bs-example-modal-lg">PILIH</button>
			</div>
			<div class="form-group">
				<label>Harga</label> <input type="text" readonly
					class="form-control" id="harga">
			</div>
			<div class="form-group">
				<label>Jumlah</label> <input type="text" onKeyUp="hitung()"
					class="form-control" id="jumlah">
			</div>
			<div class="form-group">
				<label>Total</label> <input type="text" readonly
					class="form-control" id="total">
			</div>
			<div class="form-group" align="right">
				<button class="btn btn-default" id="save">TAMBAH</button>
			</div>
		</div>
		<table class="table table-bordered" id="tableObat">
			<thead>
				<tr class="info">
					<th>OBAT</th>
					<th>HARGA</th>
					<th>JUMLAH</th>
					<th>TOTAL</th>
					<th>AKSI</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="listDetail" items="${listDetail }">
				<tr>
					<td>${listDetail.obat.obat }</td>
					<td>${listDetail.obat.harga }</td>
					<td>${listDetail.jumlah }</td>
					<td>${listDetail.total }</td>
					<td><a href='#' class='delete' id_delete="${listDetail.id}">DELETE</a></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="col-md-9"></div>
		<div class="form-group col-md-3" align="right">
			<label>Total Harga</label> <input type="text" value="${hitungTotal }" class="form-control"
				id="totalHarga" readonly><br> <label>Bayar</label> <input
				type="text" onKeyUp="hitung2()" class="form-control" id="bayar"><br> <label>Kembalian</label>
			<input type="text" class="form-control" readonly id="kembalian"><br>
			<button class="btn btn-info">SELESAI</button>
		</div>
	</div>

	<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<h1 align="center" class="modal-title">Pilih Obat</h1>
				<hr>	
				<table class="table table-hover">
					<thead>
						<tr class="info">
							<th>OBAT</th>
							<th>HARGA</th>
							<th>JENIS OBAT</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="listObat" items="${listObat }">
							<tr>
								<td><a href="#" id_edit="${listObat.id }" class="edit" data-dismiss="modal">
										${listObat.obat } </a></td>
								<td>${listObat.harga }</td>
								<td>${listObat.jenisObat }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function pilihObat(data) {
		$('#obat').val(data.obat);
		$('#harga').val(data.harga);
		$('#idObat').val(data.id);
	}

	function hitung() {
		var harga = document.getElementById('harga').value;
		var jumlah = document.getElementById('jumlah').value;
		document.getElementById('total').value = harga * jumlah;

	}

	function hitung2() {
		var total = document.getElementById('totalHarga').value;
		var bayar = document.getElementById('bayar').value;
		document.getElementById('kembalian').value = bayar - total;

	}
	
	function save(){
		var noFaktur = $('#noFaktur').val();
		var idObat = $('#idObat').val();
		var jumlah = $('#jumlah').val();
		var total = $('#total').val();
		
		var tableDetail = {
				jumlah : jumlah,
				total : total,
				obat : {
					id : idObat	
				}
				
		}
		
		$.ajax({
			url: '/pembelian/save',
			type: 'POST',
		 	contentType:'application/json',
		 	dataType : 'json',
			data: JSON.stringify(tableDetail), 
			success: function(data,x,xhr){
				console.log(data);
			}
		
		});
	}
	function doDelete(del){
		var id = $(del).attr("id_delete");
		$.ajax({
			url : "/pembelian/delete/"+id,
			type : "DELETE",
			success : function(data){
				console.log(data);
			}
		});
	}
	

</script>
<script type="text/javascript"
	src="/resources/assets/js/bootstrap.min.js"></script>
</html>