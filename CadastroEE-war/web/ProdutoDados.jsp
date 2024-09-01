<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <meta charset="UTF-8">
    <title>Cadastro de Produto</title>
    <style>
    </style>
</head>
<body class="container">
    <h1>Dados do Produto</h1>
    
    <form action="${pageContext.request.contextPath}/ServletProdutoFC" method="post" class="form">
        <input type="hidden" name="acao" value="${acao}">
        <input type="hidden" name="redirigir" value="true">
        <c:if test="${acao == 'alterar'}">
            <input type="hidden" name="id" value="${produto.idProduto}">
        </c:if>
            
        <div class="mb-3">
            <label for="nome" class="form-label">Nome:</label>
            <input type="text" id="nome" name="nome" value="${nomeproduto}" class="form-control">
        </div>
        
        <div class="mb-3">
            <label for="quantidade" class="form-label">Quantidade:</label>
            <input type="number" id="quantidade" name="quantidade" value="${produto.quantidade}" class="form-control">
        </div>
        
        <div class="mb-3">
            <label for="precoVenda" class="form-label">Preço de Venda:</label>
            <input type="number" id="precoVenda" name="precoVenda" value="${produto.precoVenda}" class="form-control">
        </div>
        
        <c:if test="${acao == 'incluir'}">
            <input type="submit" value="Adicionar Produto" class="btn btn-primary">
        </c:if>
        <c:if test="${acao == 'alterar'}">
            <input type="submit" value="Alterar Produto" class="btn btn-primary">
        </c:if>
    </form>
</body>
</html>