<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<title>Language Dashboard</title>
</head>
<body>
	<div class="container mt-5">
		<div class="w-25 m-3 float-end">
			<a href="/languages/${language.id}/delete" class="btn btn-outline-danger text-decoration-none">Delete</a>
			<a href="/languages" class="link text-decoration-none float-end">Dashboard</a>
		</div>
		<div>
			<h4 class="mt-5">Name: <c:out value="${language.name}"/></h4>
			<h4 class="mt-5">Designed by: <c:out value="${language.creator}"/></h4>
			<h4 class="mt-5">Current Version: <c:out value="${language.version}"/></h4>
			<a href="/languages/${language.id}/edit" class="btn btn-outline-primary text-decoration-none mt-5">Edit</a>
		</div>
	</div>
</body>
</html>