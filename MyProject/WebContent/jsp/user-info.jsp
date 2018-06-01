<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<title>アカウント情報/更新フォーム</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="css/origin/private-work-area.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.10/css/all.css"
	integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg"
	crossorigin="anonymous">

</head>
<body>

	<div class="alert2" role="alert">
		<h1 class="title-area">アカウント情報確認/変更</h1>
	</div>
	<div class="card2" style="width: 25rem;">

		<div class="card-body">

			<!--管理者でログインした場合のみマスタページのボタンが表示される-->

			<c:if test="${user.id == 1}">
				<a href="Item_Master">
					<button type="submit" class="btn2 btn-primary">商品管理</button>
				</a>
			</c:if>
			<form name="form_test">
				<input type="hidden" name="id" value="${user.id}">
			</form>
			<form action="UserInfo" method="post">
				<div class="user-form-area">
					<div class="input-group mb-3">
						<div class="input-group-prepend">

							<span class="input-group-text" id="inputGroup-sizing-default">
								ログインID </span>
						</div>
						<input type="text" class="form-control" aria-label="Default"
							name="login_id" aria-describedby="inputGroup-sizing-default"
							value="${user.login_id}">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="inputGroup-sizing-default">
								パスワード </span>
						</div>
						<input type="password" class="form-control" aria-label="Default"
							name="password" aria-describedby="inputGroup-sizing-default"
							placeholder="">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="inputGroup-sizing-default">パスワード確認</span>
						</div>
						<input type="text" class="form-control" aria-label="Default"
							name="passwordConfirm"
							aria-describedby="inputGroup-sizing-default" placeholder="">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="inputGroup-sizing-default">
								氏名 </span>
						</div>
						<input type="text" class="form-control" aria-label="Default"
							name="name" aria-describedby="inputGroup-sizing-default"
							value="${user.name}">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="inputGroup-sizing-default">生年月日</span>
						</div>
						<input type="text" class="form-control" aria-label="Default"
							name="birth_date" aria-describedby="inputGroup-sizing-default"
							value="${user.birth_date}">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="inputGroup-sizing-default">
								住所 </span>
						</div>
						<input type="text" class="form-control" aria-label="Default"
							name="address" aria-describedby="inputGroup-sizing-default"
							value="${user.address}">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="inputGroup-sizing-default">郵便番号</span>
						</div>
						<input type="text" class="form-control" aria-label="Default"
							name="postal_code" aria-describedby="inputGroup-sizing-default"
							value="${user.postal_code}">
					</div>
					<a href="/Logout">
						<button type="submit" class="btn2 btn-primary">更新</button>
					</a>
				</div>
			</form>

		</div>
	</div>
	<div class="table-area2">
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col"></th>
					<th scope="col">購入日時</th>
					<th scope="col">配送方法</th>
					<th scope="col">購入金額</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bdb" items="${bdb}">
					<tr>
						<th scope="row"><a href="User_Buy_History?buy_id=${bdb.id}"><button type="button"
									class="btn5">
									<i class="fas fa-chevron-down"></i>
								</button></a></th>
						<td>${bdb.buyDateFmt}</td>
						<td>${bdb.deliveryMethodName}</td>
						<td>${bdb.totalPrice}円</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="Index">
			<button type="button" class="btn-return btn-link">戻る</button>
		</a>
	</div>
</body>
</html>
