<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include  page="/WEB-INF/views/food/food-insert-head.jsp"></jsp:include>
</head>
<body style="background-color:#535353;">
<div class="signup-form" >
    <form method="POST" action="/views/food/food-result" enctype="multipart/form-data">
		<h2>메뉴등록</h2>
		
		<hr>
        <div class="form-group">
			<div class="row">
			<select name='foodType' class="form-control">
  				<option value='음식'>음식</option>
  				<option value='간식'>간식</option>
 				 <option value='음료수'>음료수</option>
			</select>
				
			</div>        	
        </div>
        <div class="form-group">
        	<input type="text" class="form-control" name="foodName"  placeholder="음식이름">
        </div>
		<div class="form-group">
            <input type="text" class="form-control" name="foodDesc"  placeholder="음식설명">
        </div>

        <div class="form-group">
            <input type="number" class="form-control" name="foodPrice" onkeypress="return digit_check(event)" placeholder="음식가격" >
        </div>   
        <div class="form-group">
            <input type="number" class="form-control" name="foodCookTime" onkeypress="return digit_check(event)" placeholder="소요시간">
        </div>      
       	<div class="form-group">
            <input type="file" class="form-control" name="foodFile">
        </div>     

		<div class="form-group">
            <button type="submit" class="btn btn-primary btn-lg">등록</button>
        </div>
    </form>
</div>
</body>
<script>
function digit_check(evt){
    var code = evt.which?evt.which:event.keyCode;
    if(code < 48 || code > 57){
        return false;
    }
}
</script>
</html>