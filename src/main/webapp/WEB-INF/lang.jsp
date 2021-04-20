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
		<table class="table table-striped border">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">Name</th>
					<th scope="col">Creator</th>
					<th scope="col">Version</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${languages}" var="language">
					<tr>
						<td><c:out value="${language.id}"></c:out></td>
						<td><c:out value="${language.name}" /></td>
						<td><c:out value="${language.creator}" /></td>
						<td><c:out value="${language.version}" /></td>
						<td>
							<a href="/languages/${language.id}"><button type="submit" class="btn btn-outline-info">View</button></a>
							<a href="/languages/${language.id}/edit"><button type="submit" class="btn btn-outline-primary">Edit</button></a>
							<a href="/languages/${language.id}/delete"><button type="submit" class="btn btn-outline-danger">Delete</button></a>	
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="form-group mt-5">
			<form action="/languages/create" method="post">
				<label for="name" class="mt-3">Name</label>
				<input type="text" name="name" id="name" class="form-control">
				<label for="creator" class="mt-3">Creator</label>
				<input type="text" name="creator" id="creator" class="form-control">
				<label for="version" class="mt-3">Version</label>
				<input type="number" id="version" name="version" class="form-control">
				<br>
				<input type="submit" value="Create" class="btn btn-primary btn-lg">
			</form>
		</div>
	</div>
</body>
</html>