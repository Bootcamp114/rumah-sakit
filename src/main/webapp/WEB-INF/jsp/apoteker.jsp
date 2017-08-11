<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Form Input Apoteker</title>
</head>
<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="/resources/assets/css/bootstrap-theme.min.css" />
<script type="text/javascript" src="/resources/assets/jquery-3.2.1.min.js"></script>
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
				url : '/apoteker/edit/'+id,
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
<div class="container">
<div style="width:500px;margin:0 auto;">
<input type="hidden" id="id">
<div class="form-group">
	<label>Masukan NIP</label>
	<input type="text" id="nip" class="form-control" placeholder="NIP">
</div>
<div class="form-group">
	<label>Masukan Nama</label>
	<input type="text" id="nama" class="form-control" placeholder="Nama">
</div>
<div class="form-group">
	<label>Masukan Jenis Kelamin</label>
	<input type="text" id="jk" class="form-control" placeholder="NIP">
</div>
<div class="form-group">
	<label>Masukan Alamat</label>
	<input type="text" id="alamat" class="form-control" placeholder="Alamat">
</div>
<div class="form-group">
	<label>Masukan NO HP</label>
	<input type="text" id="nohp" class="form-control" placeholder="NO HP">
</div>
<div class="form-group" align="right">
	<button class="btn btn-info" id="save">SIMPAN</button>
	<button class="btn btn-default" id="update">UPDATE</button>
</div>
</div>
<a href="#" id="loadData">Load Data</a>
<table id="tableApoteker" class="table table-bordered">
	<thead>
	<tr class="info">
		<th>NIP</th>
		<th>NAMA</th>
		<th>JK</th>
		<th>ALAMAT</th>
		<th>NO HP</th>
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
			var jk = $('#jk').val();
			var alamat = $('#alamat').val();
			var nohp = $('#nohp').val();
			
			
			var tableApoteker = {
					nip : nip,
					nama : nama,
					jk : jk,
					alamat : alamat,
					nohp : nohp
			}
			
			$.ajax({
				url: '/apoteker/save',
				type: 'POST',
			 	contentType:'application/json',
			 	dataType : 'json',
				data: JSON.stringify(tableApoteker), 
				success: function(data,x,xhr){
					showData();	
					clearForm();
				}
			
			});
		}
		
		function doDelete(del){
			var id = $(del).attr("id_delete");
			$.ajax({
				url : "/apoteker/delete/"+id,
				type : "DELETE",
				success : function(data){
					console.log(data);
					showData();
				}
			});
		}
		
		function fillData(data){
			var dt = $("#tableApoteker");
			var tbody = dt.find("tbody");
			tbody.find("tr").remove();
			$.each(data, function(index , listApoteker){
				var trString = "<tr>";
						trString += "<td>" + listApoteker.nip + "</td>";
						trString += "<td>" + listApoteker.nama + "</td>";
						trString += "<td>" + listApoteker.jk + "</td>";
						trString += "<td>" + listApoteker.alamat + "</td>";
						trString += "<td>" + listApoteker.nohp + "</td>";
						trString += "<td><a href='#' class='delete' id_delete='" + listApoteker.id + "'>DELETE</a></td>";
						trString += "<td><a href='#' class='update' id_update='" + listApoteker.id + "'>EDIT</a></td>";
					trString +="</tr>";
				tbody.append(trString);
			});
		}
		
		function showData(){
			$.ajax({
				url :'/apoteker/getall',
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
			var jk = $('#jk').val();
			var alamat = $('#alamat').val();
			var nohp = $('#nohp').val();
			var id = $('#id').val();
			
			var tableApoteker = {
					id : id,
					nip : nip,
					nama : nama,
					jk : jk,
					alamat : alamat,
					nohp : nohp
			
			}
			
			$.ajax({
				url: '/apoteker/update',
				type: 'PUT',
			 	contentType:'application/json',
			 	dataType : 'json',
				data: JSON.stringify(tableApoteker), 
				success: function(data ,a , xhr){
					if( xhr.status == 201){
						showData();	
					}
					clearForm();
				}
				
			});
			
		}
		
		function updateColumn(data){
			$('#id').val(data.id);
			$('#nip').val(data.nip);
			$('#nama').val(data.nama);
			$('#jk').val(data.jk);
			$('#alamat').val(data.alamat);
			$('#nohp').val(data.nohp);
			
		}
		
		function clearForm(){
			$('#id').val("");
			$('#supplier').val("");
			$('#alamat').val("");
			$('#telpon').val("");
		}
	</script>
</html>