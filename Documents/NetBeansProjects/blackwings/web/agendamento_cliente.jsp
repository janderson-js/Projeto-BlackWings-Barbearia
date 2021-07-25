<%-- 
    Document   : agendamento_cliente
    Created on : 19/06/2021, 19:02:05
    Author     : Janderson
--%>

<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.AtendimentoDAO"%>
<%@page import="model.Atendimento"%>
<%@page import="model.Atendimento"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    try {
        String[] teste = session.getValueNames();
        if (teste[0] != null) {
            if (teste[0].equals("funcionario") || teste[0].equals("cliente")) {
                if (teste[0].equals("funcionario")) {
                    Funcionario visitante = new Funcionario();
                    visitante = (Funcionario) session.getAttribute("funcionario");
                    if (visitante.getPerfil().getTitulo().equals("Barbeiro")) {
                        response.sendRedirect("administracao.jsp");
                    }
                }
            } else {
                response.sendRedirect("index.jsp");
            }
        }
    } catch (Exception e) {
        response.sendRedirect("login_cliente.jsp?msg=3");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Black Wings</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/estilo.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    </head>
    <body>
        <header id="top" class="top-header">
            <div class="cont-nav">
                <%@include file="menu_nav.jsp"%>
            </div>
        </header>
        <main>

            <%  Cliente c = new Cliente();
                c = (Cliente) session.getAttribute("cliente");
                int idCliente = 0;
                ArrayList<Atendimento> lista = new ArrayList<Atendimento>();
                try {
                    Atendimento a = new Atendimento();
                    c = (Cliente) session.getAttribute("cliente");
                    idCliente = c.getId();
                    AtendimentoDAO aDAO = new AtendimentoDAO();
                    lista = aDAO.listarMeusAgendamentos(idCliente);

                } catch (Exception e) {
                    out.print("Erro: " + e);
                }%>
            <h2>Menus agendamentos</h2>
            <div class="nav-atendimento">
                <a href="servico.jsp?id=<%=idCliente%>" id="btnNovo">Novo agendamento</a>
            </div>
            <div class="conteudo-agendamento">
                <div class="tabela-branca">
                    <%
                        if (!lista.isEmpty()) {%>
                    <table class="table table-striped table table-bordered  table-hover" style="background-color: white;" id="tb-grande">
                        <thead class="table-dark">
                        <td ><strong>NOME</strong></td>
                        <td ><strong>TELEFONE</strong></td>
                        <td><strong>Serviço</strong></td>
                        <td ><strong>Valor</strong></td>
                        <td ><strong>Agendado</strong></td>
                        <td ><strong>Forma de Pag.</strong></td>
                        <td ><strong>OPÇÕES</strong></td>
                        </thead>
                        <%
                            SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
                            SimpleDateFormat df1 = new SimpleDateFormat("HH:mm:ss");
                            NumberFormat nf = NumberFormat.getCurrencyInstance();
                            for (Atendimento a : lista) {
                        %>

                       
                            <tr>

                                <td><%=a.getCliente().getNome()%></td>
                                <td><%=a.getCliente().getTelefoneContato()%></td>
                                <td><%=a.getServico().getNome()%></td>   
                                <td><%=nf.format(a.getValorAgendamento())%></td>
                                <td><%=df.format(a.getDataAgendamento()) + "</br>" + df1.format(a.getHoraAgendamento())%></td>
                                <td><%=a.getFormaPagamento()%></td>
                                <td>         
                                    <%
                                        if (a.getStatusAgendamento().equals("Realizado")) {%>
                                    <a href="#"class="btn btn-warning">Aguardando Pagamento</a>
                                    <%} else if (a.getStatusAgendamento().equals("Cancelado")) {%>
                                    <a title="Excluir Agendamento" href="#" onclick="excluir('<%=a.getId()%>', '<%=a.getCliente().getNome()%>')"><img src="img/excluir.png"/></a>
                                        <% } else if (a.getStatusAgendamento().equals("Aguardando")) {%>
                                    <a href="#" class="btn btn-danger" onclick="cancelar('<%=a.getId()%>', '<%=a.getCliente().getNome()%>')">Cancelar</a>
                                    <%} else {%>
                                    <a title="Agendamento Pago" href="#"><img src="img/check.png"></a>
                                        <%}%>
                                </td>
                            </tr>            
                            <%
                                }
                            %>
                        
                    </table>
                    <table class="table table-striped table table-bordered  table-hover" style="background-color: white;" id="tb-media">
                        <thead class="table-dark">
                        <td ><strong>NOME</strong></td>
                        <td ><strong>TELEFONE</strong></td>
                        <td><strong>Serviço</strong></td>
                        <td ><strong>Valor</strong></td>
                        <td ><strong>Agendado</strong></td>
                        <td ><strong>OPÇÕES</strong></td>
                        </thead>
                        <%
                            for (Atendimento a : lista) {
                        %>

                       
                            <tr>
                                <td><%=a.getCliente().getNome()%></td>
                                <td><%=a.getCliente().getTelefoneContato()%></td>
                                <td><%=a.getServico().getNome()%></td>   
                                <td><%=nf.format(a.getValorAgendamento())%></td>
                                <td><%=df.format(a.getDataAgendamento()) + "</br>" + df1.format(a.getHoraAgendamento())%></td>
                                <td>         
                                    <%
                                        if (a.getStatusAgendamento().equals("Realizado")) {%>
                                    <a href="#"class="btn btn-warning">Aguardando Pagamento</a>
                                    <%} else if (a.getStatusAgendamento().equals("Cancelado")) {%>
                                    <a href="#" onclick="excluir('<%=a.getId()%>', '<%=a.getCliente().getNome()%>')"><img src="img/excluir.png"/></a>
                                        <% } else if (a.getStatusAgendamento().equals("Aguardando")) {%>
                                    <a href="#" class="btn btn-danger" onclick="cancelar('<%=a.getId()%>', '<%=a.getCliente().getNome()%>')">Cancelar</a>
                                    <%} else {%>
                                    <a href="#"><img src="img/check.png"></a>
                                        <%}%>
                                </td>
                            </tr>            
                            <%
                                }
                            %>
                        
                    </table>
                    <table class="table table-striped table table-bordered  table-hover" style="background-color: white;" id="tb-pequena">
                        <thead class="table-dark">
                        <td ><strong>NOME</strong></td>
                        <td ><strong>Valor</strong></td>
                        <td ><strong>Agendado</strong></td>
                        <td ><strong>OPÇÕES</strong></td>
                        </thead>
                        <%
                            for (Atendimento a : lista) {
                        %>


                        <tr>
                            <td><%=a.getCliente().getNome()%></td> 
                            <td><%=nf.format(a.getValorAgendamento())%></td>
                            <td><%=df.format(a.getDataAgendamento()) + "</br>" + df1.format(a.getHoraAgendamento())%></td>
                            <td>         
                                <%
                                        if (a.getStatusAgendamento().equals("Realizado")) {%>
                                <a href="#"class="btn btn-warning">Aguardando Pagamento</a>
                                <%} else if (a.getStatusAgendamento().equals("Cancelado")) {%>
                                <a href="#" onclick="excluir('<%=a.getId()%>', '<%=a.getCliente().getNome()%>')"><img src="img/excluir.png"/></a>
                                    <% } else if (a.getStatusAgendamento().equals("Aguardando")) {%>
                                <a href="#" class="btn btn-danger" onclick="cancelar('<%=a.getId()%>', '<%=a.getCliente().getNome()%>')">Cancelar</a>
                                <%} else {%>
                                <a href="#"><img src="img/check.png"></a>
                                    <%}%>
                            </td>
                        </tr>            
                        <%
                            }
                        %>

                    </table>
                    <%} else {%>
                    <p>Sem registro até o momento!!</p>
                    <%}

                    %>
                </div>
            </div>
        </main>
        <footer>
            <%@include file="footer.jsp"%>
        </footer>
        <script>
            function excluir(id, nome) {
                if (confirm("Tem certeza que quer excluir o servico:" + nome + "?")) {
                    window.open("excluir_agendamento.do?id=" + id, "_self");
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
    </body>
</html>