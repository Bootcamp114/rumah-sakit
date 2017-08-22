<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Form Dokter</title>
</head>

	<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css" />
	<link rel="stylesheet" href="/resources/assets/DataTables-1.10.15/media/css/jquery.dataTables.min.css" />
	<link rel="stylesheet" href="/resources/assets/css/bootstrap-theme.min.css" />
	<script type="text/javascript" src="/resources/assets/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			
			$("#tableDokter").DataTable();
			showData();
			
			$("#save").on("click",function(){	
				save();	
				showData();	
				clearForm();
			});
			
			$("#loadData").on("click",function(){
				showData();
			});
		
			/* $("#showPoli").on("click",function(){
				showDataPoli();
			});
			 */
			$(document).on("click",".delete",function(){
				var conf = confirm("Apakah yakin akan dihapus ? ");
				if(conf == true){
					doDelete(this);	
				}
			});
			
			$(document).on("click",".update",function(){
				var id = $(this).attr("id_update");
				
				$.ajax({
					url : '/dokter/getById/'+id,
					type : 'GET',
					success : function(data){
						updateColumn(data);
					}
				});
			});
			
			$(document).on("click",".pilih",function(){
				var id = $(this).attr("id_pilih");
				
				$.ajax({
					url : '/dokter/getPoliById/'+id,
					type : 'GET',
					success : function(data){
						pilihPoli(data);
						console.log("terpiih");
					}
				});
			});
			
			$("#update").on("click",function(){
				update();
				showData();	
				clearForm();
				alert("Terupdate");
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
					<input type="number" name="nip" id="nip" class="form-control" autofocus placeholder="Masukan NIP" required >	
				</div>
				<div class="form-group">
					<label>Nama</label>
					<input type="text" name="nama" id="nama" class="form-control" autofocus placeholder="Masukan Nama" required>	
				</div>
				<div class="form-group">
					<label>Alamat</label>
					<input type="text" name="alamat" id="alamat" class="form-control" autofocus placeholder="Masukan Alamat" required >	
				</div>
				<div class="form-group">
					<label>No HP</label>
					<input type="number" name="noHp" id="noHp" class="form-control" autofocus placeholder="Masukan No HP" required maxlength="13">	
				</div>
				<div class="form-group">
					<label>Jenis Kelamin</label>
					<br/>
					<select id="jk" class="form-control" >
						<option >Jenis Kelamin</option>
						<option value="L">L</option>
						<option value="P">P</option>
					</select>
				</div>
				<div class="form-group">
					<label>Poli</label>
					<input type="hidden" name="id" id="idPoli" class="form-control" autofocus placeholder="Poli" required readonly>
					<input type="text" name="poli" id="poli" class="form-control" autofocus placeholder="Poli" required readonly>	
					<br>
					<button type="button" class="btn btn-primary btn-md" data-toggle="modal" data-target="#modalPoli" id="showPoli">
	  					Pilih Poli
					</button>
				</div>
				<div class="form-group">
					<button type="button" class="btn btn-primary" id="save">Save Changes</button>
	        		<button type="button" class="btn btn-default" id="update">Update</button></div>
				</div>
			<div class="col-md-8">
				<a href="#" id="loadData">Load Data</a>
				<table class="table" id="tableDokter">
					<thead>
						<tr>
							<th>NIP</th>
							<th>NamaDokter</th>
							<th>JenisKelamin</th>
							<th>Alamat</th>
							<th>NoHP</th>
							<th>Poli</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						
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
								<th>Ruangan</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="listPoli" items="${listPoli}">
								<tr>
									<td>${listPoli.poli}</td>
									<td>${listPoli.ruangan}</td>
									<td>
										<a href='#' class='pilih' id_pilih='${listPoli.id}' data-dismiss="modal">Pilih</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
      			</div>
      			<div class="modal-footer">
        			<!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
      			</div>
    		</div>
  		</div>
	</div>
<!-- end modal periksa  -->
</body>
	<script type="text/javascript">
		function save(){
			var nip = $('#nip').val();
			var nama = $('#nama').val();
			var jk = $('#jk').val();
			var alamat = $('#alamat').val();
			var noHp = $('#noHp').val();
			var poli = $('#idPoli').val();
						
			var dokter = {
					nip : nip,
					nama : nama,
					jk : jk,
					alamat : alamat,
					noHp : noHp ,
					poli : {
						id : poli
					}
			}
			
			$.ajax({
				url: '/dokter/save',
				type: 'POST',
			 	contentType:'application/json',
			 	dataType : 'json',
				data: JSON.stringify(dokter), 
				success: function(data,x,xhr){
					showData();	
					clearForm();
				}
			
			});
		}
		
		function doDelete(del){
			var id = $(del).attr("id_delete");
			$.ajax({
				url : "/dokter/delete/"+id,
				type : "DELETE",
				success : function(data){
					console.log(data);
					showData();
				}
			});
		}
		
		function fillData(data){
			var dt = $("#tableDokter");
			var tbody = dt.find("tbody");
			tbody.find("tr").remove();
			$.each(data, function(index , listDokter){
				var trString = "<tr>";
						trString += "<td>" + listDokter.nip + "</td>";
						trString += "<td>" + listDokter.nama + "</td>";
						trString += "<td>" + listDokter.jk + "</td>";
						trString += "<td>" + listDokter.alamat + "</td>";
						trString += "<td>" + listDokter.noHp + "</td>";
						trString += "<td>" + listDokter.poli.poli + "</td>";
						trString += "<td><a href='#' class='delete' id_delete='" + listDokter.id + "'>delete</a></td>";
						trString += "<td><a href='#' class='update' id_update='" + listDokter.id + "'>edit</a></td>";
					trString +="</tr>";
				tbody.append(trString);
			});
		}
		
		function showData(){
			$.ajax({
				url :'/dokter/getAll',
				type: 'POST',
				dataType : 'json',
				success : function(data ,x,xhr){
					console.log("data is loaded");
					fillData(data);
				}	
			});
		}
		/* modal poli  */
		/* function fillDataPoli(data){
			var dt = $("#tablePoli");
			var tbody = dt.find("tbody");
			tbody.find("tr").remove();
			$.each(data, function(index , listPoli){
				var trString = "<tr>";
						trString += "<td>" + listPoli.poli + "</td>";
						trString += "<td><a href='#' class='pilihPoli' id_pilih='" + listPoli.id + "' data-dismiss='modal' >Pilih</a></td>";
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
		 */
		/* end modal poli */
		function update(){
			var nip = $('#nip').val();
			var nama = $('#nama').val();
			var jk = $('#jk').val();
			var alamat = $('#alamat').val();
			var noHp = $('#noHp').val();
			var poli = $('#idPoli').val();
			var id = $('#id').val();
			
			var dokter = {
					nip : nip,
					nama : nama,
					jk : jk,
					alamat : alamat,
					noHp : noHp,
					poli : {
						id : poli
					},
					id : id
			}
			
			$.ajax({
				url: '/dokter/update',
				type: 'PUT',
			 	contentType:'application/json',
			 	dataType : 'json',
				data: JSON.stringify(dokter), 
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
			$('#noHp').val(data.noHp);
			$('#idPoli').val(data.poli.idPoli);
			$('#poli').val(data.poli.poli);
		}
		
		function pilihPoli(data){
			$('#idPoli').val(data.id);
			$('#poli').val(data.poli);
		}
		
		function clearForm(){
			$('#id').val("");
			$('#nip').val("");
			$('#nama').val("");
			$('#jk').val("");
			$('#alamat').val("");
			$('#noHp').val("");
			$('#idPoli').val("");
			$('#poli').val("");
			$('#idPoli').val("");
			$('#poli').val("");
		}
	</script>
	<script type="text/javascript" src="/resources/assets/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/resources/assets/DataTables-1.10.15/media/js/jquery.dataTables.min.js"></script>
</html>