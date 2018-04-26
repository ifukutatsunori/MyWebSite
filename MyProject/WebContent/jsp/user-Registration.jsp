<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<title>会員登録フォーム</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="css/origin/private-work-area.css">

</head>
<div class="alert2" role="alert">
	<h1 class="title-area">新規会員登録</h1>
</div>
<c:if test="${errMsg != null}">
		<div class="alert1 alert-danger" role="alert">${errMsg}</div>
	</c:if>
<form class="form-signin" action="SignUp" method="post">
	<div class="item-form-area">
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-default">
					ログインID </span>
			</div>
			<input type="text" class="form-control" name="login_id"
				aria-label="Default" aria-describedby="inputGroup-sizing-default">
		</div>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-default">
					パスワード </span>
			</div>
			<input type="password" class="form-control" name="password"
				aria-label="Default" aria-describedby="inputGroup-sizing-default">
		</div>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-default">パスワード確認</span>
			</div>
			<input type="password" class="form-control" name="passwordConfirm"
				aria-label="Default" aria-describedby="inputGroup-sizing-default">
		</div>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-default">
					氏名 </span>
			</div>
			<input type="text" class="form-control" name="name"
				aria-label="Default" aria-describedby="inputGroup-sizing-default">
		</div>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-default">生年月日</span>
			</div>
			<input type="date" class="form-control" name="birth_date"
				aria-label="Default" aria-describedby="inputGroup-sizing-default">
		</div>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-default">
					住所 </span>
			</div>
			<input type="text" class="form-control" name="address"
				aria-label="Default" aria-describedby="inputGroup-sizing-default">
		</div>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-default">郵便番号</span>
			</div>
			<input type="text" class="form-control" name="postal_code"
				aria-label="Default" aria-describedby="inputGroup-sizing-default">
		</div>

		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-default">電話番号</span>
			</div>
			<input type="text" class="form-control" name="phone_number"
				aria-label="Default" aria-describedby="inputGroup-sizing-default">
		</div>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-default">メールアドレス</span>
			</div>
			<input type="text" class="form-control" name="mail_address"
				aria-label="Default" aria-describedby="inputGroup-sizing-default">
		</div>

			<button type="submit" class="btn2 btn-primary">登録</button>

	</div>
	</form>
	<a
		href="C:\Users\tatsu\Documents\git\MyWebSite\Mock\user-list-private.html">
		<button type="button" class="btn-return btn-link">戻る</button>
	</a>
	</body>
</html>
