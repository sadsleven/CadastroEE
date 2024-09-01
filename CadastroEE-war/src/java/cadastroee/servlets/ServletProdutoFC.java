/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package cadastroee.servlets;
        

import java.io.IOException;
import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import cadatroee.controller.ProdutoFacadeLocal;
import cadastroee.model.Produto;
import java.util.List;

public class ServletProdutoFC extends HttpServlet {

    @EJB
    private ProdutoFacadeLocal facade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acao = request.getParameter("acao");
        String destino = "";

        switch (acao) {
            case "listar":
                destino = "ProdutoLista.jsp";
                break;
            case "incluir":
            case "alterar":
                destino = "ProdutoDados.jsp";
                break;
            default:
                // Caso não seja uma ação válida, redireciona para listar
                destino = "ProdutoLista.jsp";
        }

        try {
            switch (acao) {
                case "listar":
                    listarResultados(request);
                    break;
                case "incluir":
                    incluirProduto(request, acao);
                    if (request.getParameter("redirigir") != null) {
                        destino = "ServletProdutoFC?acao=listar";
                    }
                    break;
                case "excluir":
                    excluirProduto(request);
                    break;
                case "alterar":
                    alterarProduto(request, acao);
                    if (request.getParameter("redirigir") != null) {
                        destino = "ServletProdutoFC?acao=listar";
                    }
                    break;
            }
        } catch (Exception e) {
            request.setAttribute("mensagemErro", "Ocorreu um erro: " + e.getMessage());
        }
        
        RequestDispatcher dispatcher = request.getRequestDispatcher(destino);
        dispatcher.forward(request, response);
    }

    private void listarResultados(HttpServletRequest request) {
        List<Produto> produtos = facade.findAll();
        System.out.println("N produtos: " + produtos.size()); 
        request.setAttribute("produtos", produtos);
    }

    private void incluirProduto(HttpServletRequest request, String acao) {
        Produto produto = new Produto();
        request.setAttribute("acao", acao);
        produto.setNome(request.getParameter("nome"));
        produto.setQuantidade(Integer.parseInt(request.getParameter("quantidade")));
        produto.setPrecoVenda(Float.parseFloat(request.getParameter("precoVenda")));
        facade.create(produto);
    }

    private void alterarProduto(HttpServletRequest request, String acao) {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("acao", acao);
        Produto produto = facade.find(id);
        request.setAttribute("nomeproduto", produto.nome); 
        request.setAttribute("produto", produto); 
        produto.setNome(request.getParameter("nome"));
        produto.setQuantidade(Integer.parseInt(request.getParameter("quantidade")));
        produto.setPrecoVenda(Float.parseFloat(request.getParameter("precoVenda")));
        facade.edit(produto);
    }
    
    private void excluirProduto(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        Produto produto = facade.find(id);
        facade.remove(produto);
        listarResultados(request); 
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}