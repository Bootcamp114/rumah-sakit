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
})
</script>
<body>
	<div class="container">
		<div style="width: 500px; margin: 0 auto">
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
			supplier : {
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
</script>
</html>