<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<!-- for Bootstrap CSS -->
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<!-- YOUR own local CSS -->
	<link rel="stylesheet" href="/css/style.css"/>
	<!-- For any Bootstrap that uses JS or jQuery-->
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="/script/script.js" defer></script>
<title>Random Gold Game</title>
</head>
<nav class="nav bg-dark text-white d-flex px-3 aign-items-center">
	<h1>RANDOM GOLD GAME</h1>
<!-- 	<div class="d-flex align-items-center">
		<a class="text-white" href="#">Link</a>
	</div> -->
</nav>
<nav class="nav d-flex justify-content-end px-3 aign-items-center gap-5">
	<h2>Gold Count: <c:out value="${count}"></c:out></h2>
	<div class="d-flex align-items-center">
		<a href="/clear" class="btn btn-outline-danger btn-sm my-auto">Reset</a>
	</div>
</nav>
<body>
	<div class="container col-9 bg-light p-5 rounded d-flex padding-5 justify-content-around gap-3">
		<form action="/gold" method="post">
			<div class="card">
				<div class="card-body text-center">
					<img class="card-img-top" style="width:200px; height:200px; object-fit:cover;" src="https://images.fineartamerica.com/images-medium-large-5/new-england-farm-square-bill-wakeley.jpg" alt="img missing...">
					<h3 class="card-title">Farm</h3>
					<p class="card-subtitle my-2 text-muted">(earns 10-20 gold)</p>
					<input type="hidden" value="farm" name="check">
					<button class="btn btn-primary btn-lg" type="submit">Find Gold!</button>
				</div>
			</div>
		</form>
		<form action="/gold" method="post">
			<div class="card">
				<div class="card-body text-center">
					<img class="card-img-top" style="width:200px; height:200px; object-fit:cover;" src="https://media.istockphoto.com/id/641236218/photo/secret-cave.jpg?s=612x612&w=0&k=20&c=DmpLpPXqS4Lj3eSlL4pJdW0EkhB7-SvE1CZN7jg5vjE=" alt="img missing...">
					<h3 class="card-title">Cave</h3>
					<p class="card-subtitle my-2 text-muted">(earns 5-10 gold)</p>
					<input type="hidden" value="cave" name="check">
					<button class="btn btn-primary btn-lg" type="submit">Find Gold!</button>
				</div>
			</div>
		</form>
		<form action="/gold" method="post">
			<div class="card">
				<div class="card-body text-center">
					<img class="card-img-top" style="width:200px; height:200px; object-fit:cover;" src="https://cdn.apartmenttherapy.info/image/upload/v1556716350/stock/8ea241e96504a398f291a31939963e8ba948368c.jpg" alt="img missing...">
					<h3 class="card-title">House</h3>
					<p class="card-subtitle my-2 text-muted">(earns 2-5 gold)</p>
					<input type="hidden" value="house" name="check">
					<button class="btn btn-primary btn-lg" type="submit">Find Gold!</button>
				</div>
			</div>
		</form>
		<form action="/gold" method="post">
			<div class="card">
				<div class="card-body text-center">
					<img class="card-img-top" style="width:200px; height:200px; object-fit:cover;" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2JIEFQuR53Q6fejlE53GdGJfkiHJQ1D6SpVeBzpUdLoJRZzLkfQb4BKF1w6_KskS_9jQ&usqp=CAU" alt="img missing...">
					<h3 class="card-title">Quest</h3>
					<p class="card-subtitle my-2 text-muted">(add or remove 0-50 gold)</p>
					<input type="hidden" value="quest" name="check">
					<button type="submit" class="btn btn-primary btn-lg">Find Gold!</button>
				</div>
			</div>
		</form>
		<form action="/gold" method="post">
			<div class="card">
				<div class="card-body text-center">
					<img class="card-img-top" style="width:200px; height:200px; object-fit:cover;" src="https://www.intotheblue.co.uk/blog/wp-content/uploads/2017/10/Facial-750x606.jpg" alt="img missing...">
					<h3 class="card-title">Spa</h3>
					<p class="card-subtitle my-2 text-muted">(remove 5-20 gold)</p>
					<input type="hidden" value="spa" name="check">
					<button type="submit" class="btn btn-danger btn-lg">Spend Gold</button>
				</div>
			</div>
		</form>
	</div>
	<div class="container text-center col-9 bg-light p-5 rounded padding-5" style="max-height: 500px; overflow: scroll;">
		<c:forEach var="m" items="${messages}">
			<c:if test="${m.type.equals('danger')}">
				<p class="text-danger">
					<c:out value="${m.msg}"/>
				</p>
			</c:if>
			<c:if test="${m.type.equals('green')}">
				<p class="text-success">
					<c:out value="${m.msg}" />
				</p>
			</c:if >
			<hr>
		</c:forEach>
	</div>
</body>
</html>