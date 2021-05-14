<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<!-- 팝업창입니다. -->
<html>
<head>

<jsp:include page="/WEB-INF/views/home/maintemplethead.jsp"></jsp:include><!-- 상단바로고디자인 -->
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.probox {
margin: auto;
    width: 100px;
    height: 100px; 
    border-radius: 70%;
    overflow: hidden;
}

.profileone {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

</style>
<body>

    
<!-- ======= Contact Section ======= -->
  <div class="col-lg-6">
       
            <div class="probox" style="background: #BDBDBD;"> <!-- 사진미등록자는 기본프로필화면으로보이게 -->
						<img class="profileone"  id= "poto" src="" onerror="this.src='/resources/images/user/basic.png';"alt='' /> 
					</div><br><br>
              <div class="form-row">
                <div class="col form-group">
                <input type="hidden" name="userNum"  id="userNum">
                
                  <input type="text" name="userId" class="form-control" id="userId" placeholder="Your Name"   readonly />
                  <div class="validate"></div>
                </div>
                <div class="col form-group">
                  <input type="email" class="form-control" name="email" id="email" placeholder="Your Email"   readonly />
                  <div class="validate"></div>
                </div>
              </div>
              <jsp:include page="/WEB-INF/views/customercenter/star.jsp"></jsp:include><!-- 별-->
              <div class="form-group">
                <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject"    />
                <div class="validate"></div>
              </div>
              <div class="form-group">
                <textarea class="form-control" name="message" rows="5" data-rule="required" data-msg="Please write something for us" placeholder="Message"></textarea>
                <div class="validate"></div>
              </div>

     
              
             <a  onclick="upload()" class="float-right btn text-white btn-danger"> <i class="fa fa-heart"></i> 수정하기</a>
           
            
            </div>


</body>
<script>
window.onload = function(){
	var cuturl = document.URL;
	var cuturl2 = new URL(cuturl);
	var revNums = cuturl2.searchParams.get("revNums"); //주소컷
	var photo = '';
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/review/view?revNum='+revNums);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var res = JSON.parse(xhr.responseText);
			$('[name=message]').text(res.revComment);
			$('[name=userNum]').val(res.userInfo.userNum); //input
			$('[name=userId]').val(res.userInfo.userId);
			photo = res.userInfo.profilePath;
			var img_src = '/resources/images/user/' +photo;
			document.getElementById("poto").src = img_src;//이미지src변경
			
			
			}
			
			
			
		}
	xhr.send();
	}
	
	


function upload(){ 
	var reviewp = {
			revNum : '${param.revNums}',//주소컷
			revComment : document.querySelector('[name=message]').value,
			revStar : $('#count').text(),
			userInfo : {userNum : document.querySelector('[name=userNum]').value
				}}
	alert(reviewp.revComment);
	var xhr = new XMLHttpRequest();
	xhr.open('POST', '/review/update');
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			if(xhr.responseText && xhr.responseText!=null){
				console.log(xhr.responseText);
				alert('수정완료');
				close();
			}
		}
	}
	xhr.setRequestHeader('content-type','application/json;charset=UTF-8');
	xhr.send(JSON.stringify(reviewp));
}


</script>

</html>