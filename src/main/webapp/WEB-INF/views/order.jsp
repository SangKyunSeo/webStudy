<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title> 주문서 작성하기</title>
	<style>
        table {
          border: 1px #a39485 solid;
          font-size: .9em;
          box-shadow: 0 2px 5px rgba(0,0,0,.25);
          width: 100%;
          border-collapse: collapse;
          border-radius: 5px;
          overflow: hidden;
        }
        table.orderInfo thead{
        	background: #cfffe5;
        }
         table.orderInfo th{
        	color:#000000;
        }

        th {
          text-align: left;
        }

        thead {
          font-weight: bold;
          color: #fff;
          background: #73685d;
        }

         td, th {
          padding: 1em .5em;
          vertical-align: middle;
        }

         td {
          border-bottom: 1px solid rgba(0,0,0,.1);
          background: #fff;
        }

        a {
          color: #73685d;
        }
        
		.container {
			width:600px;
			margin:0 auto;
		}
		ul { /* 순서없는 목록에 적용할 스타일 */
			list-style-type: none; /* 불릿 없앰 */
		}

		label.title { /* class=title인 label에 적용할 스타일 */
			font-weight: bold; /* 굵은 글자 */
			width: 80px; /* 너비 80px */
			float: left; /* 왼쪽부터 배치 */
		}

		div.centered { /* class=centered인 div에 적용할 스타일 */
			text-align: center; /* 가운데 정렬 */
		}

		fieldset { /* 필드셋에 적용할 스타일*/
			margin: 15px 10px; /* 상하 마진 15xp, 좌우 마진 10px */
		}

			fieldset legend { /* 필드셋의 제목 */
				font-weight: bold; /* 굵은 글자 */
				font-size: 18px; /* 글자 크기 18px */
				color: purple; /* 글자색 자주 */
			}

		ul li { /* 목록의 각 항목 */
			margin-bottom: 10px; /* 아래 마진 10px */
		}
        @media all and (max-width: 768px) {
    
          table, thead, tbody, th, td, tr {
            display: block;
          }
          th {
            text-align: right;
          }

          table {
            position: relative; 
            padding-bottom: 0;
            border: none;
            box-shadow: 0 0 10px rgba(0,0,0,.2);
          }

          thead {
            float: left;
            white-space: nowrap;
          }

          tbody {
            overflow-x: auto;
            overflow-y: hidden;
            position: relative;
            white-space: nowrap;
          }

          tr {
            display: inline-block;
            vertical-align: top;
          }

          th {
            border-bottom: 1px solid #a39485;
          }

          td {
            border-bottom: 1px solid #e5e5e5;
          }
        }
	</style>	
</head>
<body>
	<div class="container">
		<h1>상품 주문서</h1>
		<form action="/successOrder" name="orderForm" id="orderForm" method="POST">
			<fieldset>
				<legend>주문 정보</legend>
				<table class="orderInfo">
                  <thead>
                    <th>상품명</th>
                    <th>수량</th> 
                    <th>상품금액</th>
                    <th>할인금액</th>
                    <th>소계금액</th>
                    <th>배송비</th>
                    <th>주문번호</th>
                   </thead>
                  <tr>
                    <td>${detailList.nameItem}</td>
                    <td>${amountItem}</td>
                    <td>${detailList.priceItem}</td>
                    <td>0</td>
                    <td>${detailList.priceItem}</td>
                    <td>0</td>
                    <td>${detailList.idItem}</td>
                  </tr>
                </table>
			</fieldset>
			<fieldset>
				<legend>구매자 정보</legend>
                  <table>
                    <tr>
                      <td>주문자</td>
                      <td>${buyer.memberName}</td>
                    </tr>
                    <tr>
                      <td>이메일</td>
                      <td>${buyer.memberId}</td>
                    </tr>
                    <tr>
                      <td>휴대폰 번호</td>
                      <td>${buyer.memberPhone}</td>
                    </tr>
                  </table>
			</fieldset>
			<fieldset>
				<legend>배송지 정보</legend>
				<table>
                    <tr>
                      <td>수령인</td>
                      <td><input type="text" name="recName" id="recName"></td>
                    </tr>
                    <tr>
                      <td>이메일</td>
                      <td><input type="text" name="recEmail" id="recEmail"></td>
                    </tr>
                    <tr>
                      <td>휴대폰 번호</td>
                      <td><input type="text" name="recPhone" id="recPhone"></td>
                    </tr>
                  </table>
			</fieldset>
			<div class="centered">
				<input type="submit" name="buy" id="buy" value="결제">
				<input type="button" name="cancel" id="cancel" value="취소">
			</div>
		</form>
	</div>
</body>
<script>
$(function(){
	var amountOrder = ${amountItem};
	$("#amountOrder").val(amountOrder); 
	IMP.init('imp01501022');
	$("#buy").click(function(){
		
		IMP.request_pay({
		    pg : "html5_inicis",
		    pay_method : "card",
		    merchant_uid: "11", // 상점에서 관리하는 주문 번호를 전달
		    name : "주문명:결제테스트",
		    amount : ${detailList.priceItem} / ${detailList.priceItem} + 100,
		    buyer_email : "${buyer.memberId}",
		    buyer_name : "${buyer.memberName}",
		    buyer_tel : "${buyer.memberPhone}",
		    buyer_addr : "${buyer.memberAddress}",
		    buyer_postcode : "16548"
		}, function(rsp) { // callback 로직
			if(rsp.success){
				var msg = "결제가 완료 되었습니다.";
				msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
				alert(msg);
				document.orderForm.action= "/successOrder";
				document.orderForm.submit();
			}else{
				var msg = "결제가 실패하였습니다.";
				msg += rsp.error_code + " 에러내용: " + rsp.error_msg;
				alert(msg);
				location.href="/itemdetail/${detailList.idItem}";
			}
		});
	
	});
	
	$("#cancel").click(function(){
		location.href="/itemdetail/${detailList.idItem}";
	})
	
});
</script>

</html>
