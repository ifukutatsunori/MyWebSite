<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<title>商品詳細/更新フォーム</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="css/origin/private-work-area.css">

</head>
<body>

	<div class="alert2" role="alert">
		<div class="title-area"><h1>商品詳細/変更</h1></div>
	</div>
	<form class="item_info_master" action="Item_Info_Master"
		enctype="multipart/form-data" method="post">
		<div class="card" style="width: 40rem;">
			<div class="card-body">
				<div class="item-form-area2">
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="inputGroup-sizing-default">商品名</span>
						</div>
						<input type="hidden" name="id" value="${idb.id}"> <input
							type="text" class="form-control" aria-label="Default"
							aria-describedby="inputGroup-sizing-default" name="name"
							value="${idb.name}">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="inputGroup-sizing-default">商品価格</span>
						</div>
						<input type="text" class="form-control" aria-label="Default"
							aria-describedby="inputGroup-sizing-default" name="price"
							value="${idb.price}">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="inputGroup-sizing-default">商品分類タグ</span>
						</div>
						<input type="text" class="form-control" aria-label="Default"
							aria-describedby="inputGroup-sizing-default" name="tag"
							value="${idb.tag}">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="inputGroup-sizing-default">商品画像</span>
						</div>
						<input type="file" class="form-control" aria-label="Default"
							aria-describedby="inputGroup-sizing-default" name="file_name"
							value="${idb.file_name}">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="inputGroup-sizing-default">商品説明</span>
						</div>
						<input type="text" class="form-control" aria-label="Default"
							aria-describedby="inputGroup-sizing-default" name="detail"
							value="${idb.detail}">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="inputGroup-sizing-default">Trend</span>
						</div>
						<input type="checkbox" name="trend" class="size" value="1">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="inputGroup-sizing-default">Sale</span>
						</div>
						<input type="checkbox" name="sale" class="size2" value="1">
					</div>
					<button type="submit" class="btn2 btn-primary">　　更新　　</button>
				</div>
				<a href="Item_Master">
					<button type="button" class="btn-return2 btn-link">　戻る　</button>
				</a>
			</div>
		</div>
	</form>
	<footer class="alert" role="alert"></footer>
</body>

</html>
