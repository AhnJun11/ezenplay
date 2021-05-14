<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/resources/css/userinfo.css">
<link rel="stylesheet" href="/resources/css/inputcss.css"> <!-- input css -->
<jsp:include page="/WEB-INF/views/home/maintemplethead.jsp"></jsp:include><!-- 상단바로고디자인 -->
<jsp:include page="/WEB-INF/views/home/maintempletbar.jsp"></jsp:include><!-- 상단바와 로고 -->
</head>
<body>
<c:if test="${UserInfo eq null }">
	<script>
		alert('권한없음');
		location.href = '/';
	</script>
</c:if>
<div class="container emp-profile">
            <form method="post" enctype="multipart/form-data" action="/update">
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-img">
                        	<div id="profile-i"> </div><!-- 프로필사진 -->
                            <div class="file btn btn-lg btn-primary">
                                사진 변경
                                <input type="file" name="file" onchange="change(this)"/><br>
                            </div>
                        </div>
                    </div>
 
                    <div class="col-md-6">
                        <div class="profile-head">
                        
                                   <div>
                                   <div id="userName" onclick="showName()">
                                   </div>
                                   <div class="password-field" id="hideUserName" style="display:none">
                                   <input onkeyup="if(window.event.keyCode==13)printName()" type="text" name="userName" value="${UserInfo.userName }" style="width:220px;" placeholder="이름"><button type="button" onclick="showName()">X</button>
                                   </div>
                                   </div>
                                   <!-- 유저이름 -->
                                   
                                    <h6><span id="grade-img"></span> <span id="grade-name"></span></h6><!-- 유저등급,등급명 -->
                                    
                                    <p class="proile-rating">다음등급까지 남은금액: <span id="totalAmount"></span>/<span id="gradePrice"></span></p> <!-- 사용자가쓴금액/다음등급금액 -->
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">개인정보</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">결제내역</a>
                                </li>
                            </ul>
                           <small style="color:#8C8C8C;"> *수정가능</small><br>
                           <small style="color:#8C8C8C;"> (수정후 꼭 Enter키를 눌러주세요)</small>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <input type="button" class="profile-edit-btn" name="btnAddMore" value="수정" onclick="update()"/> <!-- 수정버튼 -->
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-work">
                       <button class="profile-my-btn" type="button" onclick="showImg()" style="margin-left: 50px;">기본이미지로변경</button><br>
                         <p>Link</p>
                            <a href="/views/voccenter">My review</a><br/>
                            <a style="cursor:pointer;" id="mycss" onclick="goRedfila()">Learn from redfila</a>
                            <p>SKILLS</p>
                       		 <a style="cursor:pointer" onclick="cancelRes()">예약취소</a><br>
                            <a style="cursor:pointer;"id="mycs" onclick="showPassword()">회원탈퇴</a><div class="password-field" id="hideP" style="display:none"><input type="password" name="userPwd" placeholder="password">
                            <button type="button" onclick="return doDelete()">탈퇴</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="tab-content profile-tab" id="myTabContent">
                            <div class="tab-pane show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>User Id</label>
                                            </div>
                                            <div class="col-md-6" id="userId">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label for="userPhone">*Phone</label>
                                            </div>
                                            <div style="width:365px;">
                                            <div class="col-md-6" id="userPhone" onclick="showPhone()">
                                            </div>
                                            <div class="password-field" id="hideUserPhone" style="display:none">
                                             <input onkeyup="if(window.event.keyCode==13)printPhone()" type="text" name="userPhone" value="${UserInfo.userPhone}" style="width:220px;" placeholder="Phone"><button type="button" onclick="showPhone()">X</button>
                                            </div>
                                            
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>*Address</label>
                                            </div>
                                            <div style="width:365px;">
                                            <div class="col-md-6" id="userAddr1" onclick="showAddr1()">    <!-- 합치기힘들어서 일단나눔 -->
                                            </div>
                                            <div class="password-field" id="hideUserAddress1" style="display:none">
                                             <input onkeyup="if(window.event.keyCode==13)printAddr1()" type="text" name="userAddr1" value="${UserInfo.userAddr1 }" style="width:220px;" placeholder="Address"><button type="button" onclick="showAddr1()">X</button>
                                            </div>
                                             </div>
                                        </div>
                                         <div class="row">
                                            <div class="col-md-6">
                                                <label>*Address2</label>
                                            </div>
                                            <div style="width:365px;">
                                            <div class="col-md-6" id="userAddr2" onclick="showAddr2()">
                                            </div>
                                            <div class="password-field" id="hideUserAddress2" style="display:none">
                                             <input onkeyup="if(window.event.keyCode==13)printAddr2()" type="text" name="userAddr2" value="${UserInfo.userAddr2 }" style="width:220px;" placeholder="Address"><button type="button" onclick="showAddr2()">X</button>
                                            </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>*Email</label>
                                            </div>
                                            <div style="width:365px;">
                                            <div class="col-md-6" id="userEmail" onclick="showEmail()">
                                            </div>
                                             <div class="password-field" id="hideUserEmail" style="display:none">
                                             <input onkeyup="if(window.event.keyCode==13)printEmail()" type="text" name="userEmail" value="${UserInfo.userEmail }" style="width:220px;" placeholder="Address"><button type="button" onclick="showEmail()">X</button>
                                            </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Mileage</label>
                                            </div>
                                      
                                            <div class="col-md-6" id="userMileage">
                                           <p> ${UserInfo.userMileage}</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>RestTime</label>
                                            </div>
                                            <div class="col-md-6" id="restOfTime">
                                            </div>
                                        </div>
                                        <input type="hidden" id="favoriteGame" value="${UserInfo.favoriteGame}">
                                        <input type="hidden" id="userProfile" value="${UserInfo.userProfile}">
                                        <input type="hidden" id="profilePath" value="${UserInfo.profilePath}">
                                        <input type="hidden" id="userNum" value="${UserInfo.userNum}">
                                        
                            </div>
                            <div class="tab-pane" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                 <iframe src="https://localhost/views/user/payhistory" frameborder="1" width="100%" height="350px"> </iframe> <!-- 결제내역page -->
                            </div> 
                        </div>
                    </div>
                </div>
            </form>           
        </div>
        <jsp:include page="/WEB-INF/views/home/maintempletfooter.jsp"></jsp:include><!-- footer형태-->
		<jsp:include page="/WEB-INF/views/home/maintempletfooterjs.jsp"></jsp:include><!-- 템플릿전체움직임-->
<script src="/resources/js/user-info.js"></script>
</body>
</html>