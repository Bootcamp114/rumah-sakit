<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Form Pemeriksaan</title>
</head>
	
	<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css" />
	<link rel="stylesheet" href="/resources/assets/css/bootstrap-theme.min.css" />
	<script type="text/javascript" src="/resources/assets/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			
		});
	</script>
<body>
<div class="container">
	<h1>Form Pemeriksaan Pasien</h1>
	<div class="row">
		<div class="col-md-4">
			<div class="form-group">
				<input type="hidden" name="id" id="id" class="form-control" autofocus placeholder="noPemeriksaan" required>	
			</div>
			<div class="form-group">
				<label>No Pemeriksaan</label>
				<input type="text" name="noPemeriksaan" id="noPemeriksaan" class="form-control" autofocus placeholder="noPemeriksaan" required readonly>	
			</div>
			<div class="form-group">
				<label>No Daftar</label>
				<input type="text" name="noPendafaran" id="noPendafaran" class="form-control" autofocus placeholder="noPendaftaran" required readonly>	
				<br>
				<button type="button" class="btn btn-primary btn-md" data-toggle="modal" data-target="#modalPendaftaran">
  					pilih no daftar
				</button>
			</div>
			<div class="form-group">
				<label>JenisPemeriksaan</label>
				<input type="text" name="noPemeriksaan" id="noPemeriksaan" class="form-control" autofocus placeholder="noPemeriksaan" required readonly>	
				<br>
				<button type="button" class="btn btn-primary btn-md" data-toggle="modal" data-target="#modalJenisPemeriksaan">
  					pilih jenis pemeriksaan
				</button>
			</div>
			<div class="form-group">
				<label>Diagnosa</label>
				<input type="text" name="diagnosa" id="diagnosa" class="form-control" autofocus placeholder="Diagnosa" required readonly>	
				<br>
				<button type="button" class="btn btn-primary btn-md" data-toggle="modal" data-target="#modalDiagnosa">
  					Klik Untuk Diagnosa
				</button>
			</div>
			<div class="form-group">
				<label>Tindakan</label>
				<input type="text" name="tindakan" id="tindakan" class="form-control" autofocus placeholder="Tindakan" required>	
			</div>
			<div class="form-group">
				<label>Berat Badan</label>
				<input type="text" name="beratBadan" id="beratBadan" class="form-control" autofocus placeholder="Berat Badan" maxlength="3" size="3" required>	
			</div>
			<div class="form-group">
				<label>Tensi Diastolik</label>
				<input type="text" name="tensiDiastolik" id="tensiDiastolik" class="form-control" autofocus placeholder="Tensi Diastolik" maxlength="3" size="3" required>	
			</div>
			<div class="form-group">
				<label>Tensi Sistolik</label>
				<input type="number" name="tensiSistolik" id="tensiSistolik" class="form-control" autofocus placeholder="Tensi Sistolik" maxlength="3" size="3" required>	
			</div>
			<div class="form-group">
				<button type="button" class="btn btn-primary" id="save" data-dismiss="modal">Save Changes</button>
        		<button type="button" class="btn btn-default" data-dismiss="modal">Update</button></div>
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
<div class="modal fade" id="modalPendaftaran" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  		<div class="modal-dialog" role="document">
    		<div class="modal-content">
      			<div class="modal-header">
        			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>
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
							<button type="button" class="btn btn-primary" data-dismiss="modal">Pilih</button>
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
<!-- modal periksa  -->
	<div class="modal fade" id="modalJenisPemeriksaan" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  		<div class="modal-dialog" role="document">
    		<div class="modal-content">
      			<div class="modal-header">
        			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>
        			<h4 class="modal-title" id="myModalLabel">Data Jenis Pemeriksaan</h4>
      			</div>
      			<div class="modal-body">
        			<table class="table" id="tablePeriksa">
				<thead>
					<tr>
						<th>JenisPemeriksaan</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td></td>
						<td>
							<button type="button" class="btn btn-primary" data-dismiss="modal">Pilih</button>
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
<!-- end modal periksa  -->
<!-- modal diagnosa  -->
	<div class="modal fade" id="modalDiagnosa" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  		<div class="modal-dialog" role="document">
    		<div class="modal-content">
      			<div class="modal-header">
        			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>
        			<h4 class="modal-title" id="myModalLabel">Data Jenis Pemeriksaan</h4>
      			</div>
      			<div class="modal-body">
        			<table class="table" id="tablePeriksa">
				<thead>
					<tr>
						<th>JenisPemeriksaan</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td></td>
						<td>
							<button type="button" class="btn btn-primary" data-dismiss="modal">Pilih</button>
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
<!-- end modal diagnosa  -->
</body>
	<script type="text/javascript" src="/resources/assets/js/bootstrap.min.js"></script>
</html>