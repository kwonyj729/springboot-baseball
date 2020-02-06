<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KBO 홈페이지</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
		<div class="text-center">
			<br />
			<h1>Korean Baseball Information</h1>
			<br />
		</div>

		<div class="row">
			<div class="col-sm-4">
				<table class="table table-bordered">
					<thead>
						<tr class="text-center">팀 리스트</tr>

						<tr id="team_title" class="text-center">
							<th>번호</th>
							<th>팀이름</th>
							<th>창립연도</th>
							<th>선수들보기</th>
						</tr>
					</thead>

					<c:forEach var="team" items="${teams}">
						<tbody>
							<tr class="team_item text-center">
								<td>${team.id}</td>
								<td>${team.teamname}</td>
								<td>${team.year}</td>
								<td><button type="button" abc1="${team.id}" class="team btn btn-primary">show</button></td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>


			<div class="col-sm-4">
				<%-- 				<c:choose> --%>
				<%-- 					<c:when test=""> --%>

				<table class="table table-bordered">
					<thead>
						<tr class="text-center">소속 선수 리스트</tr>
						
						<tr id="player_title" class="text-center">
							<th>번호</th>
							<th>이름</th>
							<th>상세보기</th>
						</tr>
					</thead>

				</table>
				<%-- 			</c:when> --%>
				<%-- 			<c:otherwise> --%>
				<%-- 			</c:otherwise> --%>
				<%-- 			</c:choose> --%>
			</div>

			<div class="col-sm-4">

				<table class="table table-bordered">
				
						<tr id="detail_title" class="text-center">선수 상세 보기</tr>
										
				</table>
			</div>




		</div>
		<!-- 	//////////////////////////////////////////////// -->



	<script>
	
let data1="";
let data2="";
	
//선수 리스트보기.
$('.team').on('click', function(event){

//	console.log(event.target.attributes.abc.value);
	data1 = event.target.attributes.abc1.value;
	console.log("팀번호 : "+data1);


	$.ajax({	
		type : 'GET',
		url : '/baseball/team/'+data1,
		dataType : 'json'     
			
	}).done(function(result){

		$('.player_item').remove();
		$('.detail_item').remove();
		
		for(var r of result){
			
			var item_el = 
			"<tr class='player_item text-center'><td>"+r.id+
			"</td><td>"+r.name+
			"</td><td><button onclick='player_choice("+r.id+")' type='button' abc2='"+r.id+"' class='btn btn-warning'>show</button></td></tr>";
	
			$('#player_title').after(item_el);
		}

		
	}).fail(function(result){
		console.log('서버오류');

	});
});

//선수 상세보기.
$('#bb').on('click', function(e){
	alert('선수번호:'+r.id);
});
//선수 상세보기.

function player_choice(r_id) {

	let data2 = r_id;
 	console.log("선수번호 : "+data2);
	
	$.ajax({
		type : 'GET',
		url : '/baseball/player/'+data2,
		dataType : 'json'      
			
	}).done(function(r){
		
		$('.detail_item').remove();
		
		
			var item_el= "<tr class='detail_item'><td>선수번호 : "+r.id+
			"</td></tr><tr class='detail_item'><td>이름 : "+r.name+
			"</td></tr><tr class='detail_item'><td>신장 : "+r.height+
			"</td></tr><tr class='detail_item'><td>포지션 : "+r.position+
			"</td></tr><tr class='detail_item'><td>소속팀번호 : "+r.teamId+
			"</td></tr>";

			$('#detail_title').after(item_el);
		
	}).fail(function(result){
		console.log('서버오류');
		console.log(result);
	});

	
	
}

</script>
</body>
</html>