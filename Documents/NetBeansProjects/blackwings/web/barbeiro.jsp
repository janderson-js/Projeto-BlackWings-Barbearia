<%-- 
    Document   : administracao
    Created on : 07/06/2021, 13:06:32
    Author     : Janderson
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.AtendimentoDAO"%>
<%@page import="model.Atendimento"%>
<%@page import="model.Cliente"%>
<%@page import="model.Menu"%>
<%@page import="model.Funcionario"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>


<%
    Funcionario visitante = new Funcionario();
    try {
        String[] teste = session.getValueNames();
        if (teste[0] != null) {
            if (teste[0].equals("funcionario")) {
                visitante = (Funcionario) session.getAttribute("funcionario");
                if (visitante.getPerfil().getTitulo().equals("Atendente") || visitante.getPerfil().getTitulo().equals("Cliente")) {
                    response.sendRedirect("administracao.jsp");
                }
            } else {
                response.sendRedirect("index.jsp");
            }

        }
    } catch (Exception e) {
        response.sendRedirect("login_funcionario.jsp?msg=2");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Black Wings</title>
        <link rel="stylesheet" href="css/estilo.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    </head>
    <body>
        <header>  
            <div class="cont-nav">
                <%@include file="menu_nav.jsp"%>
            </div>
        </header>
        <main>
            <%                ArrayList<Atendimento> lista = new ArrayList<Atendimento>();
                ArrayList<Atendimento> listaAgendados = new ArrayList<Atendimento>();
                ArrayList<Atendimento> listaTodos = new ArrayList<Atendimento>();
                SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
                SimpleDateFormat df1 = new SimpleDateFormat("HH:mm:ss");
                try {
                    FuncionarioDAO fDAO = new FuncionarioDAO();
                    AtendimentoDAO aDAO = new AtendimentoDAO();
                    lista = fDAO.funcionarioServicoAguardando(visitante.getId());
                    listaAgendados = fDAO.funcionarioServicoAgendado(visitante.getId());
                    listaTodos = aDAO.listarAgendamentoAguardando();

                    if (visitante.getPerfil().getTitulo().equals("Gerente") || visitante.getPerfil().getTitulo().equals("Administrador")) {
            %>
            <h2>Serviços Agendados</h2>
            <div class="altara-100">
                <div class="tabela-branca">
                    <table class="table table-striped table table-bordered  table-hover" style="background-color: white;" id="tb-pequena">
                        <thead class="table-dark">
                            <tr>
                                <td><strong>Cliente</strong></td>
                                <td><strong>Serviço</strong></td>
                                <td><strong>Agendado</strong></td>
                                <td><strong>Status</strong></td>
                            </tr>
                        </thead>
                        <%
                            for (Atendimento a : listaTodos) {
                        %>

                        <tr>
                            <td><%=a.getCliente().getNome()%></td>
                            <td><%=a.getServico().getNome()%></td>
                            <td><%=df.format(a.getDataAgendamento()) + "</br>" + df1.format(a.getHoraAgendamento())%></td>
                            <td><%=a.getStatusAgendamento()%></td>
                        </tr>
                        <%
                            }
                        %>
                    </table>
                    <table class="table table-striped table table-bordered  table-hover" style="background-color: white;" id="tb-media">
                        <thead class="table-dark">
                            <tr>
                                <td><strong>Cliente</strong></td>
                                <td><strong>Serviço</strong></td>
                                <td><strong>Agendado</strong></td>
                                <td><strong>Status</strong></td>
                            </tr>
                        </thead>
                        <%
                            for (Atendimento a : listaTodos) {
                        %>

                        <tr>
                            <td><%=a.getCliente().getNome()%></td>
                            <td><%=a.getServico().getNome()%></td>
                            <td><%=df.format(a.getDataAgendamento()) + "</br>" + df1.format(a.getHoraAgendamento())%></td>
                            <td><%=a.getStatusAgendamento()%></td>
                        </tr>
                        <%
                            }
                        %>
                    </table>
                    <table class="table table-striped table table-bordered  table-hover" style="background-color: white;" id="tb-grande">
                        <thead class="table-dark">
                            <tr>
                                <td><strong>ID</strong></td>
                                <td><strong>Cliente</strong></td>
                                <td><strong>Serviço</strong></td>
                                <td><strong>Agendado</strong></td>
                                <td><strong>Funcionário</strong></td>
                                <td><strong>Status</strong></td>
                            </tr>
                        </thead>
                        <%
                            for (Atendimento a : listaTodos) {
                        %>

                        <tr> 
                            <td><%=a.getId()%></td>

                            <td><%=a.getCliente().getNome()%></td>
                            <td><%=a.getServico().getNome()%></td>
                            <td><%=df.format(a.getDataAgendamento()) + "</br>" + df1.format(a.getHoraAgendamento())%></td>
                            <td><%=a.getFuncionario().getNome()%></td>
                            <td><%=a.getStatusAgendamento()%></td>
                        </tr>
                        <%
                            }
                        %>
                    </table>
                </div>
            </div>

            <% } else if (!lista.isEmpty()) {


            %>


            <h2 id="h2-branco">Atendimentos Hoje</h2>

            <table class="table table-striped table table-bordered  table-hover" style="background-color: white;" id="tb-pequena">
                <thead class="table-dark">
                    <tr>
                        <td><strong>Cliente</strong></td>
                        <td><strong>Serviço</strong></td>
                        <td><strong>Agendado</strong></td>
                        <td><strong>Status</strong></td>
                    </tr>
                </thead>
                <%                    for (Atendimento a : lista) {
                %>
                <tr>
                    <td><%=a.getCliente().getNome()%></td>
                    <td><%=a.getServico().getNome()%></td>
                    <td><%=df.format(a.getDataAgendamento()) + "</br>" + df1.format(a.getHoraAgendamento())%></td>
                    <td><a href="#" id="botao-con" class="btn btn-success" onclick="confirmar('<%=a.getId()%>', '<%=a.getCliente().getNome()%>')">Realizado</a>
                        <a href="#" id="botao-c" class="btn btn-danger" onclick="cancelar('<%=a.getId()%>', '<%=a.getCliente().getNome()%>')">Cancelar</a></td>
                </tr>

                <% } %>

            </table>
            <table class="table table-striped table table-bordered  table-hover" style="background-color: white;" id="tb-media">
                <thead class="table-dark">
                    <tr>
                        <td><strong>Cliente</strong></td>
                        <td><strong>Serviço</strong></td>
                        <td><strong>Agendado</strong></td>
                        <td><strong>Status</strong></td>
                    </tr>
                </thead>
                <%                    for (Atendimento a : lista) {
                %>
                <tr>
                    <td><%=a.getCliente().getNome()%></td>
                    <td><%=a.getServico().getNome()%></td>
                    <td><%=df.format(a.getDataAgendamento()) + "</br>" + df1.format(a.getHoraAgendamento())%></td>
                    <td><a href="#"class="btn btn-success" onclick="confirmar('<%=a.getId()%>', '<%=a.getCliente().getNome()%>')">Confirmar Serviço</a><a href="#" class="btn btn-danger" onclick="cancelar('<%=a.getId()%>', '<%=a.getCliente().getNome()%>')">Cancelar</a></td>
                </tr>

                <% } %>

            </table>
        </table>
        <table class="table table-striped table table-bordered  table-hover" style="background-color: white;" id="tb-grande">
            <thead class="table-dark">
                <tr>
                    <td><strong>Cliente</strong></td>
                    <td><strong>Serviço</strong></td>
                    <td><strong>Agendado</strong></td>
                    <td><strong>Status</strong></td>
                </tr>
            </thead>
            <%                    for (Atendimento a : lista) {
            %>
            <tr>
                <td><%=a.getCliente().getNome()%></td>
                <td><%=a.getServico().getNome()%></td>
                <td><%=df.format(a.getDataAgendamento()) + "</br>" + df1.format(a.getHoraAgendamento())%></td>
                <td><a href="#"class="btn btn-success" onclick="confirmar('<%=a.getId()%>', '<%=a.getCliente().getNome()%>')">Confirmar Serviço</a><a href="#" class="btn btn-danger" onclick="cancelar('<%=a.getId()%>', '<%=a.getCliente().getNome()%>')">Cancelar</a></td>
            </tr>

            <% } %>

        </table>
        <%
            }
            if (!listaAgendados.isEmpty() && visitante.getPerfil().getTitulo().equals("Barbeiro")) {%>
        <h2 id="h2-branco">Atendimentos  Futuros</h2>

        <table class="table table-striped table table-bordered  table-hover" style="background-color: white;" id="tb-pequena">
            <thead class="table-dark">
                <tr>
                    <td><strong>Cliente</strong></td>
                    <td><strong>Serviço</strong></td>
                    <td><strong>Agendado</strong></td>
                    <td><strong>Status</strong></td>
                </tr>
            </thead>
            <%
                for (Atendimento a : listaAgendados) {
            %>
            <tr>
                <td><%=a.getCliente().getNome()%></td>
                <td><%=a.getServico().getNome()%></td>
                <td><%=df.format(a.getDataAgendamento()) + "</br>" + df1.format(a.getHoraAgendamento())%></td>
                <td><%=a.getStatusAgendamento()%></td>
            </tr>
            <%
                }
            %>
        </table>
        <table class="table table-striped table table-bordered  table-hover" style="background-color: white;" id="tb-media">
            <thead class="table-dark">
                <tr>
                    <td><strong>Cliente</strong></td>
                    <td><strong>Serviço</strong></td>
                    <td><strong>Agendado</strong></td>
                    <td><strong>Status</strong></td>
                </tr>
            </thead>
            <%
                for (Atendimento a : listaAgendados) {
            %>
            <tr>
                <td><%=a.getCliente().getNome()%></td>
                <td><%=a.getServico().getNome()%></td>
                <td><%=df.format(a.getDataAgendamento()) + "</br>" + df1.format(a.getHoraAgendamento())%></td>
                <td><%=a.getStatusAgendamento()%></td>
            </tr>
            <%
                }
            %>
        </table>
        <table class="table table-striped table table-bordered  table-hover" style="background-color: white;" id="tb-grande">
            <thead class="table-dark">
                <tr>
                    <td><strong>Cliente</strong></td>
                    <td><strong>Serviço</strong></td>
                    <td><strong>Agendado</strong></td>
                    <td><strong>Status</strong></td>
                </tr>
            </thead>
            <%
                for (Atendimento a : listaAgendados) {
            %>
            <tr>
                <td><%=a.getCliente().getNome()%></td>
                <td><%=a.getServico().getNome()%></td>
                <td><%=df.format(a.getDataAgendamento()) + "</br>" + df1.format(a.getHoraAgendamento())%></td>
                <td><%=a.getStatusAgendamento()%></td>
            </tr>
            <%
                }
            %>
        </table>

        <%}%>




    </div>

    <%
        } catch (Exception e) {

        }
    %>
</main>
<footer>
    <%@include file="footer.jsp" %>
</footer>
</body>
<script>
    function confirmar(id, nome) {
        if (confirm("Confirmar o serviço de : " + nome + "?")) {
            window.open("confirmar_realizacao_servico.do?id=" + id, "_self");
        }
    }
    function cancelar(id, nome) {
        if (confirm("Cancelar o serviço de :" + nome + "?")) {
            window.open("cancelar_agendamento.do?id=" + id, "_self");
        }
    }
</script>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

</html>
