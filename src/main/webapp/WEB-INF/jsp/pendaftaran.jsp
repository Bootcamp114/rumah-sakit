<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
	
	<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css" />
	<link rel="stylesheet" href="/resources/assets/css/bootstrap-theme.min.css" />
	<script type="text/javascript" src="/resources/assets/jquery-3.2.1.min.js"></script>
<body>
<div class="container">
<h1 style="text-align: center;"> FORM PENDAFTARAN</h1><br><br><hr>
	 <h5>Tanggal :</h5> <input type="date" id="tanggal" name="tanggal" class="form-control" style="width: 20%; margin-left: 20px;" />
	 <h5>No.Urut :</h5><input type="text" id="nodaftar" name="nodaftar"placeholder="masukan nomor" class="form-control" style="width: 20%; margin-left: 20px;" />
		<hr>
<select id="pasien" class="form-control col-md-4" style="width: 20%; margin-left: 20px; ">
	<option>Nama Pasien</option>
	<option>Jojo</option>
</select>
<input type="submit" name="pilih" id="pilih" value="PILIH" class="btn btn-default" style="margin-left:10px"/></br>
<table class="table table-bordered"><br>
	<thead>
		<tr>
			<th>NAMA PASIEN</th>
			<th>NO.IDENTITAS</th>
			<th>UMUR</th>
			<th>JENIS KELAMIN</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>FAIZ</td>
			<td>1D003</td>
			<td>38</td>
			<td>LAKI-LAKI</td>
		</tr>
	</tbody>
</table>
<select id="poli" class="form-control col-md-4" style="width: 20%; margin-left: 20px; ">
	<option>Nama Poli</option>
	<option>Mata</option>
</select>
<input type="submit" name="pilih" id="pilih" value="PILIH" class="btn btn-default" style="margin-left:10px"/></br>
<table class="table table-bordered"><br>
	<thead>
		<tr>
			<th>POLI</th>
			<th>RUANGAN</th>
			<th>BIAYA</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>Mata</td>
			<td>A01</td>
			<td>150000</td>
		</tr>
	</tbody>
</table>
<button type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#myModal">Tambah Keluhan</button>
<input type="submit" value="SIMPAN" class="btn btn-default" style="margin-left: 10px;">

		
		<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Modal Header</h4>
      </div>
      <div class="modal-body">
        <p><textarea placeholder="masukan keluhan" class="form-control" rows="4"></textarea> </p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default">Simpan</button>
      </div>
    </div>
</div>
  </div>
</div>
</body>
<script type="text/javascript" src="/resources/assets/js/bootstrap.min.js"></script>
</html>