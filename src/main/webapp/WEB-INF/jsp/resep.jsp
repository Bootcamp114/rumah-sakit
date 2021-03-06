<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Form Resep</title>
</head>

	<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css" />
	<link rel="stylesheet" href="/resources/assets/css/bootstrap-theme.min.css" />
	<script type="text/javascript" src="/resources/assets/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		var resep;
		$(document).ready(function(){
			$("#update").hide();
			
			var setDetailResep;
			var dataTable = $("#tableResep");
			var elementId = $("#idObat");
			var elementObat = $("#obat");
			var elementDosis = $("#dosis");
			var elementJumlah = $("#jumlah");
			
			$("#save").on("click",function(){	
				save();	
				showData();	
				clearForm();
			});
			
			$("#add").on("click" , function(){
				var id = elementId.val();
				var obat = elementObat.val();
				var dosis = elementDosis.val();
				var jumlah = elementJumlah.val();
				var tbody = dataTable.find("tbody");
				var trString = "<tr>";
				trString += "<td>" + id	+ "</td>";
				trString += "<td>" + obat + "</td>";
				trString += "<td>" + dosis	+ "</td>";
				trString += "<td>" + jumlah	+ "</td>";
				trString += "<td><a href='#' class='delete'>delete</a>  |  <a href='#' class='edit'>edit</a></td>";
				trString += "</tr>";
				tbody.append(trString);		
				elementId.val("");
				elementObat.val("");
				elementDosis.val("");
				elementJumlah.val("");
			});
			
			$(document).on("click",".delete",function(){
				var tr = $(this).closest('tr');
		        tr.remove();
			});
			
			$(document).on("click",".edit",function(){
				oTr = $(this).closest('tr');
				var td0 = oTr.find('td').eq(0).text();
				var td1 = oTr.find('td').eq(1).text();
				var td2 = oTr.find('td').eq(2).text();
				var td3 = oTr.find('td').eq(3).text();

				$("#idObat").val(td0);
				$("#obat").val(td1);
				$("#dosis").val(td2);
				$("#jumlah").val(td3);
				
				$("#update").fadeIn();
				$("#add").hide();
			});
			
			$('#update').on("click",function(){
				oTr.find('td').eq(0).text($('#idObat').val());
				oTr.find('td').eq(1).text($('#obat').val());
				oTr.find('td').eq(2).text($('#dosis').val());
				oTr.find('td').eq(3).text($('#jumlah').val());
				elementId.val("");
				elementObat.val("");
				elementDosis.val("");
				elementJumlah.val("");
				$("#update").hide();
				$("#add").fadeIn();
			});
			
			
			$(document).on("click",".pilihObat",function(){
				var id = $(this).attr("idPilihObat");
				
				$.ajax({
					url : '/resep/getObatById/'+id,
					type : 'GET',
					success : function(data){
						pilihObat(data);
					}
				});
			});
			
			$(document).on("click",".pilihDaftar",function(){
				var id = $(this).attr("idPilihPendaftaran");
				
				$.ajax({
					url : '/resep/getPasienById/'+id,
					type : 'GET',
					success : function(data){
						pilihPasien(data);
					}
				});
			});
			
			$(document).on("click",".detailObat",function(){
				$("#modalDetailObat").modal();
				 var id = $(this).attr("idDetailObat");
				$.ajax({
					url : '/resep/getDetailById/'+id,
					type : 'GET',
					success : function(data){
						detailObat(data);
					}
				}); 
			});
			
		});
	</script>

