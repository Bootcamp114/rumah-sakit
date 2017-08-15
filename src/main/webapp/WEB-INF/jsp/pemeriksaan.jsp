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
	$(document).ready(function() {

		showDataDiagnosa();

		$('#save').on('click' , function(){
			savePemeriksaan();
			alert();
		});
		
		$('#saveDiagnosa').on('click', function() {
			saveDiagnosa();
			showDataDiagnosa();
			clearFormDiagnosa();
		});

		$(document).on("click", ".deleteDiagnosa", function() {
			var conf = confirm("Apakah yakin akan dihapus ? ");
			if (conf == true) {
				doDeleteDiagnosa(this);
			}
		});

		$(document).on("click", ".updateDiagnosa", function() {
			var id = $(this).attr("idUpdateDiagnosa");

			$.ajax({
				url : '/pemeriksaan/getDiagnosaById/' + id,
				type : 'GET',
				success : function(data) {
					updateColumnDiagnosa(data);
				}
			});
		});

		$("#updateDiagnosa").on("click", function() {
			updateDiagnosa();
			showDataDiagnosa();
			clearFormDiagnosa();
			alert("Terupdate");
		});
	});
</script>
<script src="/resources/assets/tinymce/js/tinymce/tinymce.min.js"></script>
<script>
	tinymce.init({
		selector : 'textarea'
	});
</script>
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
						autofocus placeholder="noPemeriksaan" required >
				</div>
				<div class="form-group">
					<label>No Daftar</label> <input type="text" name="noPendafaran"
						id="noPendafaran" class="form-control" autofocus
						placeholder="noPendaftaran" required > <br>
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
							<option value="${lisDokter.id}">${listDokter.nama}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label>Diagnosa</label> <input type="text" name="noDiagnosa"
						id="noDiagnosa" class="form-control" autofocus
						placeholder="Diagnosa" value="D001" required readonly> <br>
					<button type="button" class="btn btn-primary btn-md"
						data-toggle="modal" data-target="#modalDiagnosa">Klik
						Untuk Diagnosa</button>
				</div>
				<div class="form-group">
					<label>Tindakan</label> <input type="text" name="tindakan"
						id="tindakan" class="form-control" autofocus
						placeholder="Tindakan" required>
				</div>
				<div class="form-group">
					<label>Berat Badan</label> <input type="text" name="beratBadan"
						id="beratBadan" class="form-control" autofocus
						placeholder="Berat Badan" maxlength="3" size="3" required>
				</div>
				<div class="form-group">
					<label>Tensi Diastolik</label> <input type="text"
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
					<table class="table" id="tablePeriksa">
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
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td>
									<button type="button" class="btn btn-primary"
										data-dismiss="modal">Pilih</button>
								</td>
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
						<button type="button" class="btn btn-primary" id="saveDiagnosa">Save
							Changes</button>
						<button type="button" class="btn btn-default" id="updateDiagnosa">Update</button>
					</div>
					<a></</a>
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
	/* crud diagnosa */
	function saveDiagnosa() {
		var noDiagnosa = $('#noDiagnosa').val();
		var diagnosa = $('#diagnosa').val();
		var keterangan = $('#keterangan').val();
		var noPemeriksaan = $('#noPemeriksaan').val();

		var diagnosaEntity = {
			noDiagnosa : noDiagnosa,
			diagnosa : diagnosa,
			keterangan : keterangan,
			pemeriksaan : {
				noPemeriksaan : noPemeriksaan
			}
		}

		$.ajax({
			url : '/pemeriksaan/saveDiagnosa',
			type : 'POST',
			contentType : 'application/json',
			dataType : 'json',
			data : JSON.stringify(diagnosaEntity),
			success : function(data, x, xhr) {
				showDataDiagnosa();
				clearFormDiagnosa();
			}

		});
	}

	function updateDiagnosa() {
		var noDiagnosa = $('#noDiagnosa').val();
		var diagnosa = $('#diagnosa').val();
		var keterangan = $('#keterangan').val();
		var id = $('#idDiagnosa').val();

		var diagnosa = {
			noDiagnosa : noDiagnosa,
			diagnosa : diagnosa,
			keterangan : keterangan,
			id : id
		}

		$.ajax({
			url : '/pemeriksaan/updateDiagnosa',
			type : 'POST',
			contentType : 'application/json',
			dataType : 'json',
			data : JSON.stringify(diagnosa),
			success : function(data, x, xhr) {
				showDataDiagnosa();
				clearFormDiagnosa();
			}

		});
	}

	function doDeleteDiagnosa(del) {
		var id = $(del).attr("idDeleteDiagnosa");
		$.ajax({
			url : "/pemeriksaan/deleteDiagnosa/" + id,
			type : "DELETE",
			success : function(data) {
				console.log(data);
				showDataDiagnosa();
			}
		});
	}

	function fillDataDiagnosa(data) {
		var dt = $("#tableDiagnosa");
		var tbody = dt.find("tbody");
		tbody.find("tr").remove();
		$
				.each(
						data,
						function(index, listDiagnosa) {
							var trString = "<tr>";
							trString += "<td>" + listDiagnosa.noDiagnosa
									+ "</td>";
							trString += "<td>" + listDiagnosa.diagnosa
									+ "</td>";
							trString += "<td>" + listDiagnosa.keterangan
									+ "</td>";
							trString += "<td><a href='#' class='deleteDiagnosa' idDeleteDiagnosa='" + listDiagnosa.id + "'>delete</a></td>";
							trString += "<td><a href='#' class='updateDiagnosa' idUpdateDiagnosa='" + listDiagnosa.id + "'>edit</a></td>";
							trString += "</tr>";
							tbody.append(trString);
						});
	}

	function showDataDiagnosa() {
		var noDiagnosa = $('#noDiagnosa').val();
		$.ajax({
			url : '/pemeriksaan/getDiagnosaByNoDiagnosa/' + noDiagnosa,
			type : 'POST',
			dataType : 'json',
			success : function(data, x, xhr) {
				console.log("data is loaded");
				fillDataDiagnosa(data);
			}
		});
	}

	function updateColumnDiagnosa(data) {
		$('#idDiagnosa').val(data.id);
		$('#noDiagnosa').val(data.noDiagnosa);
		$('#diagnosa').val(data.diagnosa);
		$('#keterangan').val(data.keterangan);
	}

	function clearFormDiagnosa() {
		$('#idDiagnosa').val("");
		$('#diagnosa').val("");
		$('#keterangan').val("");
	}
	/* end crud diagnosa */
	/* crud pemeriksaan */
	function savePemeriksaan() {
		var noPemeriksaan = $("#noPemeriksaan").val();
		var noDaftar = $("#noDaftar").val();
		var jenisPemeriksaan = $("#jenisPemeriksaan").val();
		var dokter = $("#dokter").val();
		var tindakan = $("#tindakan").val();
		var beratBadan = $("#beratBadan").val();
		var tensiDiastolik = $("#tensiDiastolik").val();
		var tensiSistolik = $("#tensiSistolik").val();

		var pemeriksaan = {
			noPemeriksaan : noPemeriksaan,
			pendaftaran : {
				nodaftar : noDaftar
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
			tensiSistolik : tensiSistolik
		}
		
		$.ajax({
			url : '/pemeriksaan/savePemeriksaan',
			type : 'POST',
			contentType : 'application/json',
			dataType : 'json',
			data : JSON.stringify(pemeriksaan),
			success : function(data, x, xhr) {
				log.console("loaded");
			}

		});
	}
	/* end crud pemeriksaan */
</script>
</html>