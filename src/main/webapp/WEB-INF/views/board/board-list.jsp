<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="/resources/datatable/datatables.css" />
<script src="/resources/datatable/datatables.js"></script>
</head>
<body>
<!--  	<script>
	//다큐먼트가 준비가될때 펑션실행하라.
	$(document).ready(function(){ //function앞부터
		try{ 
			var tableObj = document.querySelector('#example');
			alert(tableObj.id);
	}catch(e){
		alert(e);
		}
	}); //}까지 펑션의 호출.   
	
	-->
	<script>
	$(document).ready(function(){
		$('#example').DataTable({
			processing : true,
			serverSide : true,
			ajax : '/boards',
			columns : [
				{'data':'boNum'},
				{'data':'boTitle'},
				{'data':'boContent'}
			]
		})
	});
	</script>
	<table id="example" class="display" style="width: 70%">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>컨텐트</th>
			</tr>
		</thead>
	</table>

	<!--  <script>
	window.onload = function(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/boards?size=20');
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			var res = JSON.parse(xhr.responseText);
			var html = '';
			for(var board of res){
				html += '<tr>';
				html += '<td>' + board.boNum +'</td>';
				html += '<td>' + board.boTitle +'</td>';
				html += '</tr>';
				}
			document.querySelector('#tBody').innerHTML = html;
			}
		}
		xhr.send();
	}
	</script>
-->
</body>
</html>