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

			<!--管理者でログインした場合のみマスタページへ遷移-->
			<a class="card-title"> 管理者さん </a>

			<form action="UpDateServlet" method="post">

				<div class="user-form-area">
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<input type="hidden" name="id" value="${udb.id}"> <input
								type="hidden" name="updateDate" value="now()"> <label></label>
							<span class="input-group-text" id="inputGroup-sizing-default">
								ログインID </span>
						</div>
						<input type="text" class="form-control" aria-label="Default"
							aria-describedby="inputGroup-sizing-default" value="${udb.login_id}">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="inputGroup-sizing-default">
								パスワード </span>
						</div>
						<input type="password" class="form-control" aria-label="Default"
							aria-describedby="inputGroup-sizing-default"
							placeholder="">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="inputGroup-sizing-default">パスワード確認</span>
						</div>
						<input type="text" class="form-control" aria-label="Default"
							aria-describedby="inputGroup-sizing-default"
							placeholder="">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="inputGroup-sizing-default">
								氏名 </span>
						</div>
						<input type="text" class="form-control" aria-label="Default"
							aria-describedby="inputGroup-sizing-default" value="${udb.name}">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="inputGroup-sizing-default">生年月日</span>
						</div>
						<input type="text" class="form-control" aria-label="Default"
							aria-describedby="inputGroup-sizing-default"
							value="${udb.birth_date}">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="inputGroup-sizing-default">
								住所 </span>
						</div>
						<input type="text" class="form-control" aria-label="Default"
							aria-describedby="inputGroup-sizing-default" value="${udb.address}">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="inputGroup-sizing-default">郵便番号</span>
						</div>
						<input type="text" class="form-control" aria-label="Default"
							aria-describedby="inputGroup-sizing-default"
							value="${udb.postal_code}">
					</div>
					<a
						href="C:\Users\tatsu\Documents\git\MyWebSite\Mock\user-list-private.html">
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
				<tr>
					<th scope="row"><a
						href="C:\Users\tatsu\Documents\git\MyWebSite\Mock\buy-history-private.html"><button
								type="button" class="btn5">
								<i class="fas fa-chevron-down"></i>
							</button></a></th>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<th scope="row"><button type="button" class="btn5">
							<i class="fas fa-chevron-down"></i>
						</button></th>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
		<a href="Logout">
			<button type="button" class="btn-return btn-link">戻る</button>
		</a>
	</div>
</body>
</html>
