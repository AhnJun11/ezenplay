<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
				

          <div class="col-lg-6">
            <form action="forms/contact.php" method="post" role="form" class="php-email-form">
            <div class="probox" style="background: #BDBDBD;"> <!-- 사진미등록자는 기본프로필화면으로보이게 -->
						<img class="profileone" src="/resources/images/user/${UserInfo.profilePath}" onerror="this.src='/resources/images/user/basic.png';"alt='' /> 
					</div><br><br>
              <div class="form-row">
                <div class="col form-group">
                <input hidden="text" name="userNum" value="${UserInfo.userNum}" id="userNum">
                  <input type="text" name="name" class="form-control" id="name" placeholder="Your Name"  value="${UserInfo.userId}" readonly />
                  <div class="validate"></div>
                </div>
                <div class="col form-group">
                  <input type="email" class="form-control" name="email" id="email" placeholder="Your Email"  value="${UserInfo.userEmail}" readonly />
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
              
              <c:if test="${UserInfo eq null }">
              로그인후 이용해주세요.
              </c:if>
              <c:if test="${UserInfo ne null }">
              <div class="text-center"><button onclick="upload()" type="submit">등록</button></div>
              </c:if>
            </form>
            </div>
			
				
				<br/><br/><br/><br/><br/>
		
			
			
			
			