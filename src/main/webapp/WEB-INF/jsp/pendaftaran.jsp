<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Form Supplier</title>
</head>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/resources/assets/css/bootstrap-theme.min.css" />
<script type="text/javascript"
	src="/resources/assets/jquery-3.2.1.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#save").on("click",function(){	
			save();
			showData();
			clearForm();
			alert("Data Tersimpan..");
		});
		
		$("#loadData").on("click",function(){
			showData();
		});
	
		$(document).on("click",".delete",function(){
			var conf = confirm("Yakin mau dihapus?");
			if(conf == true){
				doDelete(this);	
			}
			
		});
		
		$(document).on("click",".update",function(){
			var id = $(this).attr("id_update");
			
			$.ajax({
				url : '/pasien/getdatabyid/'+id,
				type : 'GET',
				success : function(data){
					updateColumn(data);
		
				}
			});
		});     
		
		$("#update").on("click",function(){
			update();
			showData();
			clearForm();
			alert("Data Terupdate");
		});
		
		$( function() {
		    $( "#datepicker" ).datepicker();
		  } );
	});
</script>
<body>
	<h1 align="center">FORM IDENTITAS PASIEN</h1>
	<div class="container">
    <div class="row">
        <div class='col-sm-6'>
            <input type='text' class="form-control" id='datepicker' />
        </div>
    </div>
</div>
	<br>
			<div class="form-group">
				<label>Nama : </label> <input type="text"
					class="form-control" name="nama" id="nama" placeholder="Nama">
			</div>
			<div class="form-group">
				<label>Alamat : </label> <input type="text"
					class="form-control" name="alamat" id="alamat" placeholder="Alamat">
			</div>
			<div class="form-group">
				<label>Nomor Hp : </label> <input type="number"
					class="form-control" name="nohp" id="nohp" placeholder="Nomor Hp">
			</div>
			<div class="form-group">
				<label>Usia : </label> <input type="number"
					class="form-control" name="umur" id="umur" placeholder="Usia">
			</div>
			<div class="form-group">
				<label>Jenis Kelamin : </label> <input type="text"
					class="form-control" name="jeniskelamin" id="jeniskelamin" placeholder="Jenis Kelamin">
			</div>
			<div class="form-group" align="right">
				<button class="btn btn-info" id="save">SIMPAN</button>
				<button class="btn btn-default" id="update">UPDATE</button>
			</div>
		</div>
		<a href="#" id="loadData">Load Data</a>
			<table class="table table-bordered" id="tablepasien">
				<thead>
					<tr class="info">
						<th>NOMOR IDENTITAS</th>
						<th>NAMA</th>
						<th>ALAMAT</th>
						<th>NOMOR HP</th>
						<th>USIA</th>
						<th>JENIS KELAMIN</th>
						<th colspan="2">AKSI</th>
					</tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>
		</div>
</body>
<script type="text/javascript">
		function save(){
			var noidentitas = $('#noidentitas').val();
			var nama = $('#nama').val();
			var alamat = $('#alamat').val();
			var nohp = $('#nohp').val();
			var umur = $('#umur').val();
			var jeniskelamin = $('#jeniskelamin').val();
			
			var tablepasien = {
					noidentitas : noidentitas,
					nama : nama,
					alamat : alamat,
					nohp : nohp,
					umur : umur,
					jeniskelamin : jeniskelamin
			}
			
			$.ajax({
				url: '/pasien/save',
				type: 'POST',
			 	contentType:'application/json',
			 	dataType : 'json',
				data: JSON.stringify(tablepasien), 
				success: function(data,x,xhr){
				}
			
			});
		}
		
		function doDelete(del){
			var id = $(del).attr("id_delete");
			$.ajax({
				url : "/pasien/delete/"+id,
				type : "DELETE",
				success : function(data){
					console.log(data);
					showData();
				}
			});
		}
		
		function fillData(data){
			var dt = $("#tablepasien");
			var tbody = dt.find("tbody");
			tbody.find("tr").remove();
			$.each(data, function(index , listPasien){
				var trString = "<tr>";
						trString += "<td>" + listPasien.noidentitas + "</td>";
						trString += "<td>" + listPasien.nama + "</td>";
						trString += "<td>" + listPasien.alamat + "</td>";
						trString += "<td>" + listPasien.nohp + "</td>";
						trString += "<td>" + listPasien.umur + "</td>";
						trString += "<td>" + listPasien.jeniskelamin + "</td>";
						trString += "<td><a href='#' class='delete' id_delete='" + listPasien.id + "'>DELETE</a></td>";
						trString += "<td><a href='#' class='update' id_update='" + listPasien.id + "'>EDIT</a></td>";
					trString +="</tr>";
				tbody.append(trString);
			});
		}
		
		function showData(){
			$.ajax({
				url :'/pasien/getall',
				type: 'POST',
				dataType : 'json',
				success : function(data ,x,xhr){
					console.log("data is loaded");
					fillData(data);
				}	
			});
		}
		
		function update(){
			
			var noidentitas = $('#noidentitas').val();
			var nama = $('#nama').val();
			var alamat = $('#alamat').val();
			var nohp = $('#nohp').val();
			var umur = $('#umur').val();
			var jeniskelamin = $('#jeniskelamin').val();
			var id = $('#id').val();
			
			
			var tablepasien = {
					noidentitas : noidentitas,
					nama : nama,
					alamat : alamat,
					nohp : nohp,
					umur : umur,
					jeniskelamin : jeniskelamin,
					id : id
			}
			
			$.ajax({
				url: '/pasien/update',
				type: 'PUT',
			 	contentType:'application/json',
			 	dataType : 'json',
				data: JSON.stringify(tablepasien), 
				success: function(data ,a , xhr){
					if( xhr.status == 201){
					}
					clearForm();
				}
				
			});
			
		}
		
		function updateColumn(data){
			$('#id').val(data.id);
			$('#noidentitas').val(data.noidentitas);
			$('#nama').val(data.nama);
			$('#alamat').val(data.alamat);
			$('#nohp').val(data.nohp);
			$('#umur').val(data.umur);
			$('#jeniskelamin').val(data.jeniskelamin);
		}
		
		function clearForm(){
			$('#id').val("");
			$('#noidentitas').val("");
			$('#nama').val("");
			$('#alamat').val("");
			$('#nohp').val("");
			$('#umur').val("");
			$('#jeniskelamin').val("");
		}
	</script>
	<script type="text/javascript" src="/resources/assets/js/bootstrap.min.js"></script>
</html>















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
<input type="submit" value="CETAK" class="btn btn-default" style="margin-left: 10px;">

		
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
        <button type="button" class="btn btn-default" data-dismiss="modal">Simpan</button>
      </div>
    </div>
</div>
  </div>
</div>
</body>
<script type="text/javascript" src="/resources/assets/js/bootstrap.min.js"></script>
</html>