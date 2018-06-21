<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<title>商品購入確認</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.10/css/all.css"
	integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="css/origin/private-work-area.css">
<link rel="stylesheet" type="text/css"
	href="css/origin/private-work-drop-menu.css">

</head>
<body>

	<div class="alert2" role="alert">
		<div class="title-area"><h1>商品購入履歴確認</h1></div>
	</div>
	<div class="table-area3">
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">購入日時</th>
					<th scope="col">配送方法</th>
					<th scope="col">合計金額</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="ubh" items="${ubh}">
					<tr>
						<th scope="row">${ubh.buyDateFmt}</th>
						<td>${ubh.deliveryMethodName}</td>
						<td>${ubh.totalPrice}円</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="table-area4">
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">商品名</th>
					<th scope="col">単価</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="idb" items="${idb}">
					<tr>
						<th scope="row">${idb.name}</th>
						<td>${idb.price}円</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div>
		<a href="UserInfo">
			<button type="button" class="btn-return btn-link">戻る</button>
		</a>
	</div>
</body>
</html>

