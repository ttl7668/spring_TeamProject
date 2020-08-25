<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
        <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/all.css">
    <style>
        input{width: 100%;}
        textarea{width: 100%;}
        .input-box{margin-bottom: 20px;}
        .summary-box-space{margin-bottom: 20px;}
        form {
        border-radius: 0px;
        padding: 15px;
        box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.15);
        width: 50%;
       margin: 0 auto;
       margin-top: 100px;
        }
    </style>
</head>
<body>

<%@include file="../include/creatorHeader.jsp" %>
    <section>
        <div class="form-box">
         <form action="EnrollBoardRegist" enctype="multipart/form-data" method="POST" id="creatorRegForm">
				
                <div class="input-box">
                    제목:<br>
                    <input type="text" placeholder="제목을 적어주세요" name="title">
                </div>
                <input type="text" name="pno" value="${pno }">
                
                <div class="summary-box-space">
                    <div class="lecture-summary">
                        <div class="lecture-summary-img">
                        </div>
                        내용:<br>
                        <textarea cols="30" rows="7" name="contentText" id="contentText0"></textarea>
                    </div>
                    <input type="file"  name="contentImg" id="contentImg0">
                    <input type="hidden" name="content" id=content>
                </div>
                    <div class="add-write-button">
                        <button id="summatyAddBtn" type="button">추가하기</button>
                    </div>
        
                <div class="form-btn-box">
                	<button type="submit" id="formSubmitBtn" class="point-btn">작성하기</button>
                    <!-- <button type="button" id="formSubmitBtn" class="point-btn">작성하기</button>TODO: 수정하세요 -->
                    <button type="button" class="point-btn">목록으로</button>
                </div>
            </form>
        </div>
    
    </section>
    
    <script>
    $(document).ready(function(){
      
       let contentBoxNum = 1;
       
       $("#formSubmitBtn").click(function(){
          let jsonContent = new Array();
          
         for(let i = 0; i < contentBoxNum; i++){
            let contentImg = "#contentImg" + i;
            let contentText = "#contentText" + i;
            if($(contentImg)[0].files[0] == '' || $(contentText).val() == ''){
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
    </script>
</body>
</html>