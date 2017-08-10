<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			$("#save").on("click",function(){	
				save();		
			});
			
			$("#loadData").on("click",function(){
				showData();
			});
		
			$("#showPoli").on("click",function(){
				showDataPoli();
			});
			
			$(document).on("click",".delete",function(){
				doDelete(this);
			});
			
			$(document).on("click",".update",function(){
				var id = $(this).attr("id_update");
				
				$.ajax({
					url : '/jenispemeriksaan/getById/'+id,
					type : 'GET',
					success : function(data){
						updateColumn(data);
					}
				});
			});
			
			$("#update").on("click",function(){
				update();		
			});
		});
	</script>

<body>
	<div class="container">
		<h1>Form Dokter</h1>
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
					<button type="button" class="btn btn-primary btn-md" data-toggle="modal" data-target="#modalPoli" id="showPoli">
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
		        	<table class="table" id="tablePoli">
						<thead>
							<tr>
								<th>Poli</th>
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
<!-- end modal periksa  -->
</body>
	<script type="text/javascript">
		function save(){
			var jenisPemeriksaan = $('#jenisPemeriksaan').val();
			
			var tableJenisPemeriksaan = {
					jenisPemeriksaan : jenisPemeriksaan
			}
			
			$.ajax({
				url: '/jenispemeriksaan/save',
				type: 'POST',
			 	contentType:'application/json',
			 	dataType : 'json',
				data: JSON.stringify(tableJenisPemeriksaan), 
				success: function(data,x,xhr){
					showData();	
					clearForm();
				}
			
			});
		}
		
		function doDelete(del){
			var id = $(del).attr("id_delete");
			$.ajax({
				url : "/jenispemeriksaan/delete/"+id,
				type : "DELETE",
				success : function(data){
					console.log(data);
					showData();
				}
			});
		}
		
		function fillData(data){
			var dt = $("#tableJenisPeriksa");
			var tbody = dt.find("tbody");
			tbody.find("tr").remove();
			$.each(data, function(index , listJenisPemeriksaan){
				var trString = "<tr>";
						trString += "<td>" + listJenisPemeriksaan.jenisPemeriksaan + "</td>";
						trString += "<td><a href='#' class='delete' id_delete='" + listJenisPemeriksaan.id + "'>delete</a></td>";
						trString += "<td><a href='#' class='update' id_update='" + listJenisPemeriksaan.id + "'>edit</a></td>";
					trString +="</tr>";
				tbody.append(trString);
			});
		}
		
		function showData(){
			$.ajax({
				url :'/jenispemeriksaan/getAll',
				type: 'POST',
				dataType : 'json',
				success : function(data ,x,xhr){
					console.log("data is loaded");
					fillData(data);
				}	
			});
		}
		/* modal poli  */
		function fillDataPoli(data){
			var dt = $("#tablePoli");
			var tbody = dt.find("tbody");
			tbody.find("tr").remove();
			$.each(data, function(index , listPoli){
				var trString = "<tr>";
						trString += "<td>" + listPoli.poli + "</td>";
						trString += "<td><a href='#' class='pilihPoli' id_pilih='" + listPoli.id + "'>Pilih</a></td>";
					trString +="</tr>";
				tbody.append(trString);
			});
		}
		
		function showDataPoli(){
			$.ajax({
				url :'/dokter/getAllPoli',
				type: 'POST',
				dataType : 'json',
				success : function(data ,x,xhr){
					console.log("data is loaded");
					fillDataPoli(data);
				}	
			});
		}
		
		/* end modal poli */
		function update(){
			
			var jenisPemeriksaan = $('#jenisPemeriksaan').val();
			var id = $('#id').val();
			
			var tableJenisPemeriksaan = {
					jenisPemeriksaan : jenisPemeriksaan, 
					id : id
			}
			
			$.ajax({
				url: '/jenispemeriksaan/update',
				type: 'PUT',
			 	contentType:'application/json',
			 	dataType : 'json',
				data: JSON.stringify(tableJenisPemeriksaan), 
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
			$('#jenisPemeriksaan').val(data.jenisPemeriksaan);
		}
		
		function clearForm(){
			$('#id').val("");
			$('#jenisPemeriksaan').val("");
		}
	</script>
	<script type="text/javascript" src="/resources/assets/js/bootstrap.min.js"></script>
</html>