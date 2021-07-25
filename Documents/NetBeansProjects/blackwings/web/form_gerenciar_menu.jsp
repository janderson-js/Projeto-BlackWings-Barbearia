<%-- 
    Document   : form_gerenciar_menu
    Created on : 08/06/2021, 12:21:07
    Author     : Janderson
--%>

<%@page import="model.PerfilDAO"%>
<%@page import="model.Menu"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Perfil"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<%
    Perfil p = new Perfil();
    ArrayList<Menu> menus = new ArrayList<Menu>();
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        PerfilDAO pDAO = new PerfilDAO();
        p = pDAO.carregarPorId(id);
        menus = pDAO.listarMenusNaoPerfil(id);
        String[] teste = session.getValueNames();

        if (teste[0] != null) {
            if (teste[0].equals("funcionario")) {
                if (teste[0].equals("funcionario")) {
                    Funcionario visitante = new Funcionario();
                    visitante = (Funcionario) session.getAttribute("funcionario");
                    if (visitante.getPerfil().getTitulo().equals("Atendente") || visitante.getPerfil().getTitulo().equals("Barbeiro")) {
                        response.sendRedirect("administracao.jsp");
                    }
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@1,100&display=swap" rel="stylesheet">
    </head>
    <body>
        <header id="top" class="top-header">
            <div class="cont-nav">
                <%@include file="menu_nav.jsp"%>
            </div>
        </header>
        <main>
            <h2 id="h2-branco">Vincular Menus</h2>
            <div class="nav-atendimento">
                <form name="gerenciar_menu_perfil" id="vincular" action="gerenciar_menu_perfil.do" method="get">
                    <span> Perfil: <%=p.getTitulo()%>:</span>
                    <input type="hidden" name="idPerfil" value="<%=p.getId()%>"/>
                    <input type="hidden" name="op" value="add"/>
                    <label>
                        <select name="idMenu" required>
                            <option value="">Selecione... </option>
                            <%
                                for (Menu m : menus) {
                            %>
                            <option value="<%=m.getId()%>"><%=m.getNome()%></option>
                            <%
                                }
                            %>
                        </select>
                    </label>
                        <button type="submit">Vincular</button>
                </form>
            </div>
            <div class="altara-100">
                <div class="tabela-branca">
                    <table class="table table-striped table table-bordered  table-hover" style="background-color: white;" id="centralizar">
                        <thead class="table-dark">
                            <tr>
                                <td align="center" width="10%"><strong>ID</strong></td>
                                <td align="center" width="70%"><strong>MENU</strong></td>
                                <td align="center" width="20%"><strong>REMOVER</strong></td>
                            </tr>
                        </thead>
                        <%                        //Laço de repetição para mostrar a lista
                            for (Menu m : p.getMeusMenus()) {
                        %>
                        <tr>
                            <td align="center"><%=m.getId()%></td>
                            <td><%=m.getNome()%></td>
                            <td align="center">
                                <a href="gerenciar_menu_perfil.do?idPerfil=<%=p.getId()%>&idMenu=<%=m.getId()%>&op=del">
                                    <img src="img/remover.png" />
                                </a>
                            </td>
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
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </body>
</html>