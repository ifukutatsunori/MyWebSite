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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

</head>
<body>
	<div class="alert" role="alert">

		<h1 class="title-area">個人開発オンラインショップ</h1>

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
			<a href="">
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
					<li><a href="#">NEW</a></li>
					<li><a href="Item_PicUp?sale=1">SALE</a></li>
					<li><a href="Item_PicUp?trend=1">TREND</a></li>
				</ul></li>
			<li><a href="#">menu</a>
				<ul>
					<li><a href="#">submenu</a></li>
					<li><a href="#">submenu</a></li>
					<li><a href="#">submenu</a></li>
				</ul></li>
			<li><a href="#">Contact</a>
				<ul>
					<li><a href="#"><i class="fas fa-phone"></i>TEL</a></li>
					<li><a href="#"><i class="fas fa-envelope"></i>MAIL</a></li>
				</ul></li>
			<li><a href="#">Search</a>
				<ul>
					<li><div class="wrapper">
							<div class="input-group mb-2">
								<div class="input-group-prepend">
									<div class="input-group-text">
										<i class="fas fa-search"></i>
									</div>
								</div>
								<input type="text" class="form-control"
									id="inlineFormInputGroup" placeholder="Search">
							</div>
						</div></li>
				</ul></li>
		</ul>
	</div>

	<div class="container1">
		<div class="row">
			<c:forEach var="idb" items="${idb}">
				<div class="col-sm">
					<div class="card" style="width: 16rem;">
						<img class="card-img-top" height="280"
							src="private-work-Picture/${idb.file_name}" alt="Card image cap">
						<div class="card-body">
							<div>商品名</div>
							<div>${idb.name}</div>
							<div>商品価格 ${idb.price}円</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
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
</body>

</html>
