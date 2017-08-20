<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Form Pendaftaran</title>
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
				url : '/pendaftaran/getdatabyid/'+id,
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
	<!-- <script src="/resources/assets/tinymce/js/tinymce/tinymce.min.js"></script>
    <script>tinymce.init({selector:'textarea'});</script>    -->
<h1 style="text-align: center;"> FORM PENDAFTARAN</h1><br><br><hr>
<div class="container">
<input type="hidden" id="id" name="id">
	<label>Tanggal :</label> <input type="text" id="tanggal" name="tanggal" class="form-control" style="width: 20%; margin-left: 20px;"></br>
	 <label>No.Urut</label><input type="text" id="nodaftar" name="nodaftar" value="RS00${noUrut}" placeholder="masukan nomor" class="form-control" style="width: 20%; margin-left: 20px;" />
		<hr>
<input type="hidden" class="form-control" id="pasien">
<input type="text" class="form-control col-md-4" id="noidentitas" style="width: 20%; margin-left: 20px;">
<input type="submit" name="pilih" id="pilih" value="PILIH" class="btn btn-default" style="margin-left:10px"/></br>
<table class="table table-bordered" id="tablepasien"><br>
	<thead>
		<tr>
			<th>NO.IDENTITAS</th>
			<th>NAMA PASIEN</th>
			<th>ALAMAT</th>
			<th>NO HP</th>
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
	</tbody>
</table>
<select id="petugas" class="form-control col-md-4" style="width: 20%; margin-left: 20px; ">
	<option></option>
	<c:forEach var="listPetugas" items="${listPetugas}">
	<option value="${listPetugas.id }">${listPetugas.nama}</option>
	</c:forEach>
</select></br><br><br>
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
        <h4 class="modal-title">Masukan Keluhan</h4>
      </div>
      <div class="modal-body">
        <textarea placeholder="Masukan Keluhan" class="form-control" rows="4" id="keluhan" name="keluhan"></textarea> 
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
			var keluhan = $('textarea[id ="keluhan"]').val();
			var petugas =$('#petugas').val();
			var nama = $('#nama').val();
		
			
			
			var tablependaftaran = {
					tanggal : tanggal,
					nodaftar : nodaftar,
					noidentitas : noidentitas,
					keluhan : keluhan,
					nama : nama,
					poli : {
						id : poli
					},
					pasien : {
						id : pasien
					},
					petugas : {
						id : petugas
					}
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
						trString += "<td>" +  listPoli.biaya + "</td>";
					trString +="</tr>";
				tbody.append(trString);
			});
		}
		function showData(){
			var pasien = $('#noidentitas').val();
			$.ajax({
				url :'/pendaftaran/getno/'+pasien,
				type: 'POST',
				dataType : 'json',
				success : function(data ,x,xhr){
					console.log("data is loaded");
					fillData(data);
				}	
			});
		}
		 
		function showDataPoli(){
			var poli = $('#poli').val();
			$.ajax({
				url :'/pendaftaran/getpo/'+poli,
				type: 'POST',
				dataType : 'json',
				success : function(data ,x,xhr){
					console.log("data is loaded");
					fillData2(data);
				}	
			});
		}
		
		function showDataPetugas(){
			$.ajax({
				url :'/petugas/getall',
				type: 'POST',
				dataType : 'json',
				success : function(data ,x,xhr){
					console.log("data is loaded");
					fillData2(data);
				}	
			});
		}
		function update(){
			
			var tanggal = $('#tanggal').val();
			var nodaftar = $('#nodaftar').val();
			var noidentitas = $('#noidentitas').val();
			var poli = $('#poli').val();
			var pasien =$('#pasien').val();	
			var keluhan = $('textarea[id ="keluhan"]').val();
			var petugas =$('#petugas').val();
			var nama = $('#nama').val();
			var id = $('#id').val();
		
			
			
			var tablependaftaran = {
					tanggal : tanggal,
					nodaftar : nodaftar,
					noidentitas : noidentitas,
					keluhan : keluhan,
					nama : nama,
					poli : {
						id : poli
					},
					pasien : {
						id : pasien
					},
					petugas : {
						id : petugas
					}
			}
			
			$.ajax({
				url: '/pendaftaran/update',
				type: 'PUT',
			 	contentType:'application/json',
			 	dataType : 'json',
				data: JSON.stringify(tablependaftaran), 
				success: function(data ,a , xhr){
					if( xhr.status == 201){
					}
					clearForm();
				}
				
			});
			
		}
		
		function updateColumn(data){
			$('#id').val(data.id);
			$('#tanggal').val(data.tanggal);
			$('#nodaftar').val(data.nodaftar);
			$('#noidentitas').val(data.noidentitas);
			$('#poli').val(data.poli);
			$('#pasien').val(data.pasien);	
			$('textarea[id ="keluhan"]').val(data.keluhan);
			$('#petugas').val(data.petugas);
			$('#nama').val(data.nama);
		}
		
		function clearForm(){
			$('#id').val("");
			$('#tanggal').val("");
			$('#noidentitas').val("");
			$('#poli').val("");
			$('#nodaftar').val("");
			$('textarea[id ="keluhan"]').val("");
			$('#pasien').val("");
			$('#petugas').val("");
			$('#nama').val("");
		}
	</script>
<script type="text/javascript" src="/resources/assets/js/bootstrap.min.js"></script>
</html>