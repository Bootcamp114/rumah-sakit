<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

	<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css" />
	<link rel="stylesheet" href="/resources/assets/css/bootstrap-theme.min.css" />
	<script type="text/javascript" src="/resources/assets/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
	$("#pilih").on("click",function(){
		showData();
	});
	});
	</script>
<body>
<br>
<h2 align="center">CARI DATA</h2><br><br><br><br>
<div class="container">
<select id="poli" class="form-control col-md-4" style="width: 20%;  ">
	<option>No. Identitas</option>
	<c:forEach var="listPasien" items="${listPasien}">
	<option value="${listPasien.noidentitas }">${listPasien.noidentitas}</option>
	</c:forEach>
</select>
<input type="submit" name="pilih" id="pilih" value="PILIH" class="btn btn-default" style="margin-left:10px"/></br>
		<hr>
		</table>
		<hr>
		<table class="table table-bordered" id="tablerekamjejak"><br>
	<thead>
		<tr>
			<th>NO.IDENTITAS</th>
			<th>POLI</th>
			<th>TANGGAL</th>
			<th>KELUHAN</th>
			<th>NAMA PASIEN</th>
			<th>UMUR</th>
		</tr>
	</thead>
	<tbody>
	</tbody>
</table>


</div>
</body>
<script type="text/javascript">
function fillData(data){
	var dt = $("#tablerekamjejak");
	var tbody = dt.find("tbody");
	tbody.find("tr").remove();
	$.each(data, function(index , listPendaftaran){
		var trString = "<tr>";
				trString += "<td>" + listPendaftaran.noidentitas + "</td>";
				trString += "<td>" + listPendaftaran.poli + "</td>";
				trString += "<td>" + listPendaftaran.tanggal + "</td>";
				trString += "<td>" + listPendaftaran.keluhan + "</td>";
				trString += "<td>" + listPendaftaran.nama + "</td>";
				trString += "<td>" + listPendaftaran.umur + "</td>";
			trString +="</tr>";
		tbody.append(trString);
	});
}

function showData(){
	var pendaftaran = $('#poli').val();
	$.ajax({
		url :'/rekamjejak/getno/'+ pendaftaran,
		type: 'POST',
		dataType : 'json',
		success : function(data ,x,xhr){
			console.log("data is loaded");
			fillData(data);
		}	
	});
}

</script>
<script type="text/javascript" src="/resources/assets/js/bootstrap.min.js"></script>
</html>