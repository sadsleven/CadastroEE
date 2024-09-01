<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Listagem de Produtos</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: center;
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
    <h1>Listagem de Produtos</h1>
    
    <a href="${pageContext.request.contextPath}/ServletProdutoFC?acao=incluir"
       class="btn">Novo Produto</a>

    <table>
        <tr>
            <th>ID</th>
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
                    <a href="${pageContext.request.contextPath}/ServletProdutoFC?acao=alterar&id=${produto.idProduto}">Alterar</a>
                    | 
                    <a href="${pageContext.request.contextPath}/ServletProdutoFC?acao=excluir&id=${produto.idProduto}"
                       onclick="return confirm('Tem certeza que deseja excluir esse produto?')">Excluir</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>