<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <meta charset="UTF-8">
    <title>Listagem de Produtos</title>
    <style>

    </style>
</head>
<body class="container">
    <h1>Listagem de Produtos</h1>
    
    <a href="${pageContext.request.contextPath}/ServletProdutoFC?acao=incluir"
       class="btn  btn-primary m-2">Novo Produto</a>

       <table class="table table-striped">
        <tr class="table-dark">
            <th>#</th>
            <th>Nome</th>
            <th>Quantidade</th>
            <th>Preço de Venda</th>
            <th>Opções</th>
        </tr>
        
        <c:forEach var="produto" items="${produtos}">
            <tr>
                <td>${produto.idProduto}</td>
                <td>${produto.nome}</td>
                <td>${produto.quantidade}</td>
                <td>R$ ${produto.precoVenda}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/ServletProdutoFC?acao=alterar&id=${produto.idProduto}"
                       class="btn btn-primary  btn-sm">Alterar</a>
                    
                    <a href="${pageContext.request.contextPath}/ServletProdutoFC?acao=excluir&id=${produto.idProduto}"
                       onclick="return confirm('Tem certeza que deseja excluir esse produto?')" class="btn btn-danger btn-sm"
                       >Excluir</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>