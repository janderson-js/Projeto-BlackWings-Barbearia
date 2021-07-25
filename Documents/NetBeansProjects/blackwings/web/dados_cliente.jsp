<%-- 
    Document   : form_alterar_cliente
    Created on : 31/05/2021, 21:13:23
    Author     : Janderson
--%>

<%@page import="model.Cliente"%>
<%@page import="model.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        response.sendRedirect("login_cliente.jsp?msg=2");
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
            <div class="cont-cadastrar" id="altura">
                <div class="cadastro">
                    <h2>Meus Dados</h2>
                    <%                Cliente c = new Cliente();
                        try {
                            int id = Integer.parseInt(request.getParameter("id"));
                            ClienteDAO cDAO = new ClienteDAO();
                            c = cDAO.carregarPorId(id);
                        } catch (Exception e) {
                            out.print("Erro Form alterar Cliente: " + e);
                        }
                    %>
                    <form name="alterar_cliente" method="post" action="form_alterar_cliente.jsp">
                        <table id="table-cadastro" class="meus-dados">
                            <tr>
                                
                                <td><input type="hidden" name="id"   value="<%=c.getId()%>"></td>
                            </tr>
                            <tr>
                                <td><span>Nome :</span></td>
                                <td><label id="lbl"><input type="text" name="nome" disabled value="<%=c.getNome()%>"></label></td>
                            </tr>
                            <tr>
                                <td><span>CPF : </span></td>
                                <td><label id="lbl"><input type="text" name="cpf" id="cpf" disabled  value="<%=c.getCpf()%>"></label></td>
                            </tr>
                            <tr>
                                <td><span>Senhae : </span></td>
                                <td><label id="lbl"><input type="password" name="senha" disabled  value="<%=c.getSenha()%>"></label></td>
                            </tr>
                            <tr>
                                <td><span>Telefone contato: </span></td>
                                <td><label id="lbl"><input type="tel" name="telefoneContato" disabled id="tel"  value="<%=c.getTelefoneContato()%>"></label></td>
                            </tr>
                            <tr>
                                <td><span>Telefone : </span></td>
                                <td><label id="lbl"><input type="tel" name="telefone" id="tel2"  disabled required value="<%=c.getTelefone()%>"></label></td>
                            </tr>
                        </table>
                        <button id="cadastrar" type="submit">Click aqui para Alterar</button>
                    </form>
                </div>
            </div>
        </main>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
        <script src="https://cdn.jsdelivr.net/npm/cleave.js@1.6.0/dist/cleave.min.js"></script>
        <script>
            new Cleave('#cpf', {
                blocks: [3, 3, 3, 2],
                delimiters: ['.', '.', '-'],
                numericOnly: true
            });
            new Cleave('#tel', {
                blocks: [0, 2, 5, 4],
                delimiters: ['(', ') ', '-'],
                numericOnly: true
            });
            new Cleave('#tel2', {
                blocks: [0, 2, 5, 4],
                delimiters: ['(', ') ', '-'],
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