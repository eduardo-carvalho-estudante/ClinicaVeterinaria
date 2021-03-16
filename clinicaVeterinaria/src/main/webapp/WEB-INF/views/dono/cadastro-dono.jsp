<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro - Home</title>

<link href="/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
	
	<jsp:include page="../comum/header-secretaria.jsp"></jsp:include>

	<spring:url value="/secretariaDono/cadastraDono" var="cadastraDono"></spring:url>
	<spring:url value="/secretariaDono/deletaDono" var="deletaDono"></spring:url>
	<spring:url value="/secretariaDono/editaDono" var="editaDono"></spring:url>
	<spring:url value="/secretariaDono/showSelecionaAnimais" var="selecionaAnimais"></spring:url>

	<div class="container">
		<h1>Cadastro do Dono</h1>
		
		<c:if test="${not empty erro}">
			<div id="divMensagemErro" class="alert alert-danger" role="alert">
				${erro}
			</div>
		</c:if>
		
		<c:if test="${not empty sucesso}">
			<div id="divMensagemSucesso" class="alert alert-success" role="alert">
				${sucesso}
			</div>
		</c:if>

		<form:form action="${cadastraDono}" modelAttribute="dono">
		
			<div class="form-group">
				<label for="cpf">CPF:</label>
				<form:input path="cpf" id="cpf" class="form-control" />
			</div>

			<div class="form-group">
				<label for="nome">Nome:</label> <input type="text" name="nome"
					id="nome" value="${dono.nome}" class="form-control" />
			</div>

			<div class="form-group">
				<label for="endereco">Endereço:</label> <input type="text"
					name="endereco" id="endereco" value="${dono.endereco}"
					class="form-control" />
			</div>

			<div class="form-group">
				<label for="telefone">Telefone:</label> <input type="text"
					name="telefone" id="telefone" value="${dono.telefone}"
					class="form-control" />
			</div>
			
			<br>


			<button type="submit" class="btn btn-primary">Cadastrar</button>

			<a href="/secretaria/area" class="btn btn-success">Voltar</a>
			
		</form:form>

		<c:if test="${not empty donos}">
			<table class="table">
				<tr>
					<th width="20%">CPF</th>
					<th width="20%">Nome</th>
					<th width="40%">Endereco</th>
					<th width="20%">Animais</th>
					<th colspan="3" width="20%">Ações</th>
				</tr>

				<c:forEach var="dono" items="${donos}">
					<tr>
						<td>${dono.cpf}</td>
						<td>${dono.nome}</td>
						<td>${dono.endereco}</td>
						<td>${dono.animais}</td>
						<td><a href="#"
							class="btn btn-warning">Editar</a></td>
						<td><a href="${deletaDono}/${dono.cpf}"
							class="btn btn-danger">Deletar</a></td>
						<td><a href="${selecionaAnimais}/${dono.cpf}" 
							class="btn btn-info">Animais</a></td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
	</div>
	
	
	




	<script type="text/javascript" src="/js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="/js/bootstrap.min.js"></script>
		<script type="text/javascript">
		$(document).ready(function() {
			$('#divMensagemErro').delay(5000).fadeOut('slow');
			$('#divMensagemSucesso').delay(5000).fadeOut('slow');
		});
	</script>
</body>
</html>