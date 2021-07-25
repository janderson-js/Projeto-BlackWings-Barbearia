<%-- 
    Document   : menu_nav
    Created on : 15/06/2021, 10:17:57
    Author     : Janderson
--%>

<%@page import="model.FuncionarioDAO"%>
<%@page import="model.Menu"%>
<%@page import="model.Funcionario"%>
<%@page import="model.Cliente"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<nav class="navbar navbar-dark justify-content-between navbar-expand-lg" style="background-color: black;" id="nav">
    <div>
        <a id="logo" href="index.jsp">BLACK WINGS</a>
    </div>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#conteudoNavbarSuportado" aria-controls="conteudoNavbarSuportado" aria-expanded="false" aria-label="Alterna navegação">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse justify-content-end" id="conteudoNavbarSuportado">
    <ul class="navbar-nav mr-auto">
      <%
            String nome = "";
            try {
                String[] user = session.getValueNames();
                if (session != null && user[0].equals("cliente")) {
                    Cliente c = new Cliente();
                    c = (Cliente) session.getAttribute("cliente");
                    nome = c.getNome();
                    out.print("<li class='nav-item'><a class='nav-link' href='index.jsp'>Home</a></li>");
                    out.print("<li class='nav-item'><a class='nav-link' href='dados_cliente.jsp?id="+c.getId()+"'>Meus dados</a></li>");
                    out.print("<li class='nav-item'><a class='nav-link' href='agendamento_cliente.jsp'>agendar</a></li>");
                    out.print("<li class='nav-item'><a class='nav-link' onclick='sair()' href='sair.jsp'>Sair</a></li>");
                }
                if (session != null && user[0].equals("funcionario")) {
                    Funcionario usuario = new Funcionario();
                    usuario = (Funcionario) session.getAttribute("funcionario");
                    nome = usuario.getNome();
                    out.print("<li class='nav-item'><a class='nav-link'  href='form_alterar_funcionario.jsp?id="+ usuario.getId() +"'>" + nome + "</a></li>");
                    for (Menu m : usuario.getPerfil().getMeusMenus()) {
                        out.print("<li class='nav-item'><a class='nav-link' href='" + m.getLink() + "'>" + m.getNome() + "</a></li>");

                    }
                    out.print("<li class='nav-item'><a class='nav-link' onclick='sair()' href='#'>Sair</a></li>");
                }
            } catch (Exception e) {
                out.print("<li class='nav-item'><a class='nav-link' href='index.jsp'>Home</a></li>");
                out.print("<li class='nav-item'><a class='nav-link' href='agendamento_cliente.jsp'>agendamento</a></li>");
                out.print("<li class='nav-item'><a class='nav-link' href='login_cliente.jsp'>Login</a></li><li><a class='nav-link' href='form_inserir_cliente.jsp'>Cadastro</a></li>");
            }
        %>
    </ul>
  </div>
</nav>


<script>
    function sair() {
        if (confirm("Deseja sair?")) {
            window.open("sair.jsp", "_self");
        }
    }
</script>
