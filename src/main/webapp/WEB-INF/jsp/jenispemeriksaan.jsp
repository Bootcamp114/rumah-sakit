<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Form Jenis Pemeriksaan</title>
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
		<h1>Form Jenis Pemeriksaan</h1>
		<div class="row">
			<div class="col-md-4">
				<div class="form-group">
					<input type="hidden" name="id" id="id" class="form-control" autofocus placeholder="noPemeriksaan" required>	
				</div>
				<div class="form-group">
					<label>Jenis Pemeriksaan</label>
					<input type="text" name="jenisPemeriksaan" id="jenisPemeriksaan" class="form-control" autofocus placeholder="Masukan JenisPemeriksaan" required >	
				</div>
				<div class="form-group">
					<button type="button" class="btn btn-primary" id="save">Save Changes</button>
	        		<button type="button" class="btn btn-default">Update</button></div>
				</div>
			<div class="col-md-8">
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
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
	<script type="text/javascript" src="/resources/assets/js/bootstrap.min.js"></script>
</html>