/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cliente;
import model.ClienteDAO;
import model.Funcionario;

/**
 *
 * @author Janderson
 */
public class InserirCliente extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet InserirCliente</title>");
            out.println("</head>");
            out.println("<body>");
            try {
                String nome = request.getParameter("nome");
                String cpf = request.getParameter("cpf");
                String senha = request.getParameter("senha");
                String telefoneContato = request.getParameter("telefoneContato");
                String termos = request.getParameter("termos");
                String telefone = "";

                if (request.getParameter("telefone") != null) {
                    telefone = "n�o informado";
                } else {      
                    telefone = request.getParameter("telefone");
                }

                Cliente c = new Cliente();

                c.setNome(nome);
                c.setCpf(cpf);
                c.setSenha(senha);
                c.setTelefoneContato(telefoneContato);
                c.setTelefone(telefone);
                c.setTermos(termos);

                ClienteDAO cDAO = new ClienteDAO();
                cDAO.inserirCliente(c);
                if (session.getAttribute("funcionario") != null){
                    response.sendRedirect("listar_cliente.jsp");
                } else {
                    response.sendRedirect("login_cliente.jsp");
                }
            } catch (Exception e) {
                out.println("Erro Servlet Inserir : " + e);
            }
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}