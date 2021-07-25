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
import model.AtendimentoDAO;
import model.Cliente;
import model.Funcionario;

/**
 *
 * @author Janderson
 */
public class CancelarAgendamento extends HttpServlet {

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
            out.println("<title>Servlet CancelarAgendamento</title>");
            out.println("</head>");
            out.println("<body>");
            try {
                String[] user = session.getValueNames();
                Funcionario f = new Funcionario();
                Cliente c = new Cliente();
                int id = Integer.parseInt(request.getParameter("id"));
                if (user[0].equals("funcionario")) {
                    f = (Funcionario) session.getAttribute("funcionario");
                    AtendimentoDAO aDAO = new AtendimentoDAO();
                    aDAO.concelarAgendamento(id);
                    if (f.getPerfil().getTitulo().equals("Atendente") || f.getPerfil().getTitulo().equals("Gerente") ||  f.getPerfil().getTitulo().equals("Administrador")) {
                        response.sendRedirect("agendamento.jsp");
                    } else {
                        response.sendRedirect("barbeiro.jsp");
                    }
                } else if (user[0].equals("cliente")) {
                    c = (Cliente) session.getAttribute("cliente");
                    AtendimentoDAO aDAO = new AtendimentoDAO();
                    aDAO.concelarAgendamento(id);
                    response.sendRedirect("agendamento_cliente.jsp");
                }

            } catch (Exception e) {
                out.print("Erro ao cancelar : " + e);
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
