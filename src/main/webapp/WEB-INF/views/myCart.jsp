<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="utf-8" />

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
		<h2>장바구니</h2>
		<form action="/successOrder" name="orderForm" id="orderForm" method="POST">
			<table class="orderInfo">
            	<thead>
                	<th>선택</th>
                    <th>이미지</th>
                    <th>상품명</th>
                    <th>수량</th>
                    <th>상품금액</th>
                    <th>배송비</th>
                    <th>삭제</th>
                </thead>
                <c:forEach items="${myCartList}"  var="list" varStatus="status" >
                <input type="hidden" id="index" name="index" value="${status.index}">
             		<tr>
             			<td class="selectItemInfo">
                        <div class="selectItemDiv">
                			<label>
                				<input type="hidden" class="individualPriceCart" value="${list.priceCart}">
                				<input type="checkbox" class="selectItemCheckbox" id="selectItem" name="selectItem">
                			</label>
                		</div>
                      	</td>
             			<td>${list.amountCart}</td>
             			<td>${list.nameCart}</td>
             			<td>${list.amountCart}</td>
                      	<td>${list.priceCart}</td>
                      	<td>0</td>
             			<td>
             				<div class="btn">
             					<form action="/deleteCart" method="GET">
             						<input type="hidden" name="memberCart" id="memberCart"value="${list.memberCart}">
             						<input type="hidden" name="itemCart" id="itemCart" value="${list.itemCart}">
             						<input type="submit" value="삭제">
             					</form>
             				</div>
             			</td>
             		</tr>
             	</c:forEach>
                </table>
	<h2>총 주문 금액</h2>
		<table>
        	<tr>
        		<td>
        		<span>(상품금액)</span><span id="priceItem"></span>
        		<span>+ (배송비)</span><span id="shippingFee"></span>
        		<span> = </span><span id="totalPrice"></span>
        		</td>
            </tr>
        </table>
		<div class="centered">
			<input type="submit" name="buy" id="buy" value="결제">
			<input type="button" name="cancel" id="cancel" value="취소">
		</div>
		</form>
	</div>
</body>
<script>
$(function(){
	
	$("#cancel").click(function(){
		location.href="/itemdetail/${detailList.idItem}";
	});
	
	$(".selectItemCheckbox").on("change",function(){
		var price = 0;
		
		$(".selectItemInfo").each(function(index,element){
			if($(element).find(".selectItemCheckbox").is(":checked")){
				price+=parseInt($(element).find(".individualPriceCart").val());
			}
		});
		$("#priceItem").html(price);
	});


});
</script>

</html>
