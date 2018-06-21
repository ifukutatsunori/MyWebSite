<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<title>商品リスト一覧</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="css/origin/private-work-area.css">
<link rel="stylesheet" type="text/css"
	href="css/origin/private-work-drop-menu.css">
</head>
<body>
	<div class="alert" role="alert">
		<div class="title-area"><h1>商品リスト一覧</h1></div>
	</div>
	<div class="table-area">
		<table class="table table-hover">
			<thead>

				<tr>
					<th scope="col">商品ID</th>
					<th scope="col">商品名</th>
					<th scope="col">分類コード</th>
					<th scope="col">価格</th>
					<th scope="col">登録日時</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="idb" items="${idb}">
					<tr>
						<th scope="row">${idb.id}</th>
						<td><a href="Item_Info_Master?id=${idb.id}">${idb.name}</a></td>
						<td>${idb.tag}</td>
						<td>${idb.price}</td>
						<td>${idb.create_date}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="form2-area">
			<div class="row">
				<div class="col"></div>
				<div class="col">
					<a href="UserInfo">
						<button type="button" class="btn-return2 btn-link">　戻る　</button>
					</a>
				</div>
				<div class="col">
					<a href="Item_Registration_master">
						<button type="button" class="btn2 btn-primary">　商品登録　</button>
					</a>
				</div>
				<div class="col"></div>
			</div>
		</div>
	</div>
	<footer class="alert" role="alert"></footer>
</body>

</html>
