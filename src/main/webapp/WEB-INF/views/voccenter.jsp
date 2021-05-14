<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>

<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<jsp:include page="/WEB-INF/views/home/maintemplethead.jsp"></jsp:include><!-- 상단바로고디자인 -->
<jsp:include page="/WEB-INF/views/home/maintempletbar.jsp"></jsp:include><!-- 상단바와 로고 -->
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<title>ezen</title>
</head>
<!--리뷰작성 스타일-->
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
 <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <ol>
          <li><a href="index.html">Home</a></li>
          <li>고객센터</li>
        </ol>
        <h2>고객센터</h2>

      </div>
    </section><!-- End Breadcrumbs -->
    
<!-- ======= Contact Section ======= -->
<main>
    <section id="contact" class="contact">
      <div class="container">
        <div class="row">
        
        <!-- 여기서부터 내용입력 -->
          <div class="col-lg-6">
            <div class="info-box mb-4">
              <i class="bx bx-map"></i>
              <h3>Address</h3>
              <p>서울특별시 중랑구 망우로 319 4층 명진빌딩</p>
            </div>
          </div>

          <div class="col-lg-3 col-md-6">
            <div class="info-box  mb-4">
              <i class="bx bx-envelope"></i>
              <h3>Email</h3>
              <p>ezenpc@teamproject.com</p>
            </div>
          </div>

          <div class="col-lg-3 col-md-6">
            <div class="info-box  mb-4">
              <i class="bx bx-phone-call"></i>
              <h3>Call</h3>
              <p>0507-1420-0421</p>
            </div>
          </div>

        </div>

        <div class="row">

          <div class="col-lg-6 ">
            <jsp:include page="/WEB-INF/views/customercenter/map.jsp"></jsp:include>
          </div>
          
  		<jsp:include page="/WEB-INF/views/customercenter/reviewup.jsp"></jsp:include><!-- 리뷰등록 -->

        </div>
		 <jsp:include page="/WEB-INF/views/customercenter/q.jsp"></jsp:include><!-- f&q -->
				  <br/><br/><br/>
		 
		 <jsp:include page="/WEB-INF/views/customercenter/reviewslide.jsp"></jsp:include><!-- 리뷰슬라이드-->
		 
				  <br/><br/><br/><br/><br/><br/><br/>
		
		
		
		</div>		 
    </section><!-- End Contact Section -->
  </main><!-- End #main -->

  

 




<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<script src="/resources/js/review.js"></script><!-- 리뷰리스트와인서트 -->
<jsp:include page="/WEB-INF/views/home/maintempletfooter.jsp"></jsp:include><!-- footer형태-->
<jsp:include page="/WEB-INF/views/home/maintempletfooterjs.jsp"></jsp:include><!-- 템플릿전체움직임-->

</body>
</html>