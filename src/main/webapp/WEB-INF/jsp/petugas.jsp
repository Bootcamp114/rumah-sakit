<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Form Petugas</title>
</head>
<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/resources/assets/css/bootstrap-theme.min.css" />
<script type="text/javascript"
	src="/resources/assets/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("input[name='jeniskelamin']").on("change", function() {
			jeniskelamin= $(this).val();
		})	
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
				url : '/petugas/getdatabyid/'+id,
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
	});
</script>
<body>
	<h1 align="center">FORM IDENTITAS PASIEN</h1>
	<br>
	<div class="container">
		<div style="width:500px;margin:0 auto;">
		<input type="hidden" id="id" name="id">
			<div class="form-group">
				<label>NIP: </label> <input type="text"
					class="form-control" name="nip" id="nip" placeholder="Nip">
			</div>
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
				<label>Jenis Kelamin : </label> <br>
					<input type="radio"  name="jeniskelamin" value="Laki - Laki" id="jeniskelamin" > Laki - Laki<br>
  					<input type="radio"  name="jeniskelamin" value="Perempuan" id="jeniskelamin" > Perempuan<br>
			</div>
			<div class="form-group" align="right">
				<button class="btn btn-info" id="save">SIMPAN</button>
				<button class="btn btn-default" id="update">UPDATE</button>
			</div>
		</div>
		<a href="#" id="loadData">Load Data</a>
			<table class="table table-bordered" id="tablepetugas">
				<thead>
					<tr class="info">
						<th>NIP</th>
						<th>NAMA</th>
						<th>ALAMAT</th>
						<th>NOMOR HP</th>
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
			var nip = $('#nip').val();
			var nama = $('#nama').val();
			var alamat = $('#alamat').val();
			var nohp = $('#nohp').val();
		
			var tablepetugas = {
					nip : nip,
					nama : nama,
					alamat : alamat,
					nohp : nohp,
					jeniskelamin : jeniskelamin
			}
			
			$.ajax({
				url: '/petugas/save',
				type: 'POST',
			 	contentType:'application/json',
			 	dataType : 'json',
				data: JSON.stringify(tablepetugas), 
				success: function(data,x,xhr){
				}
			
			});
		}
		
		function doDelete(del){
			var id = $(del).attr("id_delete");
			$.ajax({
				url : "/petugas/delete/"+id,
				type : "DELETE",
				success : function(data){
					console.log(data);
					showData();
				}
			});
		}
		
		function fillData(data){
			var dt = $("#tablepetugas");
			var tbody = dt.find("tbody");
			tbody.find("tr").remove();
			$.each(data, function(index , listPetugas){
				var trString = "<tr>";
						trString += "<td>" + listPetugas.nip + "</td>";
						trString += "<td>" + listPetugas.nama + "</td>";
						trString += "<td>" + listPetugas.alamat + "</td>";
						trString += "<td>" + listPetugas.nohp + "</td>";
						trString += "<td>" + listPetugas.jeniskelamin + "</td>";
						trString += "<td><a href='#' class='delete' id_delete='" + listPetugas.id + "'>DELETE</a></td>";
						trString += "<td><a href='#' class='update' id_update='" + listPetugas.id + "'>EDIT</a></td>";
					trString +="</tr>";
				tbody.append(trString);
			});
		}
		
		function showData(){
			$.ajax({
				url :'/petugas/getall',
				type: 'POST',
				dataType : 'json',
				success : function(data ,x,xhr){
					console.log("data is loaded");
					fillData(data);
				}	
			});
		}
		
		function update(){
			
			var nip = $('#nip').val();
			var nama = $('#nama').val();
			var alamat = $('#alamat').val();
			var nohp = $('#nohp').val();
			var jeniskelamin = $('#jeniskelamin').val();
			var id = $('#id').val();
			
			
			var tablepetugas = {
					nip : nip,
					nama : nama,
					alamat : alamat,
					nohp : nohp,
					jeniskelamin : jeniskelamin,
					id : id
			}
			
			$.ajax({
				url: '/petugas/update',
				type: 'PUT',
			 	contentType:'application/json',
			 	dataType : 'json',
				data: JSON.stringify(tablepetugas), 
				success: function(data ,a , xhr){
					if( xhr.status == 201){
					}
					clearForm();
				}
				
			});
			
		}
		
		function updateColumn(data){
			$('#id').val(data.id);
			$('#nip').val(data.nip);
			$('#nama').val(data.nama);
			$('#alamat').val(data.alamat);
			$('#nohp').val(data.nohp);
			$('#jeniskelamin').val(data.jeniskelamin);
		}
		
		function clearForm(){
			$('#id').val("");
			$('#nip').val("");
			$('#nama').val("");
			$('#alamat').val("");
			$('#nohp').val("");
			$('#jeniskelamin').val("");
		}
	</script>
</html>