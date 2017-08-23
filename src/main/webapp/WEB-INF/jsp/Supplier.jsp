<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Form Supplier</title>
</head>
<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="/resources/assets/css/bootstrap-theme.min.css" />
<link rel="stylesheet" href="/resources/assets/DataTables-1.10.15/media/css/jquery.dataTables.min.css" />
	
<script type="text/javascript"
	src="/resources/assets/jquery-3.2.1.min.js"></script>
	
	  <script>
		function hanyaAngka(evt) {
		  var charCode = (evt.which) ? evt.which : event.keyCode
		   if (charCode > 31 && (charCode < 48 || charCode > 57))
 
		    return false;
		  return true;
		}
	</script>
	
	
<script type="text/javascript">
	$(document).ready(function() {
		$('#tableSupplier').DataTable();
		$("#save").on("click",function(){	
			save();
			clearForm();
			alert("Data Tersimpan..");
			window.location.href="/supplier/index";
		});
		
		$("#loadData").on("click",function(){
			showData();
		});
	
		$(document).on("click",".delete",function(){
			var conf = confirm("Yakin mau dihapus?");
			if(conf == true){
				doDelete(this);
				window.location.href="/supplier/index";
			}
			
		});
		
		$(document).on("click",".update",function(){
			var id = $(this).attr("id_update");
			
			$.ajax({
				url : '/supplier/edit/'+id,
				type : 'GET',
				success : function(data){
					updateColumn(data);
					
				}
			});
		});
		
		$("#update").on("click",function(){
			update();
			clearForm();
			alert("Data Terupdate");
			window.location.href="/supplier/index";
		});
	});
</script>
<body>
	<h1 align="center">Form Input Supplier</h1>
	<br>
	<div class="container">
		<div style="width:500px;margin:0 auto;">
		<input type="hidden" id="id" name="id">
			<div class="form-group">
				<label>Masukan Supplier : </label> <input type="text"
					class="form-control" name="supplier" id="supplier" placeholder="Supplier">
			</div>
			<div class="form-group">
				<label>Masukan Alamat : </label> <input type="text"
					class="form-control" name="alamat" id="alamat" placeholder="Alamat">
			</div>
			<div class="form-group">
				<label>Masukan Telpon : </label> <input type="number"
					class="form-control" name="telpon" onkeypress="return hanyaAngka(event)" id="telpon" placeholder="Telpon">
			</div>
			<div class="form-group" align="right">
				<button class="btn btn-info" id="save">SIMPAN</button>
				<button class="btn btn-default" id="update">UPDATE</button>
			</div>
		</div>
		<table id="tableSupplier">
				<thead>
					<tr class="info">
						<th>SUPPLIER</th>
						<th>ALAMAT</th>
						<th>TELPON</th>
						<th>AKSI</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var = "listSupplier" items = "${listSupplier }">
					<tr>
						<td>${listSupplier.supplier }</td>
						<td>${listSupplier.alamat }</td>
						<td>${listSupplier.telpon }</td>
						<td><a href='#' class='delete' id_delete='" + listSupplier.id + "'>DELETE</a> | <a href='#' class='update' id_update='" + listSupplier.id + "'>EDIT</a></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
</body>
<script type="text/javascript">
		function save(){
			var supplier = $('#supplier').val();
			var alamat = $('#alamat').val();
			var telpon = $('#telpon').val();
			
			var tableSupplier = {
					supplier : supplier,
					alamat : alamat,
					telpon : telpon
			}
			
			$.ajax({
				url: '/supplier/save',
				type: 'POST',
			 	contentType:'application/json',
			 	dataType : 'json',
				data: JSON.stringify(tableSupplier), 
				success: function(data,x,xhr){
					showData();	
					clearForm();
				}
			
			});
		}
		
		function doDelete(del){
			var id = $(del).attr("id_delete");
			$.ajax({
				url : "/supplier/delete/"+id,
				type : "DELETE",
				success : function(data){
					console.log(data);
					showData();
				}
			});
		}
		
		function fillData(data){
			var dt = $("#tableSupplier");
			var tbody = dt.find("tbody");
			tbody.find("tr").remove();
			$.each(data, function(index , listSupplier){
				var trString = "<tr>";
						trString += "<td>" + listSupplier.supplier + "</td>";
						trString += "<td>" + listSupplier.alamat + "</td>";
						trString += "<td>" + listSupplier.telpon + "</td>";
						trString += "<td><a href='#' class='delete' id_delete='" + listSupplier.id + "'>DELETE</a></td>";
						trString += "<td><a href='#' class='update' id_update='" + listSupplier.id + "'>EDIT</a></td>";
					trString +="</tr>";
				tbody.append(trString);
			});
		}
		
		function showData(){
			$.ajax({	
				url :'/supplier/getall',
				type: 'POST',
				dataType : 'json',
				success : function(data ,x,xhr){
					console.log("data is loaded");
					fillData(data);
				}	
			});
		}
		
		function update(){
			
			var supplier = $('#supplier').val();
			var alamat = $('#alamat').val();
			var telpon = $('#telpon').val();
			var id = $('#id').val();
			
			var tableSupplier = {
					supplier : supplier,
					alamat : alamat,
					telpon : telpon,
					id : id
			}
			
			$.ajax({
				url: '/supplier/update',
				type: 'PUT',
			 	contentType:'application/json',
			 	dataType : 'json',
				data: JSON.stringify(tableSupplier), 
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
			$('#supplier').val(data.supplier);
			$('#alamat').val(data.alamat);
			$('#telpon').val(data.telpon);
		}
		
		function clearForm(){
			$('#id').val("");
			$('#supplier').val("");
			$('#alamat').val("");
			$('#telpon').val("");
		}
	</script>
<script type="text/javascript" src="/resources/assets/DataTables-1.10.15/media/js/jquery.dataTables.min.js"></script>
	
</html>