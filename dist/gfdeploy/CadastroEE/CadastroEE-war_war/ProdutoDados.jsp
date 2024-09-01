<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Cadastro de Produto</title>
    <style>
        label {
            display: block;
            margin-bottom: 10px;
        }
        input[type="text"], input[type="number"] {
            width: 100%;
            height: 30px;
            margin-bottom: 20px;
            padding: 10px;
            box-sizing: border-box;
        }
        .btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h1>Cadastro de Produto</h1>
    
    <form action="${pageContext.request.contextPath}/ServletProdutoFC" method="post">
        <input type="hidden" name="acao" value="${acao}">
        <input type="hidden" name="redirigir" value="true">
        <c:if test="${acao == 'alterar'}">
            <input type="hidden" name="id" value="${produto.idProduto}">
        </c:if>
        <label for="nome">Nome:</label>
        <input type="text" id="nome" name="nome" value="${nomeproduto}">
        
        <label for="quantidade">Quantidade:</label>
        <input type="number" id="quantidade" name="quantidade" value="${produto.quantidade}">
        
        <label for="precoVenda">Preço de Venda:</label>
        <input type="number" id="precoVenda" name="precoVenda" value="${produto.precoVenda}">
        
        <c:if test="${acao == 'incluir'}">
            <input type="submit" value="Cadastrar" class="btn">
        </c:if>
        <c:if test="${acao == 'alterar'}">
            <input type="submit" value="Alterar" class="btn">
        </c:if>
    </form>
</body>
</html>