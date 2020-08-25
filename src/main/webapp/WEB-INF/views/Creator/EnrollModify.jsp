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
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<link rel="stylesheet" type="text/css" href="../css/all.css">
</head>
<body>

	<%@include file="../include/creatorHeader.jsp"%>
	<section>
		<div class="form-box">
			<form action="CreatorBoardModifyUpdate" method="POST"
				name="creatorRegForm" style="margin: 300px;">
				<div class="input-box">
					<input type="hidden" name="eno" value="${enrollBoardVO.eno }">
					<input type="hidden" name="pno" value="${enrollBoardVO.pno }">
					<input type="text" name="title" value="${enrollBoardVO.title }">
				</div>
				<div class="summary-box-space"></div>
				<div class="form-btn-box">
					<button type="button" id="formSubmitBtn" class="point-btn">작성하기</button>
					<button type="button" class="btn">목록으로</button>
				</div>
			</form>
		</div>

	</section>

	<script>
    $(document).ready(function(){
    	let contentBoxNum = 0;
    	let contentStr = '${enrollBoardVO.content}';
		let contentJson = JSON.parse(contentStr);
		let eno = '${enrollBoardVO.eno}';
		viewModifyContentBox(contentJson, eno, contentBoxNum);
		
    	
    	// $(".lecture-cover-img").click(function(){
    	//     $(".lecture-cover-img-input").click();
    	// })


    	//소개버튼 추가
    	$("#summatyAddBtn").click(function(){
    		if($('.summary-box-space').children().length > 6){
    			alert('소개글은 6개까지만 추가 가능합니다');
    			return;
    		}
    		const summaryBox = createSummary(contentBoxNum);
    		summaryBox.insertBefore($(event.target).parent());
    		if($('.summary-box-space').children().length > 7){
    			$(event.target).remove('.add-write-button');

    		}
    		contentBoxNum++;
    		// $('.summary-box-space').append(summaryBox)
    	})
    	
    	  $("#formSubmitBtn").click(function(){
		let jsonContent = new Array();
		
		for(let i = 0; i < contentBoxNum; i++){
			let contentInput = "#contentInput" + i;
			let contentImg = "#contentImg" + i;
			let contentText = "#contentText" + i;
			if($(contentInput) == '' || $(contentText).val() == ''){
				alert('파일과 텍스트를 한 세트로 올려주세요.')
			}
			let contentBox =  new Object();
			contentBox.contentImg = $(contentImg)[0].files[0].name;
			contentBox.contentText = $(contentText).val();
			jsonContent.push(contentBox);
		}
		let contentStr = JSON.stringify(jsonContent);
		$('#content').val(contentStr);
		
		$('#creatorRegForm').submit();
	})

    })

    function createSummary(num){
    	const summaryBox = $('<div>').attr('class', 'lecture-summary');
    	const imgArea = $("<div>").attr('class', 'lecture-summary-img');
    	const textArea = $('<textarea>').attr({'cols':'30', 'rows':'7', 'name': 'contentText', 'id' : 'contentText' + num});

    	
    	
    	summaryBox.append(imgArea)
    	.append($('<input>').attr({'type': 'file',  'name': 'contentImg', 'id':'contentImg' + num}))
    	.append(textArea);
    	return summaryBox;
    }
    

		function imgDivClickEvent(target){
			console.log('이벤트부여', $(event.target).parent())
			let idNum = $(event.target).parent().attr('id');
			const inputFileId = '#contentImg'+idNum;
			const inputTextId = '#contentInput' + idNum;
			
			console.log($(inputFileId), $(inputTextId))
		}
    
    function viewModifyContentBox(list, eno, contentBoxNum){
    		const summarySpace = $('.summary-box-space');
    	
			for(let i = 0; i < list.length; i++){
				let content = list[i];
				console.log(content)
				const imgBox = $('<div>').attr({'class': 'lecture-summary-img', 'id' : contentBoxNum}).on('click',imgDivClickEvent);
				const img = $('<img>').attr('src', 'EnrollBoardImg?eno=' + eno + '&fileName=' + content.contentImg);
				imgBox.append(img);
				const inputFile = $('<input>').attr({'type':'file', 'id':'contentImg'+contentBoxNum})
				const inputText = $('<input>').attr({'type':'text', 'id':'contentInput'+contentBoxNum, 'value':content.contentImg})
				const textArea = $('<textarea>').attr({'cols':'30','rows':'7', 'name':'contentText', 'id':'contentText'+contentBoxNum})
												.val(content.contentText);
				
				const boardContent = $('<div>').attr('class', 'lecture-summary');
				boardContent.append(imgBox);
				boardContent.append(inputFile);
				boardContent.append(inputText);
				boardContent.append(textArea);
				
				contentBoxNum ++;
				
				summarySpace.append(boardContent);
			}
			
         	const addBtn = $('<button>').attr({'id':'summatyAddBtn', 'type':'button'}).html('추가하기');
         	const btnDiv = $('<div>').attr('class','add-write-button');
         	btnDiv.append(addBtn);
         	summarySpace.append(btnDiv);
         	
			}
    
  
    
    </script>
</body>
</html>