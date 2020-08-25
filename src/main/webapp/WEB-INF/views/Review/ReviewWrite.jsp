<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
      
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/all.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/star.css">
</head>
<body>
   <section style="width:1000px; margin: 0;">
   <%@include file="../include/header.jsp"%>
   
      <div class="form-box">
         <form action="ReviewRegist" method="POST" name="regForm" style="margin-top:70px;">
         
                     
               <h1>후기 작성하기</h1><hr>
            <div class="input-box">
            <input type="hidden" name="pno" value="${pno}">
            <input type="hidden" name="pno" value="${sessionScope.userVO.uno }">
               제목:<input type="text" placeholder="제목을 입력하세요" name="title"><br>
               작성자:<input type="text" value="${sessionScope.userVO.name }" disabled="disabled">
             <input type="hidden" name="writer" value="${sessionScope.userVO.name }">
            </div>
            별점:
            <div class="star-box">
               <!--별 넣어주세욧-->
               <!-- alternate codepen version https://codepen.io/mad-d/pen/aJMPWr?editors=0010 -->
               <div class="stars" data-rating="3">
                  <span class="star">&nbsp;</span> <span class="star">&nbsp;</span>
                  <span class="star">&nbsp;</span> <span class="star">&nbsp;</span>
                  <span class="star">&nbsp;</span>
               </div>
                  <input type="hidden" name="satisfaction" >
            </div>
            
            <div class="textarea-box">
               내용:<textarea name="content" placeholder="내용을 작성해주세요"></textarea>
            </div>

            <div class="form-btn-box">
               <button type="submit" class="point-btn" >작성하기</button>
               <button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/Review/ReviewBoard?pno=${pno}'">목록으로</button>
            </div>
         </form>
      </div>

   </section>
   <script src="${pageContext.request.contextPath}/js/stars.js"></script>
</body>
</html>