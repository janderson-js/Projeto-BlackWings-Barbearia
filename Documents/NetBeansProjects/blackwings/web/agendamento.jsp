<%-- 
    Document   : meu_agendamento
    Created on : 14/06/2021, 21:26:52
    Author     : Janderson
--%>

<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Atendimento"%>
<%@page import="model.AtendimentoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    Funcionario visitante = new Funcionario();
    try {
        String[] teste = session.getValueNames();
        if (teste[0] != null) {
            if (teste[0].equals("funcionario")) {
                visitante = (Funcionario) session.getAttribute("funcionario");
                if (visitante.getPerfil().getTitulo().equals("Barbeiro")) {
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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
    </head>
    <body>
        <header id="top" class="top-header">
            <div class="cont-nav">
                <%@include file="menu_nav.jsp"%>
            </div>
        </header>
        <main >
            <h2>Agendamentos</h2>
            <div class="nav-atendimento">
                <div class="btn-group"   >
                    <button id="botao" class="btn btn-secondary btn-lg dropdown-toggle" style="background-color: black;"  type="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Menu Agendamento
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="agendamento.jsp">Todos os Agendamentos</a></li>
                        <li><a class="dropdown-item" href="agendamento.jsp?op=1">Agendamentos Cancelados</a></li>
                        <li><a class="dropdown-item" href="agendamento.jsp?op=4">Agendamentos Realizados</a></li>
                        <li><a class="dropdown-item" href="agendamento.jsp?op=3">Agendamentos Pagos</a></li>
                        <li><a class="dropdown-item" href="agendamento.jsp?op=2">Agendamentos Aguardando</a></li>
                    </ul>
                </div>
                <a href="listar_cliente.jsp" id="btnNovo">Novo agendamento</a>
                <div class="busca">
                    <form method="post" id="form-busca" action="agendamento.jsp?op=5">
                        <table>
                            <tr>
                                <td><span>Buscar Por CPF:</span></td>
                                <td><input type="text" name="cpf" id="cpf" placeholder="ex: 000.000.000-00"></td>
                                <td><button type="submit" ><i class="fas fa-search"></i></button>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
            <div class="conteudo-agendamento">
                <div class="tabela-branca">
                    <%                    ArrayList<Atendimento> lista = new ArrayList<Atendimento>();
                        AtendimentoDAO aDAO = new AtendimentoDAO();
                        int op = 0;
                        int ct = 0;
                        try {
                            op = Integer.parseInt(request.getParameter("op"));
                            if (op == 1) {
                                lista = aDAO.listarAgendamentoCancelado();
                            } else if (op == 2) {
                                lista = aDAO.listarAgendamentoAguardando();
                            } else if (op == 3) {
                                lista = aDAO.listatAgendamentoPago();
                            } else if (op == 4) {
                                lista = aDAO.listarServicoRealizado();
                            } else if (op == 5) {
                                String cpf = request.getParameter("cpf");
                                if (cpf != null && !cpf.equals("")) {
                                    lista = aDAO.buscarAgendamentoCliente(cpf);
                                } else {
                                    lista = aDAO.listar();
                                }
                            }

                        } catch (Exception e) {
                            lista = aDAO.listar();
                            ct = 1;
                        }
                        for (Atendimento b : lista) {
                            ct++;
                        }
                        if (!lista.isEmpty()) {
                    %>
                    <table class="table table-striped table table-bordered  table-hover" style="background-color: white;" class="centralizar" id="tb-grande">
                        <thead class="table-dark">
                        <td ><strong>NOME</strong></td>
                        <td ><strong>TELEFONE</strong></td>
                        <td ><strong>SERVIÇO</strong></td>                      
                        <td ><strong>FUNCIONARIO</strong></td>   
                        <td ><strong>FORMA DE PAG.</strong></td>
                        <td ><strong>VALOR</strong></td>
                        <td ><strong>AGENDADO</strong></td>
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
                            <td><%=a.getFuncionario().getNome()%></td>
                            <td><%=a.getFormaPagamento()%></td>
                            <td><%=nf.format(a.getValorAgendamento())%></td>
                            <td><%=df.format(a.getDataAgendamento()) + " </br>às " + df1.format(a.getHoraAgendamento())%></td>
                            <td>         
                                <%
                                    if (a.getStatusAgendamento().equals("Realizado")) {%>
                                <a href="#"class="btn btn-success" id="botao-con" onclick="confirmarPagamento('<%=a.getId()%>', '<%=a.getCliente().getNome()%>')">Confirmar Pag.</a>
                                <%} else if (a.getStatusAgendamento().equals("Cancelado")) {%>
                                <a title="Excluir Agendamento" href="#" onclick="excluir('<%=a.getId()%>', '<%=a.getCliente().getNome()%>')"><img src="img/excluir.png"/></a>
                                    <% } else if (a.getStatusAgendamento().equals("Aguardando")) {%>
                                <a href="#" id="botao-c" class="btn btn-danger" onclick="cancelar('<%=a.getId()%>', '<%=a.getCliente().getNome()%>')">Cancelar</a>
                                <%} else {%>
                                <a title="Agendamendo pago" href="#"><img src="img/check.png"></a>
                                    <%}%>
                            </td>
                        </tr>            


                        <% }%>
                    </table>
                    <table class="table table-striped table table-bordered  table-hover" style="background-color: white;"  id="tb-media">
                        <thead class="table-dark">
                        <td ><strong>NOME</strong></td>
                        <td ><strong>TELEFONE</strong></td>
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
                            <td><%=nf.format(a.getValorAgendamento())%></td>
                            <td><%=df.format(a.getDataAgendamento()) + " </br>às " + df1.format(a.getHoraAgendamento())%></td>
                            <td>         
                                <%
                                    if (a.getStatusAgendamento().equals("Realizado")) {%>
                                <a href="#"class="btn btn-success" id="botao-con" onclick="confirmarPagamento('<%=a.getId()%>', '<%=a.getCliente().getNome()%>')">Confirmar Pag.</a>
                                <%} else if (a.getStatusAgendamento().equals("Cancelado")) {%>
                                <a href="#" onclick="excluir('<%=a.getId()%>', '<%=a.getCliente().getNome()%>')"><img src="img/excluir.png"/></a>
                                    <% } else if (a.getStatusAgendamento().equals("Aguardando")) {%>
                                <a href="#" id="botao-c" class="btn btn-danger" onclick="cancelar('<%=a.getId()%>', '<%=a.getCliente().getNome()%>')">Cancelar</a>
                                <%} else {%>
                                <a href="#"><img src="img/check.png"></a>
                                    <%}%>
                            </td>
                        </tr>            


                        <% }%>
                    </table>
                    <table class="table table-striped table table-bordered  table-hover" style="background-color: white;width: 100%;"  id="tb-pequena">
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
                            <td><%=df.format(a.getDataAgendamento()) + " </br>às " + df1.format(a.getHoraAgendamento())%></td>
                            <td>         
                                <%
                                    if (a.getStatusAgendamento().equals("Realizado")) {%>
                                <a href="#"class="btn btn-success" id="botao-con" onclick="confirmarPagamento('<%=a.getId()%>', '<%=a.getCliente().getNome()%>')">Confirmar Pag.</a>
                                <%} else if (a.getStatusAgendamento().equals("Cancelado")) {%>
                                <a href="#" onclick="excluir('<%=a.getId()%>', '<%=a.getCliente().getNome()%>')"><img src="img/excluir.png"/></a>
                                    <% } else if (a.getStatusAgendamento().equals("Aguardando")) {%>
                                <a href="#" id="botao-c" class="btn btn-danger" onclick="cancelar('<%=a.getId()%>', '<%=a.getCliente().getNome()%>')">Cancelar</a>
                                <%} else {%>
                                <a href="#"><img src="img/check.png"></a>
                                    <%}%>
                            </td>
                        </tr>            


                        <% }%>
                    </table>
                    <%} else {%>
                    <p>Sem nenhum Registro no momento</p>
                    <%}%>

                </div>
            </div>
        </main>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
        <script>
            function confirmarPagamento(id, nome) {
                if (confirm("Confirmar o serviço de : " + nome + "?")) {
                    window.open("confirmar_pagamento.do?id=" + id, "_self");
                }
            }
            function excluir(id, nome) {
                if (confirm("Tem certeza que quer excluir o Agendamento Do: " + nome + "?")) {
                    window.open("excluir_agendamento.do?id=" + id, "_self");
                }
            }
            function cancelar(id, nome) {
                if (confirm("Cancelar o serviço de :" + nome + "?")) {
                    window.open("cancelar_agendamento.do?id=" + id, "_self");
                }
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/cleave.js@1.6.0/dist/cleave.min.js"></script>
        <script>
            new Cleave('#cpf', {
                blocks: [3, 3, 3, 2],
                delimiters: ['.', '.', '-'],
                numericOnly: true
            });
        </script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

    </body>
</html>
