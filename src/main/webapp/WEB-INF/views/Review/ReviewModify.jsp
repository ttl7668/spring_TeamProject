<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

	<%@include file="../include/header.jsp"%>
   <section style="margin: 300px;">
      <div class="board-title">
         <span class="board-title-span">제목제목</span>
      </div>

      <form name="regForm" method="post">
         <div>
            <label>DATE</label>
            <p>
               <fmt:formatDate value="${reviewVO.regdate }" pattern="yyyy-MM-dd" />
            </p>
         </div>
         <div class="form-group">
            <label>번호</label> <input class="form-control"
               value="${reviewVO.rno }" disabled="disabled">
               <input type="hidden" value="${reviewVO.rno }">
         </div>
         <div class="form-group">
            <label>작성자</label> <input class="form-control" name='writer'
               value="${reviewVO.writer }" disabled="disabled">
         </div>
         <div class="form-group">
            <label>별점</label>
               <div class="stars" data-rating="${reviewVO.satisfaction }" >
               <span class="star">&nbsp;</span> 
               <span class="star">&nbsp;</span> 
               <span class="star">&nbsp;</span> 
               <span class="star">&nbsp;</span>
               <span class="star">&nbsp;</span>
            </div>
             <%-- <input class="form-control"  name="satisfaction" type="hidden" value="${reviewVO.satisfaction }"> --%>
             <input class="form-control"  type="hidden" value="${reviewVO.satisfaction }">
             <input type="hidden" name="satisfaction" >
             <%-- <input class="form-control" name='satisfaction' value="${reviewVO.satisfaction }"> --%>
             <!-- type="hidden" -->
         </div>

         <div class="form-group">
            <div>내용</div>
            <textarea class="form-control" rows="10" name='content'>${reviewVO.content }</textarea>
         </div>


         <div class="board-detail-btns">
            <button type="button" id="updateBtn">수정하기</button>
            <button type="button" id="deleteBtn">삭제하기</button>
            <button type="button" onclick="location.href='ReviewBoard?pno=${reviewVO.pno}' ">목록으로</button>
         </div>

      </form>
   </section>

   <script>
      //수정버튼
      var updateBtn = document.getElementById("updateBtn");
      updateBtn.onclick = function(){

          if(document.regForm.writer.value === '') {
             alert("작성자는 필수 사항 입니다");
             document.regForm.writer.focus();
             return;
          } else if(document.regForm.title.value === '') {
             alert("제목은 필수 사항 입니다");
             document.regForm.title.focus();
             return;
          } else if(document.regForm.content.value === '') {
             alert("내용은 필수 사항 입니다");
             document.regForm.content.focus();
             return;
          } else if (document.regForm.satisfaction.value === ''){
             alert("후기 평점은 필수 사항입니다.")
             document.regForm.satisfaction.focus();
          } else {
             //폼의 action값을 변경
             document.regForm.action = "ReviewUpdate";
             document.regForm.submit();
          }
          
      }
      
       /*  $("document").ready(function(){
          $(".stars").attr("data-rating", "${reviewVO.satisfaction }");
       })  */
      
       
      //삭제버튼
        var deleteBtn = document.getElementById("deleteBtn");
        deleteBtn.onclick = function() {
     
           document.ReviewModify.action = "ReviewDelete";
           document.ReviewModify.submit();
        }
        
   </script>
   <script src="${pageContext.request.contextPath}/js/stars.js"></script>
</body>
</html>