<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ page isErrorPage="true" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<title>Books</title>
</head>
<body>
	<div class="container p-5 mt-5">
		<div class="w-25 m-3 float-end">
			<a href="/languages/${language.id}/delete" class="btn btn-outline-danger text-decoration-none">Delete</a>
			<a href="/languages" class="link text-decoration-none float-end">Dashboard</a>
		</div>
		<div class="form-group mt-5">
			<form:form action="/languages/${language.id}/update" method="post" modelAttribute="language">
                <p>
                    <form:label path="name">Name: </form:label>
                    <form:errors path="name"/>
                    <form:input path="name" class="form-control"/>
                </p>
                <p>
                    <form:label path="creator">Creator: </form:label>
                    <form:errors path="creator"/>
                    <form:input path="creator" class="form-control"/>
                </p>
                <p>
                    <form:label path="version">Version: </form:label>
                    <form:errors path="version"/>
                    <form:input path="version" class="form-control"/>
                </p> 
	            <input type="submit" value="Edit" class="btn btn-outline-primary"/>
       		</form:form>
		</div>
	</div>
</body>
</html>