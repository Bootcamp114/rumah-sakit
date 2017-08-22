<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Form Pemeriksaan</title>
</head>

<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/resources/assets/css/bootstrap-theme.min.css" />
<script type="text/javascript"
	src="/resources/assets/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	var pemeriksaan;
	$(document).ready(function() {
		var setDiagnosa;
		var dataTable = $('#tableDiagnosa');
		var elementNoDiagnosa = $('#noDiagnosa');
		var elementDiagnosa = $('#diagnosa');
		var elementKeterangan = $('textarea[id ="keterangan"]');
		
		

		$('#save').on('click' , function(){
			savePemeriksaan();
			showData();
		});
		
		$('#saveDiagnosa').on('click', function() {
			var noDiagnosa = elementNoDiagnosa.val();
			var diagnosa = elementDiagnosa.val();
			var keterangan = elementKeterangan.val();
			var tbody = dataTable.find("tbody");
			var trString = "<tr>";
			trString += "<td>" + noDiagnosa	+ "</td>";
			trString += "<td>" + diagnosa+ "</td>";
			trString += "<td>" + keterangan	+ "</td>";
			trString += "<td><a href='#' class='deleteDiagnosa'>delete</a></td>";
			trString += "</tr>";
			tbody.append(trString);		
			$('#diagnosa').val("");
			$('textarea[id ="keluhan"]').val("");
		});

		$(document).on("click", ".deleteDiagnosa", function() {
			var tr = $(this).closest('tr');
	        tr.remove();
		});

		$(document).on("click",".pilih",function(){
			var idDaftar = $(this).attr("idPilih");
			$.ajax({
				url : '/pemeriksaan/getPendaftaranById/'+idDaftar,
				type : 'GET',
				success : function(data){
					pilihDaftar(data);
					console.log(data);
				}
			});
		});
	});
</script>
<!-- <script src="/resources/assets/tinymce/js/tinymce/tinymce.min.js"></script>
<script>
	tinymce.init({
		selector : 'textarea'
	});
