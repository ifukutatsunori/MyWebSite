<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>個人開発 ショップ商品一覧</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.10/css/all.css"
	integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="css/origin/private-work-area.css">
<link rel="stylesheet" type="text/css"
	href="css/origin/private-work-drop-menu.css">
<link rel="stylesheet" type="text/css"
	href="css/origin/style_common.css">
<link rel="stylesheet" type="text/css" href="css/origin/style5.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js">

</script>
<script src="js/bootstrap.min.js"></script>
</head>
<body>
	<div class="alert" role="alert">

		<div class="title-area"><h1>個人開発オンラインショップ</h1></div>

		<div class="button-area">

			<a href="UserInfo">
				<button type="button" class="btn">
					<i class="far fa-user"></i>アカウント
				</button>
			</a> <a href="SignUp">
				<button type="button" class="btn">
					<i class="fas fa-user-plus"></i>会員登録
				</button>
			</a>
			<c:choose>
				<c:when test="${user.id == null}">
					<a href="login">
						<button type="submit" class="btn">
							<i class="fas fa-sign-in-alt"></i>ログイン
						</button>
					</a>
				</c:when>
				<c:when test="${user.id != null}">
					<a href="Logout">
						<button type="submit" class="btn">
							<i class="fas fa-sign-out-alt"></i>ログアウト
						</button>
					</a>
				</c:when>
			</c:choose>
			<a href="Cart">
				<button type="button" class="btn">
					<i class="fas fa-shopping-cart"></i>カート
				</button>
			</a>
		</div>
	</div>
	<div>
		<ul id="normal" class="dropmenu">
			<li><a href="#">Shop Category</a>
				<ul>

					<li><a href="Index">ALL ITEM</a></li>
					<li><a href="Item_Tag_Search?tag=TOPS">TOPS</a></li>
					<li><a href="Item_Tag_Search?tag=BOTTOMS">BOTTOMS</a></li>
					<li><a href="Item_Tag_Search?tag=OUTER">OUTER</a></li>

				</ul></li>

			<li><a href="#">Pickup</a>
				<ul>
					<li><a href="#">NEW ※未実装</a></li>
					<li><a href="Item_PicUp?sale=1">SALE</a></li>
					<li><a href="Item_PicUp?trend=1">TREND</a></li>
				</ul></li>
			<li><a href="#">Contents</a>
				<ul>
					<li><a href="#">SIZE GUIDE ※未実装</a></li>
					<li><a href="#">MAGAZINE【vol.1】※未実装</a></li>
					<li><a href="#">MAGAZINE【vol.2】※未実装</a></li>
				</ul></li>
			<li><a href="#">Contact</a>
				<ul>
					<li><a href="#"><i class="fas fa-phone"></i>TEL ※未実装</a></li>
					<li><a href="#"><i class="fas fa-envelope"></i>MAIL ※未実装</a></li>
				</ul></li>
			<li><a href="#">Search</a>
				<ul>
					<li><div class="wrapper">
							<form class="form-Search" action="Item_Word_Search" method="post">
								<div class="input-group mb-2">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<button type="submit">
												<i class="fas fa-search"></i>
											</button>
										</div>
									</div>
									<input type="text" class="form-control"
										id="inlineFormInputGroup" name="searchWord" placeholder="">
								</div>
							</form>
						</div></li>
				</ul></li>
		</ul>
	</div>

	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100"
					src="private-work-Picture/1200x300 (1).jpg" alt="First slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" height="325"
					src="private-work-Picture/n-1200x300 (2).jpg" alt="Second slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100"
					src="private-work-Picture/1200x300 (3).jpg" alt="Third slide">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
	<div id="content">
		<div id="main">
			<c:forEach var="idb" items="${idb}">
				<div class="view view-fifth">
					<img src="private-work-Picture/${idb.file_name}" />
					<div class="mask">
						<div class="mask-area">
							<h2>${idb.name}</h2>
							<p>
							<div>価格 ${idb.price}円</div>
							<a href="Item_info?id=${idb.id}">商品詳細</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<nav>
			<ul>
				<li><h2>SHOP CATEGORY</h2></li>
				<li><a href="Index">ALL ITEM</a></li>
				<li><a href="Item_Tag_Search?tag=TOPS">TOPS</a></li>
				<li><a href="Item_Tag_Search?tag=BOTTOMS">BOTTOMS</a></li>
				<li><a href="Item_Tag_Search?tag=OUTER">OUTER</a></li>
			</ul>
			<ul>
				<li><h2>PICK UP</h2></li>
				<li><a href="">NEW</a></li>
				<li><a href="Item_PicUp?sale=1">SALE</a></li>
				<li><a href="Item_PicUp?trend=1">TREND</a></li>
			</ul>
			<ul>
				<li><h2>CONTENTS</h2></li>
				<li><a href="">SIZE GUIDE</a></li>
				<li><a href="">MAGAZINE【vol.1】</a></li>
				<li><a href="">MAGAZINE【vol.2】</a></li>
			</ul>
		</nav>
	</div>

	<p id="pageTop">
		<a href="#"><i class="fa fa-chevron-up "></i></a>
	</p>

	<script>
		// Javascriptの記述
		//■page topボタン
		$(function() {
			var topBtn = $('#pageTop');
			topBtn.hide();

			//◇ボタンの表示設定
			$(window).scroll(function() {
				if ($(this).scrollTop() > 80) {
					//---- 画面を80pxスクロールしたら、ボタンを表示する
					topBtn.fadeIn();
				} else {
					//---- 画面が80pxより上なら、ボタンを表示しない
					topBtn.fadeOut();
				}
			});

			// ◇ボタンをクリックしたら、スクロールして上に戻る
			topBtn.click(function() {
				$('body,html').animate({
					scrollTop : 0
				}, 500);
				return false;
			});

		});
	</script>
	<footer class="alert" role="alert"></footer>
</body>
</html>
