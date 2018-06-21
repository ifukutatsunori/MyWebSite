<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<title>商品登録フォーム</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="css/origin/private-work-area.css">

</head>
<div class="alert2" role="alert">
	<div class="title-area"><h1>商品登録</h1></div>
</div>
<form class="registration" action="Item_Registration_master"
	enctype="multipart/form-data" method="post">
	<div class="item-form-area">

		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-default">商品名</span>
			</div>
			<input type="text" class="form-control" aria-label="Default"
				aria-describedby="inputGroup-sizing-default" name="name">
		</div>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-default">商品価格</span>
			</div>
			<input type="text" class="form-control" aria-label="Default"
				aria-describedby="inputGroup-sizing-default" name="price">
		</div>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-default">商品分類タグ</span>
			</div>
			<input type="text" class="form-control" aria-label="Default"
				aria-describedby="inputGroup-sizing-default" name="tag">
		</div>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-default">商品画像</span>
			</div>
			<input type="file" class="form-control" aria-label="Default"
				aria-describedby="inputGroup-sizing-default" name="file_name">
		</div>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-default">商品説明</span>
			</div>
			<input type="text" class="form-control" aria-label="Default"
				aria-describedby="inputGroup-sizing-default" name="detail">
		</div>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-default">Trend</span>
			</div>
			<input type="checkbox" class="size" name="trend" value="1">
		</div>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-default">Sale</span>
				</div>
			<input type="checkbox" name="sale" class="size2" value="1">
		</div>
		<a
			href="C:\Users\tatsu\Documents\git\MyWebSite\Mock\item-list-master-private.html">
			<button type="submit" class="btn2 btn-primary">　　登録　　</button>
		</a>
	</div>
</form>
<a href="Item_Master">
	<button type="button" class="btn-return btn-link">　戻る　</button>
</a>
<footer class="alert" role="alert"></footer>
</body>

</html>