</script> -->
<body>
	<div class="container">
		<h1>Form Pemeriksaan Pasien</h1>
		<div class="row">
			<div class="col-md-4">
				<div class="form-group">
					<input type="hidden" name="id" id="id" class="form-control"
						autofocus placeholder="noPemeriksaan" required>
				</div>
				<div class="form-group">
					<label>No Pemeriksaan</label> <input type="text"
						name="noPemeriksaan" id="noPemeriksaan" class="form-control"
						autofocus placeholder="noPemeriksaan" value="PD000${noPeriksa}" readonly required >
				</div>
				<div class="form-group">
					<label>No Daftar</label> 
					<input type="hidden"
						id="idPendaftaran" class="form-control" autofocus
						placeholder="noPendaftaran" required >
					<input type="text"
						id="noPendaftaran" class="form-control" autofocus
						placeholder="noPendaftaran" required readonly> <br>
					<button type="button" class="btn btn-primary btn-md"
						data-toggle="modal" data-target="#modalPendaftaran">
						pilih no daftar</button>
				</div>
				<div class="form-group">
					<label>JenisPemeriksaan</label> <select name="jenisPemeriksaan"
						class="form-control" id="jenisPeriksa">
						<option></option>
						<c:forEach var="listJenis" items="${listJenis}">
							<option value="${listJenis.id}">${listJenis.jenisPemeriksaan}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label>Dokter</label> <select name="dokter" class="form-control"
						id="dokter">
						<option></option>
						<c:forEach var="listDokter" items="${listDokter}">
							<option value="${listDokter.id}">${listDokter.nama}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label>Diagnosa</label> <input type="text" name="noDiagnosa"
						id="noDiagnosa" class="form-control" autofocus
						placeholder="Diagnosa" value="D000${noDiagnosa}" required readonly> <br>
					<button type="button" class="btn btn-primary btn-md"
						data-toggle="modal" data-target="#modalDiagnosa">Klik
						Untuk Diagnosa</button>
						
					<table class="table" id="tableDiagnosa">
						<thead>
							<tr>
								<th>NoDiagnosa</th>
								<th>Diagnosa</th>
								<th>Keterangan</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>
				</div>
				<div class="form-group">
					<label>Tindakan</label> <input type="text" name="tindakan"
						id="tindakan" class="form-control" autofocus
						placeholder="Tindakan" required>
				</div>
				<div class="form-group">
					<label>Berat Badan</label> <input type="number" name="beratBadan"
						id="beratBadan" class="form-control" autofocus
						placeholder="Berat Badan" maxlength="3" size="3" required>
				</div>
				<div class="form-group">
					<label>Tensi Diastolik</label> <input type="number"
						name="tensiDiastolik" id="tensiDiastolik" class="form-control"
						autofocus placeholder="Tensi Diastolik" maxlength="3" size="3"
						required>
				</div>
				<div class="form-group">
					<label>Tensi Sistolik</label> <input type="number"
						name="tensiSistolik" id="tensiSistolik" class="form-control"
						autofocus placeholder="Tensi Sistolik" maxlength="3" size="3"
						required>
				</div>
				<div class="form-group">
					<button type="button" class="btn btn-primary" id="save"
						data-dismiss="modal">Save Changes</button>
					<button type="button" class="btn btn-default" data-dismiss="modal" id="update">Update</button>
				</div>
			</div>
			<div class="col-md-12">
				<table class="table" id="tablePeriksa">
					<thead>
						<tr>
							<th>NoDaftar</th>
							<th>JenisPemeriksaan</th>
							<th>Diagnosa</th>
							<th>Tindakan</th>
							<th>BeratBadan</th>
							<th>TensiDiasitolik</th>
							<th>TensiSistolik</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- modal daftar  -->
	<div class="modal fade" id="modalPendaftaran" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true"></span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Data Pendaftaran</h4>
				</div>
				<div class="modal-body">
					<table class="table" id="tablePendaftaran">
						<thead>
							<tr>
								<th>NoDaftar</th>
								<th>NamaPasien</th>
								<th>PoliKlinik</th>
								<th>Petugas</th>
								<th>Keluhan</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="listDaftar" items="${listDaftar}">
								<tr>
								<td>${listDaftar.nodaftar}</td>
								<td>${listDaftar.pasien.nama}</td>
								<td>${listDaftar.poli.poli}</td>
								<td>${listDaftar.petugas.nama}</td>
								<td>${listDaftar.keluhan}</td>
								<td>
									<a href="#" class="pilih" idPilih="${listDaftar.id}" data-dismiss="modal">Pilih</a>
								</td>
							</tr>
							</c:forEach>						
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- end modal daftar  -->
	<!-- modal diagnosa  -->
	<div class="modal fade" id="modalDiagnosa" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true"></span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Diagnosa</h4>
				</div>
				<div class="modal-body">
					<input type="hidden" id="idDiagnosa" class="form-control" autofocus
						placeholder="noDiagnosa">
					<div class="form-group">
						<label>Diagnosa</label> <input type="text" name="diagnosa"
							id="diagnosa" class="form-control" autofocus
							placeholder="diagnosa" required>
					</div>
					<div class="form-group">
						<label>Keterangan</label>
						<textarea name="keterangan" id="keterangan" class="form-control">
						</textarea>
					</div>
					<div class="form-group">
						<button type="button" class="btn btn-primary" id="saveDiagnosa" data-dismiss="modal">Save
							Changes</button>
						<button type="button" class="btn btn-default" id="updateDiagnosa">Update</button>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- end modal diagnosa  -->
</body>
<script type="text/javascript"
	src="/resources/assets/js/bootstrap.min.js"></script>
