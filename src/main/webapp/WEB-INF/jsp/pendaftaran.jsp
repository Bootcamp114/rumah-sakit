<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
	<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css" />
	<link rel="stylesheet" href="/resources/assets/css/bootstrap-theme.min.css" />
	<script type="text/javascript" src="/resources/assets/jquery-3.2.1.min.js"></script>
	<link rel="stylesheet" href="/resources/assets/jquery-ui-1.12.1/jquery-ui.css">
	 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#tanggal" ).datepicker();
  } );
  </script>
  <script type="text/javascript">
	$(document).ready(function() {
		$("input[name='jeniskelamin']").on("change", function() {
			jeniskelamin= $(this).val();
		})	
	
		$("#save").on("click",function(){	
			save();
			clearForm();
			alert("Data Tersimpan..");
		});
		
		$("#pilih").on("click",function(){
			showData();
		});
		
		$("#pilih2").on("click",function(){
			showDataPoli();
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
<h1 style="text-align: center;"> FORM PENDAFTARAN</h1><br><br><hr>
<div class="container">
<input type="hidden" id="id" name="id">
<label>Tanggal :</label> <input type="text" id="tanggal" name="tanggal" class="form-control" style="width: 20%; margin-left: 20px;"></br>
	 <label>No.Urut</label><input type="text" id="nodaftar" name="nodaftar" value="${noUrut}" placeholder="masukan nomor" class="form-control" style="width: 20%; margin-left: 20px;" />
		<hr>
<select id="pasien" class="form-control col-md-4" style="width: 20%; margin-left: 20px; ">
	<option></option>
	<c:forEach var="listPasien" items="${listPasien}">
	<option value="${listPasien.id }" >${listPasien.noidentitas}</option>
	</c:forEach>
</select>
<input type="submit" name="pilih" id="pilih" value="PILIH" class="btn btn-default" style="margin-left:10px"/></br>
<table class="table table-bordered" id="tablepasien"><br>
	<thead>
		<tr>
			<th>NO.IDENTITAS</th>
			<th>POLI</th>
			<th>TANGGAL</th>
			<th>KELUHAN</th>
			<th>NAMA PASIEN</th>
			<th>UMUR</th>
			<th>JENIS KELAMIN</th>
		</tr>
	</thead>
	<tbody>
		
	</tbody>
</table>
<select id="poli" class="form-control col-md-4" style="width: 20%; margin-left: 20px; ">
	<option></option>
	<c:forEach var="listPoli" items="${lisPoli}">
	<option value="${listPoli.id }">${listPoli.poli}</option>
	</c:forEach>
</select>
<input type="submit" name="pilih" id="pilih2" value="PILIH" class="btn btn-default" style="margin-left:10px"/></br>
<table class="table table-bordered" id="tablepoli"><br>
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
<input type="submit" value="SIMPAN" id="save" class="btn btn-default" style="margin-left: 10px;">
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
<script type="text/javascript">
		function save(){
			var tanggal = $('#tanggal').val();
			var nodaftar = $('#nodaftar').val();
			var noidentitas = $('#noidentitas').val();
			var poli = $('#poli').val();
			var pasien =$('#pasien').val();			
		
			
			
			var tablependaftaran = {
					tanggal : tanggal,
					nodaftar : nodaftar,
					noidentitas : noidentitas,
					poli : poli,
					pasien : pasien
			}
			
			$.ajax({
				url: '/pendaftaran/save',
				type: 'POST',
			 	contentType:'application/json',
			 	dataType : 'json',
				data: JSON.stringify(tablependaftaran), 
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
					    trString += "<td>" + listPasien.poli + "</td>"; 
						trString += "<td>" + listPasien.nama + "</td>";
						trString += "<td>" + listPasien.alamat + "</td>";
						trString += "<td>" + listPasien.nohp + "</td>";
						trString += "<td>" + listPasien.umur + "</td>";
						trString += "<td>" + listPasien.jeniskelamin + "</td>";
					trString +="</tr>";
				tbody.append(trString);
			});
		}
		
		function fillData2(data){
			var dt = $("#tablepoli");
			var tbody = dt.find("tbody");
			tbody.find("tr").remove();
			$.each(data, function(index , listPoli){
				var trString = "<tr>";
						trString += "<td>" +  listPoli.poli + "</td>";
						trString += "<td>" +  listPoli.ruangan + "</td>";
						tr += "<td>" +  listPoli.biaya + "</td>";
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
		
		function showDataPoli(){
			$.ajax({
				url :'/poli/getall',
				type: 'POST',
				dataType : 'json',
				success : function(data ,x,xhr){
					console.log("data is loaded");
					fillData2(data);
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
			$('#tanggal').val("");
			$('#noidentitas').val("");
			$('#poli').val("");
			$('#nodaftar').val("");
		}
	</script>
<script type="text/javascript" src="/resources/assets/js/bootstrap.min.js"></script>
</html>