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
import javax.servlet.http.HttpSession;
import model.Atendimento;
import model.AtendimentoDAO;
import model.Cliente;
import model.Funcionario;
import model.FuncionarioDAO;
import model.Servico;
import model.ServicoDAO;

/**
 *
 * @author Janderson
 */
public class GerenciarAgendamento extends HttpServlet {

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
        HttpSession session = request.getSession();
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            try {
                String etapa = request.getParameter("etapa");

                Atendimento agendamento = new Atendimento();
                agendamento = (Atendimento) session.getAttribute("agendamento");

                if (etapa.equals("1")) {
                    int idServico = Integer.parseInt(request.getParameter("servico"));
                    ServicoDAO sDAO = new ServicoDAO();
                    agendamento.setServico(sDAO.carregarPorId(idServico));
                    session.setAttribute("agendamento", agendamento);
                    response.sendRedirect("funcionario.jsp?id=" + idServico);
                } else if (etapa.equals("2")) {
                    int idFuncionario = Integer.parseInt(request.getParameter("funcionario"));
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    Date data1 = sdf.parse(request.getParameter("data"));
                    String data = sdf.format(data1);
                    Timestamp dataFormatada = Timestamp.valueOf(data+" 00:00:00");
                    FuncionarioDAO fDAO = new FuncionarioDAO();
                    agendamento.setFuncionario(fDAO.carregarPorId(idFuncionario));
                    agendamento.setDataAgendamento(dataFormatada);
                    session.setAttribute("agendamento", agendamento);
                    response.sendRedirect("horario_funcionario.jsp?id=" + idFuncionario + "&" + dataFormatada);
                } else if (etapa.equals("3")) {
                    String pagamento = request.getParameter("pagamento");
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                    
                    String teste = df.format(agendamento.getDataAgendamento());
                    Date hora1 = sdf.parse(teste+" "+request.getParameter("horario"));
                    
                    String hora = sdf.format(hora1.getTime());
                    Timestamp horaFormatada = Timestamp.valueOf(hora);
                    
                    agendamento.setHoraAgendamento(horaFormatada);
                    agendamento.setFormaPagamento(pagamento);
                    session.setAttribute("agendamento", agendamento); 
                    response.sendRedirect("resumo_atendimento.jsp");
                } else if(etapa.equals("4")){
                    Atendimento a = new Atendimento();
                    Cliente c = new Cliente();
                    Funcionario f = new Funcionario();
                    Servico s = new Servico();
                    
                    c.setId(agendamento.getCliente().getId());
                    f.setId(agendamento.getFuncionario().getId());
                    s.setId(agendamento.getServico().getId());
                    
                    a.setCliente(c);
                    a.setServico(s);
                    a.setFuncionario(f);
                    a.setValorAgendamento(agendamento.getServico().getValor());
                    a.setDataAgendamento(agendamento.getDataAgendamento());
                    a.setHoraAgendamento(agendamento.getHoraAgendamento());
                    a.setFormaPagamento(agendamento.getFormaPagamento());
                    a.setStatusAgendamento("Agendado");
                    
                    AtendimentoDAO aDAO = new AtendimentoDAO();
                    aDAO.inserirAtendimento(a);
                    String[] user = session.getValueNames();
                    if(user[0].equals("cliente")){
                        response.sendRedirect("agendamento_cliente.jsp");
                    }else{
                        response.sendRedirect("agendamento.jsp");
                    }
                }

            } catch (Exception e) {
                out.print("Erro gerenciar_agendamento.do: " + e);
            }
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GerenciarAgendamento at " + request.getContextPath() + "</h1>");
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
