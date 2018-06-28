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
		<div class="title-area">
			<h1>購入完了画面</h1>
		</div>
	</div>
	<h4 class="title-area2">購入が完了しました</h4>
	<h3 class="title-area2">5秒後にホーム画面に遷移します</h3>
	<div class="form2-area">
		<div class="row">
			<div class="col">
				<button formaction="Index" class="btn4 btn-secondary btn-lg">買い物を続ける</button>
			</div>
			<div class="col">
				<button formaction="UserInfo" class="btn4 btn-success btn-lg">購入履歴へ</button>
			</div>
		</div>
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
