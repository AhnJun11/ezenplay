<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style><!--리뷰스타일-->
.rating-header {
    margin-top: -10px;
    margin-bottom: 10px;
}
body{margin-top:20px;}

.align-center {
    text-align: center;
}
.hash-list {
    display: block;
    padding: 0;
    margin: 0 auto;
}

@media (min-width: 768px){
    .hash-list.cols-3 > li:nth-last-child(-n+3) {
        border-bottom: none;
    }
}
@media (min-width: 768px){
    .hash-list.cols-3 > li {
        width: 33.3333%;
    }
}
.hash-list > li {
    display: block;
    float: left;
    border-right: 1px solid rgba(0, 0, 0, 0.2);
    border-bottom: 1px solid rgba(0, 0, 0, 0.2);
}
.pad-30, .pad-30-all > * {
    padding: 30px;
}
img {
    border: 0;
}
.mgb-20, .mgb-20-all > * {
    margin-bottom: 20px;
}
.wpx-100, .wpx-100-after:after {
    width: 100px;
}
.img-round, .img-rel-round {
    border-radius: 50%;
}
.padb-30, .padb-30-all > * {
    padding-bottom: 30px;
}

.mgb-40, .mgb-40-all > * {
    margin-bottom: 40px;
}
.align-center {
    text-align: center;
}
[class*="line-b"] {
    position: relative;
    padding-bottom: 20px;
    border-color: #E6AF2A;
}
.fg-text-d, .fg-hov-text-d:hover, .fg-active-text-d.active {
    color: #222;
}
.font-cond-b {
    font-weight: 700 !important;
}
.fontw {
line-height: 100%;
font-weight: bold ;
}
.margingood {
  border: 10px solid red;
  border-radius: 30px 0px;
}
p{word-break:break-all;
}
.card-inner{
    margin-left: 4rem;
</style>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<!------ Include the above in your HEAD tag ---------->




<div class="container text-center my-3">
    <h3 style="cursor: pointer;" onclick="location.href='/views/customercenter/reviewlist'">리뷰보기</h3>
    
    <div id="recipeCarousel" class="carousel slide w-100" data-ride="carousel">
        <div class="carousel-inner w-100" role="listbox">
            <div class="carousel-item row no-gutters active">
            
            	<section id="services" class="services">
				      <div class="container">
				
				
				        <div class="row">
				          <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
				            <div class="icon-box">
				            <div id="iconbox0"></div>
				              <div id= "revStar0"></div>
				              <h4><div id="userId0" style="cursor: pointer;" ></div></h4>
				              <p id= "revComment0"></p>
				            </div>
				          </div>
				
				          <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
				            <div class="icon-box">
				            <div id="iconbox1"></div>
				              <div id= "revStar1"></div>
				              <h4><div id="userId1" style="cursor: pointer;" ></div></h4>
				              <p id= "revComment1"></p>
				            </div>
				          </div>
				
				          <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
				            <div class="icon-box">
				            <div id="iconbox2"></div>
				              <div id= "revStar2"></div>
				              <h4><div id="userId2" style="cursor: pointer;" ></div></h4>
				              <p id= "revComment2"></p>
				            </div>
				          </div>
				          </div>
				         </div>
				  </section>
               
            </div>
            <div class="carousel-item row no-gutters">
                <section id="services" class="services">
				      <div class="container">
				        <div class="row">
				          <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
				            <div class="icon-box">
				            <div id="iconbox3"></div>
				              <div id= "revStar3"></div>
				              <h4><div id="userId3" style="cursor: pointer;" ></div></h4>
				              <p id= "revComment3"></p>
				            </div>
				          </div>
				
				          <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
				            <div class="icon-box">
				            <div id="iconbox4"></div>
				              <div id= "revStar4"></div>
				              <h4><div id="userId4" style="cursor: pointer;" ></div></h4>
				              <p id= "revComment4"></p>
				            </div>
				          </div>
				
				          <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
				            <div class="icon-box">
				            <div id="iconbox5"></div>
				              <div id= "revStar5"></div>
				              <h4><div id="userId5" style="cursor: pointer;" ></div></h4>
				              <p id= "revComment5"></p>
				            </div>
				          </div>
				          </div>
				          </div>
				  </section>
            </div>
        </div>
        
       <!-- End Services Section 직접적으로 움직이게해주는태그-->
        <a class="carousel-control-prev" href="#recipeCarousel" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#recipeCarousel" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

</div>



