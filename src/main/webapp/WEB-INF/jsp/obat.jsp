<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Form Obat</title>
</head>
<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/resources/assets/css/bootstrap-theme.min.css" />
<script type="text/javascript"
	src="/resources/assets/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#save").on("click",function(){
		save();
	})
	
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
			url : '/obat/edit/'+id,
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
	});
})
</script>
<body>
	<div class="container">
		<div style="width: 500px; margin: 0 auto">
		<input type="hidden" id="id">
			<div class="form-group">
				<label>Obat</label> <input type="text" class="form-control" id="obat">
			</div>
			<div class="form-group">
				<label>Harga</label> <input type="number" class="form-control"
					id="harga">
			</div>
			<div class="form-group">
				<label>Jenis Obat</label> <input type="text" class="form-control"
					id="jenisObat">
			</div>
			<div class="form-group">
				<label>Supplier</label> <select class="form-control" id="supplier">
				 	<option></option>
					<c:forEach var="listSupplier" items="${listSupplier}">
						<option value="${listSupplier.id }">${listSupplier.supplier}</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group" align="right">
				<button class="btn btn-info" id="save">SIMPAN</button>
				<button class="btn btn-default" id="update">UPDATE</button>
			</div>
		</div>
		<a href="#" id="loadData">Load Data</a>
		<table id="tableObat" class="table table-bordered">
			<thead>
				<tr class="info">
					<th>OBAT</th>
					<th>HARGA</th>
					<th>JENIS OBAT</th>
					<th>SUPPLIER</th>
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
	var obat = $('#obat').val();
	var harga = $('#harga').val();
	var jenisObat = $('#jenisObat').val();
	var supplier = $('#supplier').val();
	
	var tableObat = {
			obat : obat,
			harga : harga,
			jenisObat : jenisObat,
			suplier : {
				id : supplier
		}
	}
	
	$.ajax({
		url : '/obat/save',
		type : 'POST',
		contentType : 'application/json',
		dataType : 'json',
		data : JSON.stringify(tableObat),
		success : function(data,x,xhr){
			clearForm();
		}
	});
}

function clearForm(){
	$('#obat').val("");
	$('#harga').val("");
	$('#jenisObat').val("");
	$('#supplier').val("");
	
}

function updateColumn(data){
	$('#id').val(data.id);
	$('#obat').val(data.obat);
	$('#harga').val(data.harga);
	$('#jenisObat').val(data.jenisObat);
	$('#supplier').eval(data.suplier.supplier);
	
}

function doDelete(del){
	var id = $(del).attr("id_delete");
	$.ajax({
		url : "/obat/delete/"+id,
		type : "DELETE",
		success : function(data){
			console.log(data);
			showData();
		}
	});
}

function fillData(data){
	var dt = $("#tableObat");
	var tbody = dt.find("tbody");
	tbody.find("tr").remove();
	$.each(data, function(index , listObat){
		var trString = "<tr>";
				trString += "<td>" + listObat.obat + "</td>";
				trString += "<td>" + listObat.harga + "</td>";
				trString += "<td>" + listObat.jenisObat + "</td>";
				trString += "<td>" + listObat.suplier.supplier + "</td>";
				trString += "<td><a href='#' class='delete' id_delete='" + listObat.id + "'>DELETE</a></td>";
				trString += "<td><a href='#' class='update' id_update='" + listObat.id + "'>EDIT</a></td>";
			trString +="</tr>";
		tbody.append(trString);
	});
}
function showData(){
	$.ajax({
		url :'/obat/getall',
		type: 'POST',
		dataType : 'json',
		success : function(data ,x,xhr){
			console.log("data is loaded");
			fillData(data);
		}	
	});
}

function update(){
	var obat = $('#obat').val();
	var harga = $('#harga').val();
	var jenisObat = $('#jenisObat').val();
	var supplier = $('#supplier').val();
	var id = $('#id').val();
	
	var tableObat = {
			id : id,
			obat : obat,
			harga : harga,
			jenisObat : jenisObat,
			suplier : {
				id : supplier
		}
	}
	
	$.ajax({
		url: '/obat/update',
		type: 'PUT',
	 	contentType:'application/json',
	 	dataType : 'json',
		data: JSON.stringify(tableObat), 
		success: function(data ,a , xhr){
			if( xhr.status == 201){
				showData();	
			}
			clearForm();
		}
		
	});
}

</script>
</html>