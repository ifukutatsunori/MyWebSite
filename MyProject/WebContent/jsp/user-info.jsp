<!DOCTYPE html>
<html>
<head>

<title>アカウント情報/更新フォーム</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/origin/private-work-area.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">

</head>
<body>

<div class="alert2" role="alert">
      <h1 class="title-area">アカウント情報確認/変更</h1>
      </div>
<div class="card2" style="width: 25rem;">
  <img class="card-img-top" src="C:\Users\tatsu\Documents\git\MyWebSite\Mock\private-work-Picture\medium.jpg" alt="Card image cap" height="380">
  <div class="card-body">
  
  <!--管理者でログインした場合のみマスタページへ遷移-->
  <a href="C:\Users\tatsu\Documents\git\MyWebSite\Mock\item-list-master-private.html">
    <h5 class="card-title">管理者さん</h5>
    </a>
    
     <div class="user-form-area">
	     <div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-default">　ログインID　</span>
  </div>
  <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="admin">
</div>
	        <div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-default">　パスワード　</span>
  </div>
  <input type="password" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="password">
</div>
	 <div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-default">パスワード確認</span>
  </div>
  <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="password">
</div>
	        <div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-default">　氏名　</span>
  </div>
  <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="管理者">
</div>
	  <div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-default">生年月日</span>
  </div>
  <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="2011/11/11">
</div>
 <div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-default">　住所　</span>
  </div>
  <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="東京都">
</div>
 <div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-default" >郵便番号</span>
  </div>
  <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="100-1000">
</div>
<a href="C:\Users\tatsu\Documents\git\MyWebSite\Mock\user-list-private.html">
	          <button type="button" class="btn2 btn-primary">　　　更新　　　</button>
	           </a>
	    </div>
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
      <th scope="row"><a href="C:\Users\tatsu\Documents\git\MyWebSite\Mock\buy-history-private.html"><button type="button" class="btn5"><i class="fas fa-chevron-down"></i></button></a></th>
      <td>2008/04/22 15:42</td>
      <td>特別配送</td>
      <td>8500</td>
    </tr>
    <tr>
      <th scope="row"><button type="button" class="btn5"><i class="fas fa-chevron-down"></i></button></th>
      <td>2008/04/22 15:42</td>
      <td>通常配送</td>
      <td>20000</td>
    </tr>
  </tbody>
</table>
 <a href="C:\Users\tatsu\Documents\git\MyWebSite\Mock\user-list-private.html">
	     <button type="button" class="btn-return btn-link">　戻る　</button>
	     </a>     	  
</div>

	
</div>
</body>
</html>
