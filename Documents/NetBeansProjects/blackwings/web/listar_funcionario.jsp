<%-- 
    Document   : listar_funcionario
    Created on : 02/06/2021, 11:30:09
    Author     : Janderson
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.FuncionarioDAO"%>
<%@page import="model.Funcionario"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<%
    Funcionario visitante = new Funcionario();
    try {
        String[] teste = session.getValueNames();
        if (teste[0] != null) {
            if (teste[0].equals("funcionario")) {
                visitante = (Funcionario) session.getAttribute("funcionario");
                if (visitante.getPerfil().getTitulo().equals("Barbeiro") || visitante.getPerfil().getTitulo().equals("Atendente")) {
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
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/estilo.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <header id="top" class="top-header">
            <div class="cont-nav">
                <%@include file="menu_nav.jsp"%>
            </div>
        </header>
        <main>
            <h2>Listar Funcionario</h2>
            <div class="nav-atendimento">
                <a href="form_inserir_funcionario.jsp" id="btnNovo">Cadastrar Funcionário</a>
                <a href="listar_funcionario.jsp?op=1" id="btnNovo">Listar Inativos</a>
                <a href="listar_funcionario.jsp" id="btnNovo">Listar Ativos</a>
                <div class="busca">
                    <form method="post" id="form-busca" action="listar_funcionario.jsp?op=2">
                        <table>
                            <tr>
                                <td><span>Buscar Por Matricula:</span></td>
                                <td><input type="text" placeholder="Ex: 302000" name="matricula"></td>
                                <td><button type="submit" ><i class="fas fa-search"></i></button>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
            <div class="altara-100">
                <div class="tabela-branca">
                    <%                        ArrayList<Funcionario> lista = new ArrayList<Funcionario>();
                        FuncionarioDAO fDAO = new FuncionarioDAO();
                        int ct = 0;
                        try {
                            int op = Integer.parseInt(request.getParameter("op"));
                            if (op == 1) {
                                lista = fDAO.listarInativo();
                                ct = 3;
                            } else if (op == 2) {
                                String matricula = request.getParameter("matricula");
                                if (matricula != null && !matricula.equals("")) {
                                    lista = fDAO.buscarFuncionario(matricula);
                                    ct = 2;
                                } else {
                                    lista = fDAO.listar();
                                }
                            }
                        } catch (Exception e) {
                            lista = fDAO.listar();
                            ct = 1;
                        }

                        SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
                        if (ct != 0) {
                    %>
                    <table class="table table-striped table table-bordered  table-hover" style="background-color: white;" id="tb-pequena">
                        <thead class="table-dark">
                        <td ><strong>NOME</strong></td>
                        <td ><strong>PERFIL</strong></td>
                        <td ><strong>TEL-CONTATO</strong></td>
                        <td ><strong>OPÇÕES</strong></td>
                        </thead>
                        <%
                            for (Funcionario f : lista) {
                                String dataSaida;
                                if (f.getDataSaida() != null) {
                                    dataSaida = df.format(f.getDataSaida());
                                } else {
                                    dataSaida = "vazio";
                                }
                                ct++;
                        %>
                        <tr>
                            <td><%=f.getNome()%></td>
                            <td><%=f.getPerfil().getTitulo()%></td>
                            <td><%=f.getTelefoneContato()%></td>
                            <td>
                                <%

                                    String img_situacao = "visivel";
                                    String op1 = "Inativo";
                                    String title = "Desativar Usuário";
                                    if (!f.getStatus().equals("Ativo")) {
                                        img_situacao = "invisivel";
                                        op1 = "Ativo";
                                        title = "Ativar Usuário";
                                    }

                                %>
                                <a title="Alterar Dados Funcionário" href="form_alterar_funcionario.jsp?id=<%=f.getId()%>"><img src="img/alterar.png" /></a>
                                <a title="Dados Do Funcionário" href="dados_funcionario.jsp?id=<%=f.getId()%>"><img src="img/meusDados.png" /></a> 
                                <a title="Excluir Funcionário" href="#" onclick="excluir(<%=f.getId()%>, '<%=f.getNome()%>')" ><img src="img/excluir.png" /></a>
                                <a title="Status" href="alterar_status.do?id=<%=f.getId()%>&op=<%=op1%>"><img src="img/<%=img_situacao%>.png" /></a> 
                                    <%
                                        if (f.getPerfil().getTitulo().equals("Barbeiro")) {%>
                                <a title="Vincular Serviço" href="form_gerenciar_funcionario_servico.jsp?id=<%=f.getId()%>"><img src="img/servico.png" /></a>  
                                    <% }
                                    %>  
                            </td>
                        </tr> 
                        <%
                            }%>
                    </table>
                     <table class="table table-striped table table-bordered  table-hover" style="background-color: white;" id="tb-media">
                        <thead class="table-dark">
                        <td><strong>ID</strong></td>
                        <td ><strong>NOME</strong></td>
                        <td ><strong>PERFIL</strong></td>
                        <td ><strong>TEL-CONTATO</strong></td>
                        <td ><strong>STATUS</strong></td>
                        <td ><strong>OPÇÕES</strong></td>
                        </thead>
                        <%
                            for (Funcionario f : lista) {
                                String dataSaida;
                                if (f.getDataSaida() != null) {
                                    dataSaida = df.format(f.getDataSaida());
                                } else {
                                    dataSaida = "vazio";
                                }
                                ct++;
                        %>
                        <tr>
                            <td><%=f.getId()%></td>
                            <td><%=f.getNome()%></td>
                            <td><%=f.getPerfil().getTitulo()%></td>
                            <td><%=f.getTelefoneContato()%></td>
                            <td><%=f.getStatus()%></td>
                            <td>
                                <%

                                    String img_situacao = "visivel";
                                    String op1 = "Inativo";
                                    String title = "Desativar Usuário";
                                    if (!f.getStatus().equals("Ativo")) {
                                        img_situacao = "invisivel";
                                        op1 = "Ativo";
                                        title = "Ativar Usuário";
                                    }

                                %>
                                 <a title="Alterar Dados Funcionário" href="form_alterar_funcionario.jsp?id=<%=f.getId()%>"><img src="img/alterar.png" /></a>
                                <a title="Dados Do Funcionário" href="dados_funcionario.jsp?id=<%=f.getId()%>"><img src="img/meusDados.png" /></a> 
                                <a title="Excluir Funcionário" href="#" onclick="excluir(<%=f.getId()%>, '<%=f.getNome()%>')" ><img src="img/excluir.png" /></a>
                                <a title="Status" href="alterar_status.do?id=<%=f.getId()%>&op=<%=op1%>"><img src="img/<%=img_situacao%>.png" /></a> 
                                    <%
                                        if (f.getPerfil().getTitulo().equals("Barbeiro")) {%>
                                <a title="Vincular Serviço" href="form_gerenciar_funcionario_servico.jsp?id=<%=f.getId()%>"><img src="img/servico.png" /></a>  
                                    <% }
                                    %>  
                            </td>
                        </tr> 
                        <%
                            }%>
                    </table>
                     <table class="table table-striped table table-bordered  table-hover" style="background-color: white;" id="tb-grande">
                        <thead class="table-dark">
                        <td><strong>ID</strong></td>
                        <td ><strong>NOME</strong></td>
                        <td ><strong>PERFIL</strong></td>
                        <td ><strong>TEL-CONTATO</strong></td>
                        <td ><strong>STATUS</strong></td>
                        <td ><strong>OPÇÕES</strong></td>
                        </thead>
                        <%
                            for (Funcionario f : lista) {
                                String dataSaida;
                                if (f.getDataSaida() != null) {
                                    dataSaida = df.format(f.getDataSaida());
                                } else {
                                    dataSaida = "vazio";
                                }
                                ct++;
                        %>
                        <tr>
                            <td><%=f.getId()%></td>
                            <td><%=f.getNome()%></td>
                            <td><%=f.getPerfil().getTitulo()%></td>
                            <td><%=f.getTelefoneContato()%></td>
                            <td><%=f.getStatus()%></td>
                            <td>
                                <%

                                    String img_situacao = "visivel";
                                    String op1 = "Inativo";
                                    String title = "Desativar Usuário";
                                    if (!f.getStatus().equals("Ativo")) {
                                        img_situacao = "invisivel";
                                        op1 = "Ativo";
                                        title = "Ativar Usuário";
                                    }

                                %>
                                 <a title="Alterar Dados Funcionário" href="form_alterar_funcionario.jsp?id=<%=f.getId()%>"><img src="img/alterar.png" /></a>
                                <a title="Dados Do Funcionário" href="dados_funcionario.jsp?id=<%=f.getId()%>"><img src="img/meusDados.png" /></a> 
                                <a title="Excluir Funcionário" href="#" onclick="excluir(<%=f.getId()%>, '<%=f.getNome()%>')" ><img src="img/excluir.png" /></a>
                                <a title="Status" href="alterar_status.do?id=<%=f.getId()%>&op=<%=op1%>"><img src="img/<%=img_situacao%>.png" /></a> 
                                    <%
                                        if (f.getPerfil().getTitulo().equals("Barbeiro")) {%>
                                <a title="Vincular Serviço" href="form_gerenciar_funcionario_servico.jsp?id=<%=f.getId()%>"><img src="img/servico.png" /></a>  
                                    <% }
                                    %>  
                            </td>
                        </tr> 
                        <%
                            }%>
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
            function excluir(id, nome) {
                if (confirm("Tem certeza que quer excluir o cliente:" + nome + "? \n \n Isso apagarar todos os registro relacionados a ele tambem!!")) {
                    window.open("excluir_funcionario.do?id=" + id, "_self");
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