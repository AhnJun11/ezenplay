<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
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
</style>
</head>
<body>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->



<div class="container text-center my-3">
    <h3>리뷰보기</h3>
    <div id="recipeCarousel" class="carousel slide w-100" data-ride="carousel">
        <div class="carousel-inner w-100" role="listbox">
            <div class="carousel-item row no-gutters active">
                <div class="col-3 float-left">
			          <img src="http://newsroom.etomato.com/userfiles/black1(13).jpg" class="wpx-100 img-round mgb-20" title="" alt="" data-edit="false" data-editor="field" data-field="src[Image Path]; title[Image Title]; alt[Image Alternate Text]">
			          <p class="fs-110 font-cond-l" contenteditable="false">" 1번째error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae. "</p>
			          <h5 class="font-cond mgb-5 fg-text-d fs-130" contenteditable="false">Martha Stewart</h5>
			          <small class="font-cond case-u lts-sm fs-80 fg-text-l" contenteditable="false">Business Woman - New York</small>
        		</div>
                <div class="col-3 float-left">
			          <img src="https://bootdey.com/img/Content/avatar/avatar1.png" class="wpx-100 img-round mgb-20" title="" alt="" data-edit="false" data-editor="field" data-field="src[Image Path]; title[Image Title]; alt[Image Alternate Text]">
			          <p class="fs-110 font-cond-l" contenteditable="false">" 1번째error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae. "</p>
			          <h5 class="font-cond mgb-5 fg-text-d fs-130" contenteditable="false">Martha Stewart</h5>
			          <small class="font-cond case-u lts-sm fs-80 fg-text-l" contenteditable="false">Business Woman - New York</small>
        		</div>
                <div class="col-3 float-left">
			          <img src="https://bootdey.com/img/Content/avatar/avatar1.png" class="wpx-100 img-round mgb-20" title="" alt="" data-edit="false" data-editor="field" data-field="src[Image Path]; title[Image Title]; alt[Image Alternate Text]">
			          <p class="fs-110 font-cond-l" contenteditable="false">" 1번째error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae. "</p>
			          <h5 class="font-cond mgb-5 fg-text-d fs-130" contenteditable="false">Martha Stewart</h5>
			          <small class="font-cond case-u lts-sm fs-80 fg-text-l" contenteditable="false">Business Woman - New York</small>
        		</div>
        		<div class="col-3 float-left">
			          <img src="https://bootdey.com/img/Content/avatar/avatar1.png" class="wpx-100 img-round mgb-20" title="" alt="" data-edit="false" data-editor="field" data-field="src[Image Path]; title[Image Title]; alt[Image Alternate Text]">
			          <p class="fs-110 font-cond-l" contenteditable="false">" 1번째error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae. "</p>
			          <h5 class="font-cond mgb-5 fg-text-d fs-130" contenteditable="false">Martha Stewart</h5>
			          <small class="font-cond case-u lts-sm fs-80 fg-text-l" contenteditable="false">Business Woman - New York</small>
        		</div>
            </div>
            <div class="carousel-item row no-gutters">
                <div class="col-3 float-left">안녕</div>
                <div class="col-3 float-left">
			          <img src="https://bootdey.com/img/Content/avatar/avatar1.png" class="wpx-100 img-round mgb-20" title="" alt="" data-edit="false" data-editor="field" data-field="src[Image Path]; title[Image Title]; alt[Image Alternate Text]">
			          <p class="fs-110 font-cond-l" contenteditable="false">" 1번째error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae. "</p>
			          <h5 class="font-cond mgb-5 fg-text-d fs-130" contenteditable="false">Martha Stewart</h5>
			          <small class="font-cond case-u lts-sm fs-80 fg-text-l" contenteditable="false">Business Woman - New York</small>
        		</div>
                <div class="col-3 float-left">
			          <img src="https://bootdey.com/img/Content/avatar/avatar1.png" class="wpx-100 img-round mgb-20" title="" alt="" data-edit="false" data-editor="field" data-field="src[Image Path]; title[Image Title]; alt[Image Alternate Text]">
			          <p class="fs-110 font-cond-l" contenteditable="false">" 1번째error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae. "</p>
			          <h5 class="font-cond mgb-5 fg-text-d fs-130" contenteditable="false">Martha Stewart</h5>
			          <small class="font-cond case-u lts-sm fs-80 fg-text-l" contenteditable="false">Business Woman - New York</small>
        		</div>
                <div class="col-3 float-left">
			          <img src="https://bootdey.com/img/Content/avatar/avatar1.png" class="wpx-100 img-round mgb-20" title="" alt="" data-edit="false" data-editor="field" data-field="src[Image Path]; title[Image Title]; alt[Image Alternate Text]">
			          <p class="fs-110 font-cond-l" contenteditable="false">" 1번째error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae. "</p>
			          <h5 class="font-cond mgb-5 fg-text-d fs-130" contenteditable="false">Martha Stewart</h5>
			          <small class="font-cond case-u lts-sm fs-80 fg-text-l" contenteditable="false">Business Woman - New York</small>
        		</div>
            </div>
        </div>
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
  
</body>
</html>