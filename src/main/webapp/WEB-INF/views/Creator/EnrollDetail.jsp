<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" type="text/css" href="../css/all.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
</head>
<body>

<%@include file="../include/creatorHeader.jsp" %>

	<section>
		<div class="board-title">
			<span class="board-title-span">${enrollBoardVO.title }</span>
		</div>
		<hr>
		<div class="board-content"></div>
		<div class="board-detail-btns">
			<button type="button" class="point-btn" id="modifyBtn">수정하기</button>
			<button type="button" id="deleteBtn">삭제하기</button>
			<button type="button" id="listBtn">목록으로</button>
		</div>
	</section>

	<script>
   		$(document).ready(function(){
   			let modifyBtn = $("#modifyBtn")
   			let deleteBtn = $("#deleteBtn")
   			let listBtn = $("#listBtn")
   			
   			modifyBtn.click(function(){
   				location.href='${pageContext.request.contextPath}'+'/Creator/EnrollBoardModify?eno=' + eno + '&pno' + '${enrollBoardVO.pno}';
   			})
   			
   			deleteBtn.click(function(){
   				if(confirm("게시물을 비공개처리 하시겠습니까?")){
   					
   				} else{
   					return;
   				}
   			})
   			
   			listBtn.click(function(){
   				location.href='${pageContext.request.contextPath}'+"/Creator/EnrollBoard?pno=" + '${enrollBoardVO.pno}';
   			})
   			
   			let contentStr = '${enrollBoardVO.content}';
			let contentJson = JSON.parse(contentStr);
			let eno = '${enrollBoardVO.eno}';
			console.log(eno)
			viewContentBox(contentJson, eno);
			
   		})
   		
   		function viewContentBox(list, eno){
   			for(let i = 0; i < list.length; i++){
   				let content = list[i];
   				console.log(content)
   				const imgBox = $('<div>').attr('class', 'img-box');
   				const img = $('<img>').attr('src', 'EnrollBoardImg?eno=' + eno + '&fileName=' + content.contentImg);
   				imgBox.append(img);
   				
   				const span = $('<span>').attr('class','board-content-span')
   										.html(content.contentText);
   				
   				$('.board-content').append(imgBox);
   				$('.board-content').append(span);
   			}
   				
   			}
   	</script>
</body>
</html>