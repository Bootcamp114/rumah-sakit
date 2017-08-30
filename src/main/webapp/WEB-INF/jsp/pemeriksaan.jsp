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
	<link rel="stylesheet" href="/resources/assets/parsley.css" />
<script type="text/javascript"
	src="/resources/assets/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="/resources/assets/parsley.min.js"></script>
	 <script>
		function hanyaAngka(evt) {
		  var charCode = (evt.which) ? evt.which : event.keyCode
		   if (charCode > 31 && (charCode < 48 || charCode > 57))
 
		    return false;
		  return true;
		}
	</script>
<script type="text/javascript">
	var pemeriksaan;
	$(document).ready(function() {
		
		var setDiagnosa;
		var dataTable = $('#tableDiagnosa');
		var elementNoDiagnosa = $('#noDiagnosa');
		var elementDiagnosa = $('#diagnosa');
		var elementKeterangan = $('textarea[id ="keterangan"]');
		
		

		$('#save').on('click' , function(){
			if($("#formPemeriksaan").parsley().validate()){
				savePemeriksaan();	
			}
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
			trString += "<td><a href='#' class='deleteDiagnosa'>delete</a>  |  <a href='#' class='editDiagnosa'>edit</a></td>";
			trString += "</tr>";
			tbody.append(trString);		
			$('#diagnosa').val("");
			$('textarea[id="keterangan"]').val("");
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
		
		$(document).on('click','.editDiagnosa',function(){
			$('#modalDiagnosaUpdate').modal();
			oTr = $(this).closest('tr');
			var td1 = oTr.find('td').eq(1).text();
			var td2 = oTr.find('td').eq(2).text();

			$('#diagnosaUpdate').val(td1);
			$('#keteranganUpdate').val(td2);
		});
		
		$('#updateDiagnosa').on("click",function(){
			oTr.find('td').eq(1).text($('#diagnosaUpdate').val());
			oTr.find('td').eq(2).text($('#keteranganUpdate').val());
		});
		
		$(document).on("click", ".detailPendaftaran", function() {
			var idDaftar = $(this).attr("idDetailPendaftaran");
			$.ajax({
				url : '/pemeriksaan/getPendaftaranById/'+idDaftar,
				type : 'GET',
				success : function(data){
					pilihDetailDaftar(data);
					console.log(data);
					$("#modalDetailPendaftaran").modal();
				}
			});
			
		});
		
		$(document).on("click", ".detailDiagnosa", function() {
			var idPeriksa = $(this).attr("idDetailDiagnosa");
			showDataDetail(idPeriksa);
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
<form action="" onSubmit="return false" id="formPemeriksaan" data-parsley-validate>
	<div class="container">
		<h1>Form Pemeriksaan Pasien</h1>
		<div class="row">
			<div class="col-md-4">
				<div class="form-group">
					<input type="hidden" name="id" id="id" class="form-control"
						autofocus placeholder="noPemeriksaan" >
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
						class="form-control" id="jenisPeriksa" required>
						<option></option>
						<c:forEach var="listJenis" items="${listJenis}">
							<option value="${listJenis.id}">${listJenis.jenisPemeriksaan}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label>Dokter</label> <select name="dokter" class="form-control"
						id="dokter" required>
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
					<label>Berat Badan</label> <input type="text" name="beratBadan"
						id="beratBadan" class="form-control" autofocus
						placeholder="Berat Badan" maxlength="3" size="3" min="1" required onkeypress="return hanyaAngka(event)">
				</div>
				<div class="form-group">
					<label>Tensi Diastolik</label> <input type="text"
						name="tensiDiastolik" id="tensiDiastolik" class="form-control"
						autofocus placeholder="Tensi Diastolik" maxlength="3" size="3" min="1"
						required onkeypress="return hanyaAngka(event)">
				</div>
				<div class="form-group">
					<label>Tensi Sistolik</label> <input type="text"
						name="tensiSistolik" id="tensiSistolik" class="form-control"
						autofocus placeholder="Tensi Sistolik" maxlength="3" size="3" min="1"
						required onkeypress="return hanyaAngka(event)">
				</div>
				<div class="form-group">
					<button type="button" class="btn btn-primary" id="save">Proses Pemeriksaan</button>
				</div>
			</div>
			<div class="col-md-12">
				<table class="table" id="tablePeriksa">
					<thead>
						<tr>
							<th>NoDaftar</th>
							<th>JenisPemeriksaan</th>
							<th>Tindakan</th>
							<th>BeratBadan</th>
							<th>TensiDiasitolik</th>
							<th>TensiSistolik</th>
							<th>Dokter</th>
							<th>Diagnosa</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="listPemeriksaan" items="${listPemeriksaan}">
						<tr>
							<td><a href="#" class="detailPendaftaran" idDetailPendaftaran = "${listPemeriksaan.pendaftaran.id}" >${listPemeriksaan.pendaftaran.nodaftar}</a></td>
							<td>${listPemeriksaan.jenisPemeriksaan.jenisPemeriksaan}</td>
							<td>${listPemeriksaan.tindakan}</td>
							<td>${listPemeriksaan.beratBadan}</td>
							<td>${listPemeriksaan.tensiDiastolik}</td>
							<td>${listPemeriksaan.tensiSistolik}</td>
							<td>${listPemeriksaan.dokter.nama}</td>
							<td><a href="#" class="detailDiagnosa" idDetailDiagnosa = "${listPemeriksaan.id}">detail</a></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</form>
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
						<button type="button" class="btn btn-primary" id="saveDiagnosa" data-dismiss="modal">Tambah Diagnosa</button>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- end modal diagnosa  -->
	<!-- modal diagnosa update -->
	<div class="modal fade" id="modalDiagnosaUpdate" tabindex="-1" role="dialog"
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
							id="diagnosaUpdate" class="form-control" autofocus
							placeholder="diagnosa" required>
					</div>
					<div class="form-group">
						<label>Keterangan</label>
						<textarea name="keterangan" id="keteranganUpdate" class="form-control">
						</textarea>
					</div>
					<div class="form-group">
						<button type="button" class="btn btn-primary" id="updateDiagnosa" data-dismiss="modal">Ubah</button>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- end modal diagnosa  -->
	<!-- start modal barang detail-->
	<div class="modal fade bs-example-modal-sm" id="modalDetailPendaftaran" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  		<div class="modal-dialog modal-sm" role="document">
    		<div class="modal-content">
      			<div class="modal-header">
        			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>
        			<h4 class="modal-title" id="myModalLabel">Data Pendaftaran</h4>
      			</div>
      			<div class="modal-body">
		        	<label>Nama  </label>
		        		<div class="form-group">
							<input type="text" id="namaDetail" class="form-control">
						</div>
		        	<label>Keluhan : </label>
			        	<div class="form-group">
							<input type="text" id="keluhanDetail" class="form-control">
						</div>
		        	<label>Petugas : </label>
		        		<div class="form-group">
							<input type="text" id="petugasDetail" class="form-control">
						</div>
		        	<label>Poli    : </label>
		        		<div class="form-group">
							<input type="text" id="poliDetail" class="form-control">
						</div>
      			</div>
    		</div>
  		</div>
	</div>
	<!-- end modal barang detail -->
	<!-- start modal barang detail-->
	<div class="modal fade " id="modalDiagnosaDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  		<div class="modal-dialog" role="document">
    		<div class="modal-content">
      			<div class="modal-header">
        			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>
        			<h4 class="modal-title" id="myModalLabel">DetailDiagnosa</h4>
      			</div>
      			<div class="modal-body">
		        	<table id="tableDetailDiagnosa" class="table">
						<thead>
							<tr>
								<th>Diagnosa</th>
								<th>Keterangan</th>
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
				alert("Pemeriksaan Sukses");
				document.location = "./pemeriksaan";
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
	
	function pilihDetailDaftar(data){
		$('#namaDetail').val(data.pasien.nama);
		$('#keluhanDetail').val(data.keluhan);
		$('#petugasDetail').val(data.petugas.nama);
		$('#poliDetail').val(data.poli.poli);
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
	
	function detailDiagnosa(data){
		var dt = $("#tableDetailDiagnosa");
		var tbody = dt.find("tbody");
		tbody.find("tr").remove();
		$.each(data, function(index , listDiagnosa){
			var trString = "<tr>";
					trString += "<td>" + listDiagnosa.diagnosa + "</td>";
					trString += "<td>" + listDiagnosa.keterangan + "</td>";
				trString +="</tr>";
			tbody.append(trString);
		});
	}
	
	function showDataDetail(id){
		$.ajax({
			url :'/pemeriksaan/getdiagnosaByIdPeriksa/'+id,
			type: 'GET',
			dataType : 'json',
			success : function(data ,x,xhr){
				console.log(data);
				detailDiagnosa(data);
				$("#modalDiagnosaDetail").modal();
			}	
		});
	}
	/* end crud pemeriksaan */
</script>
</html>