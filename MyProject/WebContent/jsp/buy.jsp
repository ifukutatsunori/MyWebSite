<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

<title>商品購入フォーム</title>
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
			<h1>商品購入/配送方法選択</h1>
		</div>
	</div>
	<c:if test="${errMsg != null}">
		<div class="alert1 alert-danger" role="alert">${errMsg}</div>
	</c:if>
	<form action="BuyConfirm" method="POST">
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
						<td>${cart.price}円(税込)</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="form2-area">
			<div class="row">
				<div class="col-sm-8"></div>
				<div class="col-sm-4">配送方法　※未選択の場合、通常配送になります</div>
			</div>
			<div class="row">
				<div class="col-sm"></div>
				<div class="col-sm"></div>
				<div class="col-sm">

					<select class="custom-select" id="inputGroupSelect03"
						name="delivery">
						<option selected value="2">配送方法を選択</option>
						<c:forEach var="dmdbList" items="${dmdbList}">
							<option value="${dmdbList.id}">${dmdbList.name}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form3-area">
				<div class="row">
					<div class="col-sm"></div>
					<div class="col-sm">
						<button type="submit" class="btn5 btn-info">購入確認</button>
					</div>
					<div class="col-sm"></div>
				</div>
			</div>
			<a href="Cart">
				<button type="button" class="btn-return2 btn-link">戻る</button>
			</a>
		</div>
	</form>
</body>
</html>

