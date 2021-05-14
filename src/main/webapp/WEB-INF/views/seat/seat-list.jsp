<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>

<html>
<head>
<jsp:include page="/WEB-INF/views/home/maintemplethead.jsp"></jsp:include><!-- 상단바로고디자인 -->
<jsp:include page="/WEB-INF/views/home/maintempletbar.jsp"></jsp:include><!-- 상단바와 로고 -->
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>ezen</title>
</head>
<!--리뷰작성 스타일-->
<style>

.div2 {
        border: 1px solid;
        width: 50px;
        height: 50px;
        display: flex;
        align-items: center;
        justify-content: center;
        background-color: #444451;

  margin: 3px;
        
      }

      .clicked {
      background-color: #6feaf6;
        color: gold;
      }
</style>
<body>
 <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <ol>
          <li><a href="/">Home</a></li>
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
            <div class="div1">
      <div class="div2">div2_1</div>
      <div class="div2">div2_2</div>
      <div class="div2">div2_3</div>
      <div class="div2">div2_4</div>
      <div class="div2">div2_5</div>
      <div class="div2">div2_6</div>
      <div class="div2">div2_7</div>
      <div class="div2">div2_8</div>
      <div class="div2">div2_9</div>
      <div class="div2">div2_10</div>
    </div>
		
		</div>
		</div>		 
    </section><!-- End Contact Section -->
  </main><!-- End #main -->

  

 




<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
  <script> var div2 = document.getElementsByClassName("div2");

  function handleClick(event) {
    console.log(event.target);
    // console.log(this);
    // 콘솔창을 보면 둘다 동일한 값이 나온다

    console.log(event.target.classList);

    if (event.target.classList[1] === "clicked") {
      event.target.classList.remove("clicked");
    } else {
      for (var i = 0; i < div2.length; i++) {
        div2[i].classList.remove("clicked");
      }

      event.target.classList.add("clicked");
    }
  }

  function init() {
    for (var i = 0; i < div2.length; i++) {
      div2[i].addEventListener("click", handleClick);
    }
  }

  init();</script>
<script src="/resources/js/review.js"></script><!-- 리뷰리스트와인서트 -->
<jsp:include page="/WEB-INF/views/home/maintempletfooter.jsp"></jsp:include><!-- footer형태-->
<jsp:include page="/WEB-INF/views/home/maintempletfooterjs.jsp"></jsp:include><!-- 템플릿전체움직임-->

</body>
</html>