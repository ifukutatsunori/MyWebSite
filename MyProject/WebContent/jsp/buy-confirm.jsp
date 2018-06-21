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
		<div class="title-area">
			<h1>商品購入確認</h1>
		</div>
	</div>
	<form action="BuyResult" method="POST">
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">商品名</th>
					<th scope="col">単価</th>
					<th scope="col">小計</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="cart" items="${cart}">
					<tr>
						<th scope="row">${cart.name}</th>
						<td>${cart.price}円</td>
						<td>${cart.price}円</td>
					</tr>
				</c:forEach>
				<tr>
					<th scope="row">${bdb.deliveryMethodName}</th>
					<td></td>
					<td>${bdb.deliveryMethodPrice}円</td>
				</tr>
				<tr>
					<th scope="row"></th>
					<td>合計</td>
					<td>${bdb.totalPrice}円</td>
				</tr>
			</tbody>
		</table>
		<div class="form3-area">
			<div class="row">
				<div class="col-sm"></div>
				<div class="col-sm">
					<button type="submit" class="btn5 btn-info">購 入</button>
				</div>
				<div class="col-sm"></div>
			</div>
		</div>
		<div>
			<a href="Buy">
				<button type="button" class="btn-return btn-link">戻る</button>
			</a>
		</div>
	</form>
</body>
</html>

