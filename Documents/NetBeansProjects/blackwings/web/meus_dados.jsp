<%-- 
    Document   : index
    Created on : 26/05/2021, 15:29:01
    Author     : Janderson
--%>

<%@page import="model.ClienteDAO"%>
<%@page import="model.Funcionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
            <h1>Alterar Meus Dados!</h1>
            <%                Cliente c = new Cliente();
                try {
                    c = (Cliente) session.getAttribute("cliente");
                    %>
                    <form name="alterar_cliente" method="post" action="alterar_cliente.do">
                <table>
                    <tr>
                        <td><input type="hidden" name="id"  value="<%=c.getId()%>"></td>
                    </tr>
                    <tr>
                        <td>Nome do Cliente :</td>
                        <td><input type="text" name="nome" required value="<%=c.getNome()%>"></td>
                    </tr>
                    <tr>
                        <td>CPF do Cliente : </td>
                        <td><input type="text" name="cpf" required value="<%=c.getCpf()%>"></td>
                    </tr>
                    <tr>
                        <td>Senha do Cliente : </td>
                        <td><input type="password" name="senha" required value="<%=c.getSenha()%>"></td>
                    </tr>
                    <tr>
                        <td>Telefone contato do Cliente : </td>
                        <td><input type="tel" name="telefoneContato" required value="<%=c.getTelefoneContato()%>"></td>
                    </tr>
                    <tr>
                        <td>Telefone do Cliente : </td>
                        <td><input type="tel" name="telefone" required value="<%=c.getTelefone()%>"></td>
                    </tr>
                </table>
                <input type="submit" value="Alterar">
            </form>
                    <%
                    c = (Cliente) session.getAttribute("cliente");

                } catch (Exception e) {
                    response.sendRedirect("index.jsp");
                }
            %>
            
        </main>
        <footer>

        </footer>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </body>
</html>