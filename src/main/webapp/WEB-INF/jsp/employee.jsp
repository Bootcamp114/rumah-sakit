<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/assets/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//save listener
		$("input[id='submit']").on("click", function(){
			save();
			
		});
		
		//load data listener
		$("#loadData").on('click', function(){
			showData();
		});
		
		//delete listener
		$(document).on("click", '.delete', function(){
			onDelete(this);
		});
		
		//btn update submit
		$('#btnSubmit').on('click',function(){
			var name = $('input[name="name"]').val();
			var address = $('input[name="address"]').val();
			var salary = $('input[name="salary"]').val();
			var email = $('input[name="email"]').val();
			var id = $('input[name="id"]').val();
			
			var employee = {
					name: name,
					address : address,
					salary : salary,
					email : email,
					id : id
			}
			
			$.ajax({
				url : '/employee/update',
				type: 'PUT',
				contentType: 'application/json',
				data: JSON.stringify(employee),
				success : function(data){
					showData();
					clearColumn();
				}
			});
		});
			
		//update listener
		//get item
		$(document).on("click", '.update', function(){
			var id = $(this).attr('id_update');
			$.ajax({
				url : '/employee/getdatabyid/'+ id,
				type : 'GET',
				dataType: 'json',
				success : function(data){
					updateColumn(data);
				}
			});
		});
		
		//set
	});
</script>
</head>
<body>
	<div id="form-employee">
		<input type="hidden" name="id" >
		<input type="text" name="name" placeholder="enter your name" /></br>
		<input type="text" name="address" placeholder="enter your address" /></br>
		<input type="number" name="salary" placeholder="enter your the salary"  /></br>
		<input type="email" name="email" placeholder="enter your valid email" /></br>
		<input type="submit" id="submit" name="submit" />
		<input type="submit" id="btnSubmit" name="btnSubmit" value="update"/></br>
	</div>
	
	<a href="#" id="loadData">Load</a>
	<p>
		<table id="emp-dt">
			<thead>
				<tr>
					<th>Name</th>
					<th>Address</th>
					<th>Salary</th>
					<th>Email</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
	</p>
</body>
<script>
	function showData(){
		$.ajax({
			url: '/employee/getAll',
			type: 'POST',
			dataType: 'json',
			success: function(data, x, xhr){
				console.log("data is loaded!!");
				fillData(data);
			}
		});
	}
	
	function fillData(data){
		var dt = $('#emp-dt');
		var tbody = dt.find('tbody');
		tbody.find('tr').remove();
		//extract data json
		$.each(data, function(index, employee){
		var trString = "<tr>";
				trString += "<td>";
					trString += employee.name;
				trString += "</td>";
				trString += "<td>";
					trString += employee.address;
				trString += "</td>";
				trString += "<td>";
					trString += employee.salary;
				trString += "</td>";
				trString += "<td>";
					trString += employee.email;
				trString += "</td>";
				trString += "<td>";
					trString += "<a id_delete='"+employee.id+"' href='#' class='delete'>Delete</a> |";
					trString += "<a id_update='"+employee.id+"' href='#' class='update'> Update</a>";
				trString += "</td>";
			trString += "</tr>";
			
			tbody.append(trString);
		});
	}
	
	function save(){
			var name = $('input[name="name"]').val();
			var address = $('input[name="address"]').val();
			var salary = $('input[name="salary"]').val();
			var email = $('input[name="email"]').val();
			
			//same with java POJO (java encapsulation)
			var employee = {
					"name": name,
					address : address,
					salary : salary,
					email : email
			}
			
			//AJAX => asyncronous javascript and XML
			$.ajax({
				url: '/employee/save',
				type : 'POST',
				contentType: 'application/json', // header json
				data: JSON.stringify(employee), //convert object to string
				success: function(data, a, xhr){ //result dari controller

					if(xhr.status == 201){
						console.log("data berhasil di create!!s");
						showData();
					}
					clearColumn();
				}
			});
	}
	
	function onDelete(ini){
		var id = $(ini).attr('id_delete');
		//ajax for deleting
		$.ajax({
			url : '/employee/delete/'+id,
			type : 'DELETE',
			success : function(data){
				showData();
			}
		});
	}
	
	function updateColumn(data){
		$('input[name="name"]').val(data.name);
		$('input[name="id"]').val(data.id);
		$('input[name="address"]').val(data.address);
		$('input[name="salary"]').val(data.salary);
		$('input[name="email"]').val(data.email);
	}
	
	function clearColumn(){
		$('input[name="name"]').val("");
		$('input[name="address"]').val("");
		$('input[name="salary"]').val("");
		$('input[name="email"]').val("");
	}
</script>
</html>