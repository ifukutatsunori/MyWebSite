<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<title>ログインフォーム</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="css/fontawesome-all.min.css">
<link rel="stylesheet" type="text/css"
	href="css/origin/private-work-area.css">
<link rel="stylesheet" type="text/css"
	href="css/origin/private-work-drop-menu.css">

</head>
<body>
	<div class="alert" role="alert">
		<h1 class="title-area">会員ログインページ</h1>
	</div>
	<c:if test="${errMsg != null}">
		<div class="alert1 alert-danger" role="alert">${errMsg}</div>
	</c:if>

	<div class="msg-area">会員ページへようこそ！</div>
	<div class="alert3 alert-secondary" role="alert">
		<div>ログインIDとパスワードを入力してください。</div>
		<div>
			<a
				href="SignUp">新規会員登録はこちら</a>
		</div>

	</div>
	<form class="form-signin" action="login" method="post">
		<div class="form-area">
			<div class="form-group">
				<label for="exampleInputId">ログインID</label> <input type="text"
					class="form-control" name="login_id" id="login_id" placeholder="">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">パスワード</label> <input
					type="password" class="form-control" name="password" id="password"
					placeholder="">
			</div>
			<button type="submit" class="btn3 btn-primary">ログイン</button>
		</div>
		<div>
			<a href="Index">
				<button type="button" class="btn-return btn-link">戻る</button>
			</a>
		</div>
	</form>

</body>
</html>
