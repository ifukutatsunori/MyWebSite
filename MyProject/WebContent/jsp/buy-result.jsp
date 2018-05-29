<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>商品購入完了画面</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="css/origin/private-work-area.css">
<meta http-equiv="refresh" content="5;URL=Index">
</head>
<body>

	<div class="alert2" role="alert">
		<h1 class="title-area">購入完了画面</h1>
	</div>
	<h4 class="title-area2">購入が完了しました</h4>
	<div class="container">
		<div id="timer">10</div>
		<a href="" id="start" class="inactive">スタート</a>
	</div>
	<h3 class="title-area2">5秒後にホーム画面に遷移します</h3>
	<div>
		<a
			href="C:\Users\tatsu\Documents\git\MyWebSite\Mock\user-list-private.html"
			class="btn4 btn-secondary btn-lg"> 買い物を続ける </a> <a href="UserInfo"
			class="btn4 btn-success btn-lg"> 購入履歴へ </a>
	</div>
	<script>
		window.onload = function() {
			document
					.querySelector('#start')
					.addEventListener(
							'click',
							function(e) {
								e.preventDefault();
								var count = 5;
								var id = setInterval(
										function() {
											count--;
											document.querySelector('#timer').textContent = count;
											if (count <= 0)
												clearInterval(id);
										}, 1000);
							});
		}
	</script>
</body>
</html>
