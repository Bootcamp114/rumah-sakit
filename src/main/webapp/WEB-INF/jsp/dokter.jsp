<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Form Dokter</title>
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
					<label>NIP</label>
					<input type="text" name="nip" id="nip" class="form-control" autofocus placeholder="Masukan NIP" required >	
				</div>
				<div class="form-group">
					<label>Nama</label>
					<input type="text" name="nama" id="nama" class="form-control" autofocus placeholder="Masukan Nama" required>	
				</div>
				<div class="form-group">
					<label>Jenis Kelamin</label>
					<br/>
					<input type="radio" name="jk" id="jkL" value="L">Laki - Laki
					<input type="radio" name="jk" id="jkP" value="P">Perempuan	
				</div>
				<div class="form-group">
					<label>Poli</label>
					<input type="text" name="poli" id="poli" class="form-control" autofocus placeholder="Poli" required readonly>	
					<br>
					<button type="button" class="btn btn-primary btn-md" data-toggle="modal" data-target="#modalPoli">
	  					Pilih Poli
					</button>
				</div>
				<div class="form-group">
					<button type="button" class="btn btn-primary" id="save">Save Changes</button>
	        		<button type="button" class="btn btn-default">Update</button></div>
				</div>
			<div class="col-md-12">
				<table class="table" id="tablePeriksa">
					<thead>
						<tr>
							<th>NIP</th>
							<th>NamaDokter</th>
							<th>JenisKelamin</th>
							<th>Poli</th>
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
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
<!-- modal periksa  -->
	<div class="modal fade" id="modalPoli" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  		<div class="modal-dialog" role="document">
    		<div class="modal-content">
      			<div class="modal-header">
        			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>
        			<h4 class="modal-title" id="myModalLabel">Data Poli</h4>
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
</body>
	<script type="text/javascript" src="/resources/assets/js/bootstrap.min.js"></script>
</html>