<body>
	<div class="container">
		<h1>Form Resep</h1>
		<div class="row">
			<div class="col-md-4">
				<div class="form-group">
					<input type="hidden" name="id" id="id" class="form-control" autofocus placeholder="noPemeriksaan" required>	
				</div>
				<div class="form-group">
					<label>No Resep</label>
					<input type="text" id="noResep" class="form-control" autofocus placeholder="Masukan NoResep" value="R000${noResep}" readonly required >	
				</div>
				<div class="form-group">
					<label>Dokter</label>
					<select class="form-control" id="dokter">
						<option></option>
						<c:forEach var="listDokter" items="${listDokter}">
							<option value="${listDokter.id}">${listDokter.nama}</option>
						</c:forEach>
					</select>
				</div>
					<div class="form-group">
					<label>Pasien</label>
					<input type="hidden" id="idPendaftaran" class="form-control"required readonly>
					<input type="text" id="pendaftaran" class="form-control" autofocus placeholder="Pasien" required readonly>	
					<br>
					<button type="button" class="btn btn-primary btn-md" data-toggle="modal" data-target="#modalPasien" id="showPoli">
	  					Pilih Pasien
					</button>
				</div>
					<div class="form-group">
					<label>Obat</label>
					<input type="hidden" id="idObat" class="form-control" autofocus placeholder="Poli" required readonly>
					<input type="text" id="obat" class="form-control" autofocus placeholder="Obat" required readonly>	
					<br>
					<button type="button" class="btn btn-primary btn-md" data-toggle="modal" data-target="#modalObat" id="showPoli">
	  					Pilih Obat
					</button>
				</div>
				<div class="form-group">
					<label>Dosis</label>
					<select id="dosis" class="form-control">
						<option>Dosis</option>
						<option value="3 x 1">3 x 1</option>
						<option value="2 x 1">2 x 1</option>
						<option value="1 x 1">1 x 1</option>
					</select>
				</div>
				<div class="form-group">
					<label>Jumlah</label>
					<input type="number" id="jumlah" class="form-control" autofocus placeholder="Masukan Jumlah"  required >	
				</div>
				<div class="form-group">
					<button type="button" class="btn btn-info" id="add">Add</button>
					<button type="button" class="btn" id="update">Update</button>		
				</div>
			</div>
			<div class="col-md-8">
				<table class="table" id="tableResep">
					<thead>
						<tr>
							<th>ID</th>
							<th>Obat</th>
							<th>Dosis</th>
							<th>Jumlah</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						
					</tbody>
				</table>
				<button type="button" class="btn btn-primary" id="save">Save Changes</button>
			</div>
			<div class="col-md-8">
				<table class="table" id="tableResep">
					<thead>
						<tr>
							<th>NoResep</th>
							<th>Dokter</th>
							<th>Pasien</th>
							<th>Obat</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="listResep" items="${listResep}">
							<tr>
								<td>${listResep.noResep}</td>
								<td>${listResep.dokter.nama}</td>
								<td>${listResep.pendaftaran.pasien.nama}</td>
								<td><a href="#" class="detailObat" idDetailObat="${listResep.id}">detail</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
<!-- modal periksa  -->
	<div class="modal fade" id="modalPasien" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  		<div class="modal-dialog" role="document">
    		<div class="modal-content">
      			<div class="modal-header">
        			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>
        			<h4 class="modal-title" id="myModalLabel">Data Pasien</h4>
      			</div>
      			<div class="modal-body">
		        	<table class="table" id="tablePasien">
						<thead>
							<tr>
								<th>NoPendaftaran</th>
								<th>Pasien</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="listDaftar" items="${listDaftar}">
								<tr>
									<td>${listDaftar.nodaftar}</td>
									<td>${listDaftar.pasien.nama}</td>
									<td>
										<a href='#' class='pilihDaftar' idPilihPendaftaran='${listDaftar.id}' data-dismiss="modal">Pilih</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
      			</div>
      			<div class="modal-footer">
        			<!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
      			</div>
    		</div>
  		</div>
	</div>
