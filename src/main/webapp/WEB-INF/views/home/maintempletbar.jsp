<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


  <!-- ======= Top Bar ======= -->
  
  
  <section id="topbar" class="d-none d-lg-block">
    <div class="container d-flex">
      <div class="contact-info mr-auto">
        <i class="icofont-envelope"></i><a href="mailto:contact@example.com">anjo0127@naver.com</a>
        <i class="icofont-phone"></i> +82 010 2316 2713
      </div>

    </div>
  </section>

  <!-- ======= Header ======= -->
  <header id="header">
    <div class="container d-flex">

      <div class="logo mr-auto">
        <h1 class="text-light"><a href="/"><span>EZEN PC</span></a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
      </div>

      <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li class="active"><a href="/">Home</a></li>


 
          <li><a href="/views/seat">좌석현황</a></li>
          <li><a href="/views/food">메뉴</a></li>
          <li><a href="/views/timecharge">시간충전</a></li>
          <li><a href="/views/voccenter">고객센터</a></li>
          
          <c:if test="${UserInfo eq null }">
          	<li><a href="/views/login">로그인/회원가입</a></li>			
			</c:if>
					
					
					<c:if test="${UserInfo ne null }">
					
                     <li class="drop-down" id="loginButton"><a href="/views/userinfo" >
                     <img src="/resources/images/user/${UserInfo.profilePath }" onerror="this.src='/resources/images/user/basic.png';" class="brand_logo" alt="Logo" style="border-radius: 20px; width: 20px; height: 20px;">
                     ${UserInfo.userName }님 반갑습니다</a>
            <ul>
              <li><a href="/views/userinfo" onclick="update()">내 정보보기</a></li>
              <li><a href="/views/index" onclick="logout()">로그아웃</a></li>
            </ul>
          </li>
          </c:if>
          
        </ul>
      </nav><!-- .nav-menu -->
    </div>
  </header><!-- End Header -->
  <script>
  function update(){
		var xhr = new XMLHttpRequest();
		xhr.open('POST','/loads');
		xhr.onreadystatechange = function(){
			if(xhr.readyState==4 && xhr.status==200){
				var res = JSON.parse(xhr.responseText);
			}
		}
		var formData = new FormData();
		var UserInfo = ${UserInfo.userNum}
		formData.append('UserInfo',UserInfo);
		xhr.send(formData);
	}
  </script>
  <script src="/resources/js/logindi.js"></script><!-- 로그인로그아웃로직 -->

