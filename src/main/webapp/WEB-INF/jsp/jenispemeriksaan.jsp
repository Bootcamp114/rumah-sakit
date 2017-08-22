<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <%@ page isELIgnored="false" %>
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
			
			$("#save").on("click",function(){	
				save();
				clearForm();
				window.location.href="./jenispemeriksaan";
				window.location.href="./jenispemeriksaan";
				document.location.location = "jenispemeriksaan";
			});
			
			$("#loadData").on("click",function(){
				showData();
			});
		
			$(document).on("click",".delete",function(){
				var conf = confirm("Apakah yakin menghapus data ini ?");
				if(conf == true){
					doDelete(this);	
					window.location.href = "./jenispemeriksaan";
					window.location.href="./jenispemeriksaan";
				}
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
				clearForm();
				window.location.href = "./jenispemeriksaan";
				window.location.href = "./jenispemeriksaan";
				alert("Terupdate");
			});
			
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
	        		<button type="button" class="btn btn-default" id="update">Update</button></div>
				</div>
			<div class="col-md-8">
				<table class="table" id="tableJenisPeriksa">
					<thead>
						<tr>
							<th>JenisPemeriksaan</th>
							<th colspan="2">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var = "listJenis" items="${listJenis}">
							<tr>
								<td>${listJenis.jenisPemeriksaan}</td>
								<td><a href='#' class='delete' id_delete='${listJenis.id}'>delete</a></td>
								<td><a href='#' class='update' id_update='${listJenis.id}'>update</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
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
					clearForm();
					if(xhr.status == 201){
						window.location = "./jenispemeriksaan";
					}
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
					window.location = "./jenispemeriksaan";
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
					window.location = "./jenispemeriksaan";
				}	
			});
		}
		
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