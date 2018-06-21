<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<title>カート参照/購入フォーム</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.10/css/all.css"
	integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="css/origin/private-work-area.css">

</head>
<body>

	<div class="alert2" role="alert">
		<div class="title-area"><h1>カート詳細/購入</h1></div>
	</div>
	<c:if test="${errMsg != null}">
		<div class="alert1 alert-danger" role="alert">${errMsg}</div>
	</c:if>
	<c:if test="${errMsg2 != null}">
		<div class="alert1 alert-danger" role="alert">${errMsg2}</div>
	</c:if>
	<form action="Cart" method="POST">
		<div>
			<button type="submit" class="btn4 btn-secondary btn-lg" name="action">
				削 除 <i class="far fa-trash-alt"></i>
			</button>
			<a href="Buy" class="btn4 btn-success btn-lg"> レジに進む <i
				class="fas fa-hand-holding-usd"></i>
			</a>
		</div>
		<div class="item-list-area">
			<div class="container">
				<div class="row">
					<c:forEach var="cart" items="${cart}">
						<div class="col">
							<div class="card" style="width: 18rem;">
								<img class="card-img-top" height="360"
									src="private-work-Picture/${cart.file_name}"
									alt="Card image cap">
								<div class="card-body">
									<h5 class="card-title">${cart.name}</h5>
									<p class="card-text">${cart.detail}</p>
									<p class="card-text">価格${cart.price}円</p>
									<div class="form-check">
										<input type="checkbox" class="form-check-input"
											name="delete_id" id="deleteCheck" value="${cart.id}">
										<label class="form-check-label" for="exampleCheck1">削除</label><i
											class="fas fa-cart-arrow-down"></i>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<a href="Index">
				<button type="button" class="btn-return2 btn-link">戻る</button>
			</a>
			</div>
		</div>
	</form>
</body>
</html>
