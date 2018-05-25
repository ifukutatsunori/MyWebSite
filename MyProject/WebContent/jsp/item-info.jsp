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
		<h1 class="title-area">商品詳細/カート追加</h1>
	</div>
	<div></div>
	<div class="item-list-area">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="card" style="width: 21rem;">
						<img class="card-img-top"
							src="private-work-Picture/${idb.file_name}" alt="Card image cap">
						<div class="card-body">
							<h5 class="card-title">${idb.name}</h5>
							<p class="card-text">${idb.detail}</p>
							<p class="card-text">価格${idb.price}円</p>
							<form action="Item_Add" method="POST">
								<input type="hidden" name="item_id" value="${idb.id}">
								<button type="submit" class="btn2 btn-outline-info ">
									カートに追加<i class="fas fa-cart-plus"></i>
								</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="btn-return">
		<a href="Index">
			<button type="button" class="btn-return2 btn-link">戻る</button>
		</a>
	</div>
</body>
</html>