<!-- end modal periksa  -->
<!-- modal periksa  -->
	<div class="modal fade" id="modalObat" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  		<div class="modal-dialog" role="document">
    		<div class="modal-content">
      			<div class="modal-header">
        			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>
        			<h4 class="modal-title" id="myModalLabel">Data Obat</h4>
      			</div>
      			<div class="modal-body">
		        	<table class="table" id="tablePasien">
						<thead>
							<tr>
								<th>Obat</th>
								<th>JenisObat</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="listObat" items="${listObat}">
								<tr>
									<td>${listObat.obat}</td>
									<td>${listObat.jenisObat}</td>
									<td>
										<a href='#' class='pilihObat' idPilihObat='${listObat.id}' data-dismiss="modal">Pilih</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
      			</div>
      			<div class="modal-footer">
        			<!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
      			</div>
    		</div>
  		</div>
	</div>
<!-- end modal periksa  -->
<!-- start modal barang detail-->
	<div class="modal fade" id="modalDetailObat" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  		<div class="modal-dialog" role="document">
    		<div class="modal-content">
      			<div class="modal-header">
        			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>
        			<h4 class="modal-title" id="myModalLabel">Data Obat</h4>
      			</div>
      			<div class="modal-body">
		        	<table id="tableDetail" class="table">
						<thead>
							<tr>
								<th>Obat</th>
								<th>Jumlah</th>
								<th>Dosis</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
      			</div>
    		</div>
  		</div>
	</div>
	<!-- end modal barang detail -->
</body>
	<script type="text/javascript">
		function save(){
			var noResep = $('#noResep').val();
			var pasien = $('#idPendaftaran').val();
			var dokter = $('#dokter').val();
			var obat = $('#idObat').val();
			var dosis = $('#dosis').val();
			var jumlah = $('#jumlah').val();
			var resep = {
					noResep : noResep,
					dokter : {
						id : dokter
					},
					pendaftaran : {
						id : pasien
					},
					obat : {
						id : obat
					},
					detailResep : []
					
			}
			
			var table = $("#tableResep");
			var tbody = table.find("tbody");
			var tr = tbody.find("tr");
		
			$.each(tr , function(index , data){
			
				setDetailResep = {
					obat : {
						id  : $(this).find("td").eq(0).text()
					},
					dosis : $(this).find("td").eq(2).text(),
					jumlah : $(this).find("td").eq(3).text()
				}
				
				resep.detailResep.push(setDetailResep);
			});
			
			$.ajax({
				url: '/resep/save',
				type: 'POST',
			 	contentType:'application/json',
			 	dataType : 'json',
				data: JSON.stringify(resep), 
				success: function(data,x,xhr){
					console.log()
					window.location = "/resep";
				}
			
			});
		}
		
		
		function updateColumn(data){
			$('#noResep').val(data.noResep);
			$('#idPendaftaran').val(data.pendaftaran.id);
			$('#pendaftaran').val(data.pendaftaran.pasien.nama);
			$('#idObat').val(data.obat.id);
			$('#obat').val(data.obat.obat);
			$('#dosis').val(data.dosis);
			$('#jumlah').val(data.jumlah);
			$('#id').val(data.id);
		}
		
		function pilihPasien(data){
			$('#idPendaftaran').val(data.id);
			$('#pendaftaran').val(data.pasien.nama);
		}
		
		function pilihObat(data){
			$('#idObat').val(data.id);
			$('#obat').val(data.obat);
		}
		
		function clearForm(){
			$('#idPendaftaran').val("");
			$('#pendaftaran').val("");
			$('#idObat').val("");
			$('#obat').val("");
			$('#dosis').val("");
			$('#jumlah').val("");
			$('#id').val(data.id);
		}
		
		function detailObat(data){
			var dt = $("#tableDetail");
			var tbody = dt.find("tbody");
			tbody.find("tr").remove();
			$.each(data, function(index , listDetail){
				var trString = "<tr>";
						trString += "<td>" + listDetail.obat + "</td>";
						trString += "<td>" + listDetail.jumlah + "</td>";
						trString += "<td>" + listDetail.dosis + "</td>";
					trString +="</tr>";
				tbody.append(trString);
			});
		}
	</script>
	<script type="text/javascript" src="/resources/assets/js/bootstrap.min.js"></script>
</html>