<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include  page="/WEB-INF/views/food/food-insert-head.jsp"></jsp:include>
</head>
<body style="background-color:#535353;">


<div class="signup-form" >
    <form method="POST" name="foodForm" action="/food-updater" enctype="multipart/form-data">
		<h2>메뉴수정</h2>
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
        <input type="hidden" name="foodNum">
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
            <input type="file" class="form-control" name="foodFile" >
        </div>     

		<div class="form-group">
            <button type="button" onclick="foodUpdate()"  class="btn btn-primary btn-lg">등록</button>
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

window.onload = function(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/food-update?foodNum='+ ${param.foodNum});
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4&&xhr.status==200){
			var res = JSON.parse(xhr.responseText);
			for(var key in res){
				var input = document.querySelector('[name='+key+']');
				if(res[key]!=null&&input!=null){
					input.value = res[key];
				}
			}
		}
	}
	xhr.send();
}



function foodUpdate() {
	
	var xhr = new XMLHttpRequest();
	xhr.open('POST', '/food-update');
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) { 
			var res = JSON.parse(xhr.responseText);
			console.log(res);
			self.close();

			
			}
		}
	var formData = new FormData();
	var foodNum = document.querySelector('[name=foodNum]');
	var foodType = document.querySelector('[name=foodType]');
	var foodName = document.querySelector('[name=foodName]');
	var foodDesc = document.querySelector('[name=foodDesc]');
	var foodPrice = document.querySelector('[name=foodPrice]');
	var foodCookTime = document.querySelector('[name=foodCookTime]');
	var foodFile = document.querySelector('[name=foodFile]');
	formData.append('foodNum',foodNum.value);
	formData.append('foodType',foodType.value);
	formData.append('foodName',foodName.value);
	formData.append('foodDesc',foodDesc.value);
	formData.append('foodPrice',foodPrice.value);
	formData.append('foodCookTime',foodCookTime.value);
	formData.append('foodFile',foodFile.files[0]);
	
	xhr.send(formData);
}
</script>
</html>