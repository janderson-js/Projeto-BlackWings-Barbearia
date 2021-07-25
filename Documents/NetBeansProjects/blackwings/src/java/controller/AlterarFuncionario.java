/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Funcionario;
import model.FuncionarioDAO;
import model.Perfil;

/**
 *
 * @author Janderson
 */
public class AlterarFuncionario extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AlterarFuncionario</title>");
            out.println("</head>");
            out.println("<body>");
            try {
                int id = Integer.parseInt(request.getParameter("id"));

                if (id == 1) {
                    String nome = request.getParameter("nome");
                    String matricula = request.getParameter("matricula");
                    String senha = request.getParameter("senha");
                    
                    Funcionario f = new Funcionario();
                    FuncionarioDAO fDAO = new FuncionarioDAO();
         
                    f.setNome(nome);
                    f.setMatricula(matricula);
                    f.setSenha(senha);
                    f.setId(id);
                    
                    fDAO.alterarAdmin(f);
                    response.sendRedirect("administracao.jsp");
                } else {
                    String nome = request.getParameter("nome");
                    int idPerfil = Integer.parseInt(request.getParameter("perfil"));
                    String matricula = request.getParameter("matricula");
                    String senha = request.getParameter("senha");
                    String telefoneContato = request.getParameter("telefoneContato");
                    String telefone = request.getParameter("telefone");
                    String cep = request.getParameter("cep");
                    String cidade = request.getParameter("cidade");
                    String bairro = request.getParameter("bairro");
                    String endereco = request.getParameter("endereco");
                    String casa = request.getParameter("casa");
                    String dataNas1 = request.getParameter("dataNas");
                    String dataCon1 = request.getParameter("dataCon");
                    String dataVal1 = request.getParameter("dataVal");

                    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

                    Funcionario f = new Funcionario();
                    FuncionarioDAO fDAO = new FuncionarioDAO();
                    Perfil p = new Perfil();

                    Date data1 = df.parse(dataNas1);
                    String dataN = df.format(data1);
                    Timestamp dataNas = Timestamp.valueOf(dataN + " 00:00:00");

                    Date data2 = df.parse(dataCon1);
                    String dataC = df.format(data2);
                    Timestamp dataCon = Timestamp.valueOf(dataC + " 00:00:00");

                    Date data3 = df.parse(dataVal1);
                    String dataV = df.format(data3);
                    Timestamp dataVal = Timestamp.valueOf(dataV + " 00:00:00");

                    p.setId(idPerfil);

                    f.setId(id);
                    f.setNome(nome);
                    f.setPerfil(p);
                    f.setMatricula(matricula);
                    f.setSenha(senha);
                    f.setTelefoneContato(telefoneContato);
                    f.setTelefone(telefone);
                    f.setCep(cep);
                    f.setCidade(cidade);
                    f.setBairro(bairro);
                    f.setEndereco(endereco);
                    f.setCasa(casa);
                    f.setDataNascimento(dataNas);
                    f.setDataContrato(dataCon);
                    f.setDataFinalContrato(dataVal);

                    fDAO.alterarFuncionario(f);
                }

                response.sendRedirect("listar_funcionario.jsp");

            } catch (Exception e) {
                out.print("Erro alterar funcionario:" + e);
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
