<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Form Supplier</title>
</head>
<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/resources/assets/css/bootstrap-theme.min.css" />
<script type="text/javascript"
	src="/resources/assets/jquery-3.2.1.min.js"></script>
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
				url : '/poli/getdatabyid/'+id,
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
	<h1 align="center">FORM DATA POLI</h1>
	<br>
	<div class="container">
		<div style="width:500px;margin:0 auto;">
		<input type="hidden" id="id" name="id">
			<div class="form-group">
				<label>Poli : </label> <input type="text"
					class="form-control" name="poli" id="poli" placeholder="Poli">
			</div>
			<div class="form-group">
				<label>Paviliun : </label> <input type="text"
					class="form-control" name="ruangan" id="ruangan" placeholder="Pavilin">
			</div>
			<div class="form-group">
				<label>Biaya : </label> <input type="text"
					class="form-control" name="biaya" id="biaya" placeholder="Biaya">
			</div>
			<div class="form-group" align="right">
				<button class="btn btn-info" id="save">SIMPAN</button>
				<button class="btn btn-default" id="update">UPDATE</button>
			</div>
		</div>
		<a href="#" id="loadData">Load Data</a>
			<table class="table table-bordered" id="tablepoli">
				<thead>
					<tr class="info">
						<th>POLI</th>
						<th>PAVILIUN</th>
						<th>BIAYA</th>
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
			var poli = $('#poli').val();
			var ruangan = $('#ruangan').val();
			var biaya = $('#biaya').val();
			
			var tablepoli = {
					poli : poli,
					ruangan : ruangan,
					biaya : biaya
			}
			
			$.ajax({
				url: '/poli/save',
				type: 'POST',
			 	contentType:'application/json',
			 	dataType : 'json',
				data: JSON.stringify(tablepoli), 
				success: function(data,x,xhr){
				}
			
			});
		}
		
		function doDelete(del){
			var id = $(del).attr("id_delete");
			$.ajax({
				url : "/poli/delete/"+id,
				type : "DELETE",
				success : function(data){
					console.log(data);
					showData();
				}
			});
		}
		
		function fillData(data){
			var dt = $("#tablepoli");
			var tbody = dt.find("tbody");
			tbody.find("tr").remove();
			$.each(data, function(index , listPoli){
				var trString = "<tr>";
						trString += "<td>" + listPoli.poli + "</td>";
						trString += "<td>" + listPoli.ruangan + "</td>";
						trString += "<td>" + listPoli.biaya + "</td>";
						trString += "<td><a href='#' class='delete' id_delete='" + listPoli.id + "'>DELETE</a></td>";
						trString += "<td><a href='#' class='update' id_update='" + listPoli.id + "'>EDIT</a></td>";
					trString +="</tr>";
				tbody.append(trString);
			});
		}
		
		function showData(){
			$.ajax({
				url :'/poli/getall',
				type: 'POST',
				dataType : 'json',
				success : function(data ,x,xhr){
					console.log("data is loaded");
					fillData(data);
				}	
			});
		}
		
		function update(){
			
			var poli = $('#poli').val();
			var ruangan = $('#ruangan').val();
			var biaya = $('#biaya').val();
			var id = $('#id').val();
			
			var tablepoli = {
					poli : poli,
					ruangan : ruangan,
					biaya : biaya,
					id : id
			}
			
			$.ajax({
				url: '/poli/update',
				type: 'PUT',
			 	contentType:'application/json',
			 	dataType : 'json',
				data: JSON.stringify(tablepoli), 
				success: function(data ,a , xhr){
					if( xhr.status == 201){
				
					}
					clearForm();
				}
				
			});
			
		}
		
		function updateColumn(data){
			$('#id').val(data.id);
			$('#poli').val(data.poli);
			$('#ruangan').val(data.ruangan);
			$('#biaya').val(data.biaya);
		}
		
		function clearForm(){
			$('#id').val("");
			$('#poli').val("");
			$('#ruangan').val("");
			$('#biaya').val("");
		}
	</script>
</html>