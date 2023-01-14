<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>상세 페이지</title>
        
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${path}/resources/css/bsdetail.css" rel="stylesheet"/>
    </head>
    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="/">쇼핑몰 이름</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">홈</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">카테고리</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">모든 제품</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">여성 의류</a></li>
                                <li><a class="dropdown-item" href="#!">남성 의류</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <button class="btn btn-outline-dark" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                        </button>
                    </form>
                </div>
            </div>
        </nav>
        <!-- Product section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="../resources${item.imageItem}" alt="..." /></div>
                    <div class="col-md-6">
                        <div class="small mb-1">상품번호: ${item.idItem}</div>
                        <h1 class="display-5 fw-bolder">${item.nameItem}</h1>
                        <div class="fs-5 mb-5">
                            <span>가격: ${priceItem}</span>
                        </div>
                        <p class="lead">상품 설명</p>
                        <div class="d-flex">
                        	<!-- 수량 입력 -->
                            <input class="form-control text-center me-3" id="amount" name="amount" type="number" style="max-width: 3rem" />
                            <form action="/orderParsing" id="buyForm" method="GET">
                            	<input type="hidden" name="amountItem" id="amountItem">
								<input type="hidden" name="idItem" id="idItem" value="${item.idItem}">
								<input class="btn btn-outline-dark flex-shrink-0" type="submit" value="주문">
							</form>
							<form action="/registCart" name="cartForm" method="GET">
								<input type="hidden" name="memberCart" id="memberCart" value="${user.memberId}">
								<input type="hidden" name="itemCart" id="itemCart" value="${item.idItem}">
								<input type="hidden" name="nameCart" id="nameCart" value="${item.nameItem}">
								<input type="hidden" name="amountCart" id="amountCart">
								<input type="hidden" name="priceCart" id="priceCart" value="${item.priceItem}">
								<input type="hidden" name="dateCart" id="dateCart" value="${date}">
								<input class="btn btn-outline-dark flex-shrink-0" type="button" name="cart" id="cart" value="장바구니">
							</form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <div class="container px-4 px-lg-4">
        	<div class="navbar navbar-expand-lg navbar-light bg-light">
        		상품정보
        	</div>
        </div> 
        <!-- 상품 이미지 -->
		<div class="container px-4 px-lg-4 align-items-center">
        	<div class="col-md-12">
        		<img class="prod-img mb-5 mb-md-0" src="../resources${item.imageItem}"  alt="..." height="600" />
        	</div>
        	<div class="col-md-12">
        		<img class="prod-img mb-5 mb-md-0" src="../resources${item.imageItem}"  alt="..." height="600" />
        	</div>
        	<div class="col-md-12">
        		<img class="prod-img mb-5 mb-md-0" src="../resources${item.imageItem}"  alt="..." height="600" />
        	</div>
        	<div class="col-md-12">
        		<img class="prod-img mb-5 mb-md-0" src="../resources${item.imageItem}"  alt="..." height="600" />
        	</div>
        	<div class="col-md-12">
        		<img class="prod-img mb-5 mb-md-0" src="../resources${item.imageItem}"  alt="..." height="600" />
        	</div>
        </div>
        
        <!-- 메뉴바 -->
        <div class="container px-4 px-lg-4">
	        <nav class="navbar navbar-expand-lg navbar-light bg-light" id="main-nav">
			  <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
			    <li class="nav-item">
			    	<a href="#itemReview" class="nav-link"><div>상품평</div> </a>
			    </li>
			    <li class="nav-item">
			    	<a href="#" class="nav-link"><div>상품문의</div> </a>
			    </li>
			    <li class="nav-item">
			    	<a href="#" class="nav-link"><div>배송/교환/반품</div> </a>
			    </li>
			  </ul>
			</nav>
		</div>
		<br><br>
		<!-- 상품평 -->
		<div class="container px-4 px-lg-5" id="itemReview">
			<h2>상품평</h2>
			<hr>
			<h5><strong>${reviewSize}</strong>건의 후기가 있습니다.</h5>
			<br>
			<span style="padding:50px"><em style="font-size:25px">${avgReview}</em></span>
			<br>
			<span class="star">
				<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
			</span>
			<span class="real-star" style="width:${avgReview*30}px">
				<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
			</span>
			<br><br><br><br>
			<div class="review_photo">
				<h5>사진<em>0</em></h5>
				<div class="photh_list">
					<ul>
						<li>사진들</li>
					</ul>
				</div>
			</div>
			<div class="review_wrap">
				<div class="title_area" id="title-area">
					<h5>전체후기</h5>
					<div>베스트/최신순</div>
					<div>필터</div>
				</div>
				<hr>
				<form id="myform" method="GET" action="/regReview" target="registReviewForm">
					<div class="review-write">
						<input type="hidden" id="parentIdItem" name="parentIdItem" value="${item.idItem}">
						<button type="button" name="reviewWrite" id="reviewWrite">글쓰기</button>
					</div>
				</form>
				
				<form name="registReviewForm" action="/regReview" method="POST">
					<div class="form-group has-feedback">
						<input type="hidden" id="memberId" name="memberId">
						<input type="hidden" id="idItem" name="idItem" value="${item.idItem}">
						<input type="hidden" id="contentReview" name="contentReview">
						<input type="hidden" id="scoreReview" name="scoreReview">
						<input type="hidden" id="dateReview" name="dateReview">
					</div>
				</form>
				
				<div class="row d-flex justify-content-center">
					<div class="list-data">
						<ul class="list-style-none">
							<c:forEach items="${pagingList}"  var="list" varStatus="status" >
	                                <li class="d-flex flex-column no-block card-body border-bottom">
	                                    <div>
	                                        <span style="font-size:30px">${list.scoreReview}</span><br>
	                                        <span class="text-muted" style="font-size:8px">상품: ${list.idItem}</span>
	                                        <span class="text-muted font-16" style="float:right;font-size:14px" >${list.memberId}|${list.dateReview}</span>
	                                    </div>
	                                    <div>
	                                    	${list.contentReview}
	                                    </div>
	                                </li>   
	                    	</c:forEach>
	                    </ul>
	            	</div>
                </div>
                
                <div style="display: block; text-align: center;" class="page-data">		
					<c:if test="${paging.startPage != 1 }">
						<a href="javacript:void(0)"onclick="fn_goPage(${paging.startPage-1});">&lt;</a>
					</c:if>
					<c:forEach begin="${paging.startPage}" end="${paging.endPage }" var="p">
						<c:choose>
							<c:when test="${p == paging.nowPage }">
								<b>${p}</b>
							</c:when>
							<c:when test="${p != paging.nowPage }">
								<a href="javascript:void(0)" onclick="fn_goPage(${p});">${p}</a>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${paging.endPage != paging.totalPage}">
						<a href="javacript:void(0)" onclick="fn_goPage(${paging.endPage+1})">&gt;</a>
					</c:if>
				</div>
			</div>
		</div>
		
		<!-- 상품 문의 -->
		<div class="container px-4 px-lg-5" id="itemqna">
			<h2>상품문의  <em>${inquirySize}</em></h2>
			<hr>
			<form id="myform" method="GET" action="/regQna" target="itemQnaForm">
				<input type="hidden" id="idItem" name="idItem" value="${item.idItem}">
				<button type="button" name="qnaWrite" id="qnaWrite">문의하기</button>
			</form>
			
			<form name="registQnaForm" action="/regQna" method="POST">
					<div class="form-group has-feedback">
						<input type="hidden" id="memberId" name="memberId">
						<input type="hidden" id="idItem" name="idItem" value="${item.idItem}">
						<input type="hidden" id="answerItemInquiry" name="answerItemInquiry">
						<input type="hidden" id="categoryItemInquiry" name="categoryItemInquiry">
						<input type="hidden" id="contentItemInquiry" name="contentItemInquiry">
						<input type="hidden" id="titleItemInquiry" name="titleItemInquiry">
						<input type="hidden" id="dateItemInquiry" name="dateItemInquiry">
						<input type="hidden" id="secretItemInquiry" name="secretItemInquiry">
					</div>
				</form>
				
				
				
				<div class="review_list">
					<c:forEach items="${inquiryList}"  var="list" varStatus="status" >
						<ul>
							<li class="detail">
								<div class="itemName">
									작성자 : ${list.memberId}
								</div>
								<div class="madeName">
									상품 : ${list.idItem}
								</div>
								<div class="price">
									카테코리 : ${list.categoryItemInquiry}
								</div>
								<div class="stock">
									제목 : ${list.titleItemInquiry}
								</div>
								<div class="stock">
									작성일 : ${list.dateItemInquiry}
								</div>
							</li>
						</ul>
					</c:forEach>
				</div>
		</div>
		
		
		
		
		
		
        <!-- Related items section-->
        <section class="py-5 bg-light">
            <div class="container px-4 px-lg-5 mt-5">
                <h2 class="fw-bolder mb-4">Related products</h2>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Fancy Product</h5>
                                    <!-- Product price-->
                                    $40.00 - $80.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Special Item</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">$20.00</span>
                                    $18.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Sale Item</h5>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">$50.00</span>
                                    $25.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Popular Item</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    $40.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <script src="https://kit.fontawesome.com/9fc17accaa.js" crossorigin="anonymous"></script>
        <script>
        	function fn_goPage(page){
    			var query = {nowPage : page, idItem : ${item.idItem} };
    			
    			$.ajax({
    				url:"/reviewList",
    				type : "POST",
    				data : query,
    				success: function(data){
    					var list = new Array;
    					list = data.paginglist;
    					var paging = data.paging;
    					var code = '';
    					var pageCode = '';
    					
    					$.each(list,function(key,value){
    						code+='<li class="d-flex flex-column no-block card-body border-bottom">';
                            code+='<div>';
                            code+='<span style="font-size:30px">'+value.scoreReview+'</span><br>';
                            code+='<span class="text-muted" style="font-size:8px">상품:' + value.idItem + '</span>';
                            code+='<span class="text-muted font-16" style="float:right;font-size:14px" >'+value.memberId+'|'+value.dateReview+'</span>';
                            code+='</div>'
                            code+='<div>'
                           	code+=value.contentReview;
                            code+='</div>';
                        	code+='</li>';   
    					});
    					$(".list-data").html(code);
    					
    					if(paging.startPage != 1){
    						var prev = paging.startPage - 1;
    						pageCode += '<a href="javacript:void(0)" onclick=" fn_goPage('+ prev + ')">&lt;</a>';
    					}
    					
    					for(var num=paging.startPage;num<=paging.endPage;num++){
    						if(num==paging.nowPage){
    							pageCode += '<b>' + num + '</b>';
    						}else{
    							pageCode += '<a href="javascript:void(0)" onclick="fn_goPage(' + num + ');">'+ num +'</a>'
    						}
    					}
    					
    					if(paging.endPage != paging.totalPage){
    						var next = paging.endPage + 1;
    						pageCode += '<a href="javascript:void(0)" onclick="fn_goPage(' + next + ');">&gt;</a>';
    					}
    					
    					$(".page-data").html(pageCode);
    				}
    				
    			});
    			document.getElementById('title-area').scrollIntoView();
        	}
        	$(function(){
        		
        		$("#reviewWrite").click(function(){
        			window.name = "myform";
        			openWin = window.open("/regReview","childForm","width=600,height=400,resizable=no,scrollbars=no")
        		
        		});
        		
        		$("#qnaWrite").click(function(){
        			window.name = "parentForm";
        			openWin = window.open("/regQna","itemQnaForm","width=600,height=400,resizable=no,scrollbars=no")
      
        		});
        		$("#amount").change(function(){
        			var amount = $("#amount").val();
        			$("#amountItem").val(amount);
        			$("#amountCart").val(amount);
        			
        		})
        		$("#cart").click(function(){
        			if(window.confirm("상품이 장바구니에 담겼습니다.\n 바로 확인하시겠습니까?")){
        				document.cartForm.action = "/registCart";
            			document.cartForm.submit();
        			}else{
        				location.href("/itemdetail/${item.idItem}");
        			}
        			
        		});
        		
        		
        	
        	});
        </script>
    </body>
</html>


