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
	
<body>
<div class="container">
	<h1>Form Pemeriksaan Pasien</h1>
	<div class="row">
		<div class="col-md-4">
			<div class="form-group">
				<label>No Pemeriksaan</label>
				<input type="text" name="noPemeriksaan" id="noPemeriksaan" class="form-control" autofocus placeholder="noPemeriksaan" required>	
			</div>
			<div class="form-group">
				<label>No Daftar</label>
				<input type="text" name="noPendafaran" id="noPendafaran" class="form-control" autofocus placeholder="noPendaftaran" required>	
			</div>
			<div class="form-group">
				<label>JenisPemeriksaan</label>
				<input type="text" name="noPemeriksaan" id="noPemeriksaan" class="form-control" autofocus placeholder="noPemeriksaan" required>	
			</div>
			<div class="form-group">
				<label>Diagnosa</label>
				<input type="text" name="diagnosa" id="diagnosa" class="form-control" autofocus placeholder="Diagnosa" required>	
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

		</div>
		<div class="col-md-8">
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
			</table>
		</div>
	</div>
</div>
</body>
	<script type="text/javascript" src="/resources/assets/js/bootstrap.min.js"></script>
</html>