<script type="text/javascript">
	/* crud pemeriksaan */
	function savePemeriksaan() {
		var noPemeriksaan = $("#noPemeriksaan").val();
		var noDaftar = $("#idPendaftaran").val();
		var jenisPemeriksaan = $("#jenisPeriksa").val();
		var dokter = $("#dokter").val();
		var tindakan = $("#tindakan").val();
		var beratBadan = $("#beratBadan").val();
		var tensiDiastolik = $("#tensiDiastolik").val();
		var tensiSistolik = $("#tensiSistolik").val();

		 pemeriksaan = {
			noPemeriksaan : noPemeriksaan,
			pendaftaran : {
				id : noDaftar
			},
			jenisPemeriksaan : {
				id : jenisPemeriksaan
			},
			dokter : {
				id : dokter
			},
			tindakan : tindakan,
			beratBadan : beratBadan,
			tensiDiastolik : tensiDiastolik,
			tensiSistolik : tensiSistolik,
			diagnosa : []
		}
		
		var table = $("#tableDiagnosa");
		var tbody = table.find("tbody");
		var tr = tbody.find("tr");
	
		$.each(tr , function(index , data){
		
			setDiagnosa = {
				noDiagnosa : $(this).find("td").eq(0).text(),
				diagnosa : $(this).find("td").eq(1).text(),
				keterangan : $(this).find("td").eq(2).text()
			}
			
			pemeriksaan.diagnosa.push(setDiagnosa);
		});
		
	 	 $.ajax({
			url : '/pemeriksaan/savePemeriksaan',
			type : 'POST',
			contentType : 'application/json',
			dataType : 'json',
			data : JSON.stringify(pemeriksaan),
			success : function(data, x, xhr) {
				console.log(data);
				showData();
				alert("Pemeriksaan Sukses");
			}

		});  
	}
	
	function fillData(data) {
		var dt = $("#tablePeriksa");
		var tbody = dt.find("tbody");
		tbody.find("tr").remove();
		$.each(data,function(index, listPemeriksaan) {
			var trString = "<tr>";
				trString += "<td>" + listPemeriksaan.pendaftaran.nodaftar + "</td>";
				trString += "<td>" + listPemeriksaan.jenisPemeriksaan.jenisPemeriksaan + "</td>";
				trString += "<td>" + listPemeriksaan.diagnosa.diagnosa + "</td>";
				trString += "<td>" + listPemeriksaan.tindakan + "</td>";
				trString += "<td>" + listPemeriksaan.beratBadan + "</td>";
				trString += "<td>" + listPemeriksaan.tensiDiastolik + "</td>";
				trString += "<td>" + listPemeriksaan.tensiSistolik + "</td>";
				trString += "<td><a href='#' class='delete' idDelete='" + listPemeriksaan.id + "'>delete</a></td>";
				trString += "</tr>";
			tbody.append(trString);
		});
	}
	
	function pilihDaftar(data){
		$('#idPendaftaran').val(data.id);
		$('#noPendaftaran').val(data.nodaftar);
	}
	
	function showData(){
		$.ajax({
			url :'/pemeriksaan/getAllPemeriksaan',
			type: 'POST',
			dataType : 'json',
			success : function(data ,x,xhr){
				console.log("data is loaded");
				fillData(data);
			}	
		});
	}
	
	function doDelete(del){
		var id = $(del).attr("idDelete");
		$.ajax({
			url : "/pemeriksaan/delete/"+id,
			type : "DELETE",
			success : function(data){
				console.log(data);
				showData();
			}
		});
	}
	
	function clearForm(){
		$("#noPemeriksaan").val("");
		$("#idPendaftaran").val("");
		$("#jenisPeriksa").val("");
		$("#dokter").val("");
		$("#tindakan").val("");
		$("#beratBadan").val("");
		$("#tensiDiastolik").val("");
		$("#tensiSistolik").val("");
	}
	/* end crud pemeriksaan */
</script>
</html>