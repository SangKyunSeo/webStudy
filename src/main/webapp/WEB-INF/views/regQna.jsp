<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<html>
<head>
	<title>문의하기</title>
</head>


<body>
<h1>
	판매자에게 문의하기
</h1>
	<section id="container">
		<form name="registQnaForm" action="/regQna" method="POST">
			<input type="hidden" id="memberId" name="memberId" value="${user.memberId}">
			<input type="hidden" id="idItem" name="idItem" value="1">
			<input type="hidden" id="dateItemInquiry" name="dateItemInquiry" value="${date}">
			<div class="form-group has-feedback">
				<table summary="판매자 문의 하기 입력폼">
					<colgroup>
						<col>
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">상품명</th>
							<td> 상품명 </td>
						</tr>
						<tr>
							<th scope="row">카테고리</th>
							<td>
								<select name="categoryItemInquiry" id="categoryItemInquiry">
									<option value="">카테고리</option>
									<option value="상품상세문의">상품상세문의</option>
									<option value="배송문의">베송문의</option>
									<option value="사이즈">사이즈</option>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">제목</th>
							<td>
								<label class="control-label" for="titleItemInquiry">
									<input class="form-control" type="text" id="titleItemInquiry" name="titleItemInquiry" placeholder="40자 이하로 입력해주세요."/>
								</label>
							</td>
						</tr>
						<tr>
							<th scope="row">내용</th>
							<td>
								<label class="control-label" for="contentItemInquiry">
									<input class="form-control" type="text" id="contentItemInquiry" name="contentItemInquiry" placeholder="500자 이하로 입력해주세요."/>
								</label>
							</td>
						</tr>
					</tbody>
				</table>
				
				<div class="secretQuestion">
					<label>
						<input type="checkbox" class="iCheckbox" id="secretItemInquiry" name="secretItemInquiry">
							<span>비밀글로 문의하기</span>
					</label>
				</div>
				
				<input type="button" value="등록" id="complete" name="complete"/>
				<input type="button" value="취소" id="cancel" name="cancel"/>
			</div>
		</form>
	</section>
	
	<script>
		$(function(){
			$("#complete").click(function(){
				if($("#secretItemInquiry").is(":checked")){
					opener.registQnaForm.secretItemInquiry.value = 1;
				}else{
					opener.registQnaForm.secretItemInquiry.value = 0;
					
				}
				opener.registQnaForm.idItem.value = document.getElementById("idItem").value;
				opener.registQnaForm.memberId.value = document.getElementById("memberId").value;
				opener.registQnaForm.answerItemInquiry.value = 0;
				opener.registQnaForm.categoryItemInquiry.value = document.getElementById("categoryItemInquiry").value;
				opener.registQnaForm.contentItemInquiry.value = document.getElementById("contentItemInquiry").value;
				opener.registQnaForm.titleItemInquiry.value = document.getElementById("titleItemInquiry").value;
				opener.registQnaForm.dateItemInquiry.value = document.getElementById("dateItemInquiry").value;
	
				opener.location.href="/regQna"
				opener.document.registQnaForm.submit();
				window.close();
			});
			
			$("#cancel").click(function(){
				window.close();
			});
		});
	</script>

</body>
</html>
