<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shoppingmall</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <c:set var="path" value="${pageContext.request.contextPath}"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${path}/resources/css/bs1.css" rel="stylesheet"/>
        <link href="${path}/resources/css/test.css" rel="stylesheet"/> 	
    </head>
    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="/">쇼핑몰 이름</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="/">홈</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">카테고리</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="category?category=all">모든 제품<input type="hidden" id="category" name="category" value="all"></a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="category?category=woman">여성 의류<input type="hidden" id="category" name="category" value="woman"></a></li>
                                <li><a class="dropdown-item" href="category?category=man">남성 의류<input type="hidden" id="category" name="category" value="man"></a></li>
                            </ul>
                        </li>
                    </ul>
                    <div class="inline_view searchParent" id="search">
						<form action="/test" method="GET" id="searchForm" name="searchForm">
							<input type="text" class="search" id="nameItem" name="nameItem" placeholder="검색어를 입력하세요">
							<input type="submit" class="searchIcon" value="" id="searchButton">
						</form>
					</div>
					<div class ="login_class" id="login">
						<form class="d-flex" action="/login" method="POST">
	                        <button class="btn btn-outline-dark" type="submit">
	                            로그인
	                        </button>
	                    </form>
	                   
                    </div>
                    <div class ="login_class" id="logout">
	                    <form class="d-flex" action="/logout" method="POST">
	                        <button class="btn btn-outline-dark" type="submit">
	                            로그아웃
	                        </button>
	                    </form>
	                </div>
	                <div class ="login_class" id="myinfo">
		                <form action="/updateInfo" method="POST">
							<button class="btn btn-outline-dark" type="submit">
							내 정보
							</button>
						</form>
					</div>
                    <form class="d-flex" >
                        <button class="btn btn-outline-dark" id="cartButton" name="cartButton" type="button">
                            <i class="bi-cart-fill me-1"></i>
                            장바구니
                            <span class="badge bg-dark text-white ms-1 rounded-pill">${cartCount}</span>
                        </button>
                    </form>
                </div>
            </div>
        </nav>
        <!-- Header-->
        <header class="bg-mint py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-black">
                    <h1 class="display-4 fw-bolder">Shop in style</h1>
                    <p class="lead fw-normal text-black-50 mb-0">With this shop hompeage template</p>
                </div>
            </div>
        </header>
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                     <c:forEach items="${list}"  var="list" varStatus="status" >
	                    <div class="col mb-5">
	                        <div class="card h-100">
	                            <!-- Product image-->
	                            <img class="card-img-top" src="resources${list.imageItem}" alt="..." />
	                            <!-- Product details-->
	                            <div class="card-body p-4">
	                                <div class="text-center">
	                                    <!-- Product name-->
	                                    <h5 class="fw-bolder">${list.nameItem}</h5>
	                                    <!-- Product price-->
	                                    ${list.priceItem}
	                                </div>
	                            </div>
	                            <!-- Product actions-->
	                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
	                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/itemdetail/${list.idItem}">상세정보</a></div>
	                            </div>
	                        </div>
	                    </div>
                    </c:forEach>
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
        
        <script>
			$(function(){
				var user = '${user}';
				if(user==null||user==''||user==""){
					$("#login").show();
					$("#logout").hide();
					$("#myinfo").hide();
				}else{
					$("#login").hide();
					$("#logout").show();
					$("#myinfo").show();
				}
				
				$("#searchButton").click(function(){
					var nameItem = $("#nameItem").val();
					if(nameItem==''){
						alert('검색어를 입력하세요.');
						return false;
					}else{
						document.searchForm.action= "/searchItem";
						document.searchform.submit();
					}
					
				});
				
				$("#cartButton").click(function(){
					location.href="/myCart";
				});
				
				$(document).ready(function(){
					window.onpageshow = function (event){
						if(event.persisted || (window.performance && window.performance.navigation.type == 2)){
							$("#nameItem").val("");
						}
					}
				});
			});
		</script>
    </body>
</html>
