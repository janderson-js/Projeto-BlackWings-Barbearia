<%@page import="java.text.DateFormat"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.MenuDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Menu"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Funcionario visitante = new Funcionario();
    try {
        String[] teste = session.getValueNames();
        if (teste[0] != null) {
            if (teste[0].equals("funcionario")) {
                visitante = (Funcionario) session.getAttribute("funcionario");
                if (visitante.getPerfil().getTitulo().equals("Barbeiro") || visitante.getPerfil().getTitulo().equals("Atendente") || visitante.getPerfil().getTitulo().equals("Gerente")) {
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
        <title>JSP Page</title>
    </head>
    <body>
        <header id="top" class="top-header">
            <div class="cont-nav">
                <%@include file="menu_nav.jsp"%>
            </div>
        </header>
        <main>
            <h2>Lista de Menu</h2>
            <div class="nav-atendimento">
                <a href="form_inserir_menu.jsp" id="btnNovo">Cadastrar Menu</a> 
            </div>
            <div class="altara-100">
                <div class="tabela-branca">
                    <table class="table table-striped table table-bordered  table-hover" style="background-color: white;" id="tb-pequena">
                        <thead class="table-dark" id="td-head">
                        <td><strong>ID</strong></td>
                        <td ><strong>Titulo</strong></td>
                        <td ><strong>Link</strong></td>
                        <td ><strong>OPÇÕES</strong></td>
                        </thead>
                        <%            //Instanciar um ArrayList de Menu 
                            ArrayList<Menu> lista = new ArrayList<Menu>();
                            try {
                                //carregar o ArrayList de Menu com a a��o da MenuDAO
                                MenuDAO cDAO = new MenuDAO();
                                lista = cDAO.listar();

                            } catch (Exception e) {
                                out.print("Erro: " + e);
                            }
                            //La�o de repeti��o para mostrar a lista
                            for (Menu c : lista) {
                        %>

                        <tr>
                            <td><%=c.getId()%></td>
                            <td><%=c.getNome()%></td>
                            <td><%=c.getLink()%></td>
                            <td><a href="form_alterar_menu.jsp?id=<%=c.getId()%>"><img src="img/alterar.png" /></a> <a href="#" onclick="excluir(<%=c.getId()%>, '<%=c.getNome()%>')" ><img src="img/excluir.png" /></a></td>
                        </tr>            
                        <%
                            }
                        %>

                    </table>
                        <table class="table table-striped table table-bordered  table-hover" style="background-color: white;" id="tb-media">
                        <thead class="table-dark">
                        <td><strong>ID</strong></td>
                        <td ><strong>Titulo</strong></td>
                        <td ><strong>Link</strong></td>
                        <td ><strong>OPÇÕES</strong></td>
                        </thead>
                        <%            //Instanciar um ArrayList de Menu 
                            try {
                                //carregar o ArrayList de Menu com a a��o da MenuDAO
                                MenuDAO cDAO = new MenuDAO();
                                lista = cDAO.listar();

                            } catch (Exception e) {
                                out.print("Erro: " + e);
                            }
                            //La�o de repeti��o para mostrar a lista
                            for (Menu c : lista) {
                        %>

                        <tr>
                            <td><%=c.getId()%></td>
                            <td><%=c.getNome()%></td>
                            <td><%=c.getLink()%></td>
                            <td><a href="form_alterar_menu.jsp?id=<%=c.getId()%>"><img src="img/alterar.png" /></a> <a href="#" onclick="excluir(<%=c.getId()%>, '<%=c.getNome()%>')" ><img src="img/excluir.png" /></a></td>
                        </tr>            
                        <%
                            }
                        %>

                    </table>
                        <table class="table table-striped table table-bordered  table-hover" style="background-color: white;" id="tb-grande">
                        <thead class="table-dark">
                        <td><strong>ID</strong></td>
                        <td ><strong>Titulo</strong></td>
                        <td ><strong>Link</strong></td>
                        <td ><strong>OPÇÕES</strong></td>
                        </thead>
                        <%            //Instanciar um ArrayList de Menu 
                            try {
                                //carregar o ArrayList de Menu com a a��o da MenuDAO
                                MenuDAO cDAO = new MenuDAO();
                                lista = cDAO.listar();

                            } catch (Exception e) {
                                out.print("Erro: " + e);
                            }
                            //La�o de repeti��o para mostrar a lista
                            for (Menu c : lista) {
                        %>

                        <tr>
                            <td><%=c.getId()%></td>
                            <td><%=c.getNome()%></td>
                            <td><%=c.getLink()%></td>
                            <td><a href="form_alterar_menu.jsp?id=<%=c.getId()%>"><img src="img/alterar.png" /></a> <a href="#" onclick="excluir(<%=c.getId()%>, '<%=c.getNome()%>')" ><img src="img/excluir.png" /></a></td>
                        </tr>            
                        <%
                            }
                        %>

                    </table>
                </div>
            </div>
        </main>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>   
        <script>
            function excluir(id, nome) {
                if (confirm("Tem certeza que quer excluir o menu:" + nome + "? \n\n Isso apacará todos os registro desse menu")) {
                    window.open("excluir_menu.do?id=" + id, "_self");
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