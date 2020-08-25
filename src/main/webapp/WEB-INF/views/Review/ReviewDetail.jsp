<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/all.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/star.css">

<%-- <link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/star.css"> --%>

</head>
<body>
	<%@include file="../include/header.jsp"%>

	<section style="width:1000px; margin-top:100px;">
		<div class="board-title">
			<h2>리뷰 자세히 보기</h2>
			<hr>
		</div>
		<!-- <hr> -->
		<form action="ReviewModify" method="post">
			<div class="board-content">
				<div>
					<label>제목</label> <input class="form-control"
						value="${reviewVO.title }" readonly> <label>날짜</label>
					<p>
						<fmt:formatDate value="${reviewVO.regdate }" pattern="yyyy-MM-dd" />
					</p>
				</div>
				<div class="form-group">
					<label>평점</label>
					<div class="stars" data-rating="${reviewVO.satisfaction }">
						<span class="star">&nbsp;</span> <span class="star">&nbsp;</span>
						<span class="star">&nbsp;</span> <span class="star">&nbsp;</span>
						<span class="star">&nbsp;</span>
					</div>

				</div>
				<div class="form-group">
					<label>번호</label> <input class="form-control" name='rno'
						value="${reviewVO.rno }" readonly>
				</div>
				<div class="form-group">
					<label>작성자</label> <input class="form-control" name='writer'
						value="${reviewVO.writer }" readonly>
				</div>

				<div class="form-group">
					<label>내용</label>
					<textarea class="form-control" rows="10" name='content' readonly>${reviewVO.content }</textarea>
				</div>
				<div class="form-group">
					<label>별점</label> <input class="form-control" name='satisfaction'
						value="${reviewVO.satisfaction }" readonly>
				</div>

			</div>
			<div class="board-detail-btns">
				<button type="button" class="point-btn" id="reviewModifyBtn">수정하기</button>
				<button type="button" href="ReviewBoard">목록으로</button>
			</div>
		</form>
	</section>
	<script>
  
	   
	   //별점 점수 
    $("document").ready(function(){
    let stars = "";
     
         let count = parseInt('${reviewVO.satisfaction }', 10);
       for(let i = 0; i < count; i ++){
            stars += '<span class="star rated">&nbsp;</span>';
      }          
       
       for(let i = 0; i < 5 - count ; i++){
            stars += '<span class="star">&nbsp;</span>';
       }
       $(".stars").html(stars); 
       $("#reviewModifyBtn").click(function(){
 	      const rno = '${reviewVO.rno}';
 	      console.log(rno)
 	      location.href="/project/Review/ReviewModify?rno="+rno;
 	        
 	   })
    })
    
    
   </script>
	   
   </script>
</body>
</html>