<%-- 
    Document   : form_login_cliente
    Created on : 06/06/2021, 15:50:06
    Author     : Janderson
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
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
            <%@include file="menu_nav.jsp"%>
        </header>
        <main id="conteiner-main" id="main">
            <section class="conteiner-login">
                <figure class="head-login" id="head-login">
                    <img src="img/locked.png">
                </figure>
                <figcaption class="body-login">
                    <h3>Logar-se</h3>
                    <div class="mensagem">
                        <%                            String msg = "";
                            String txtmsg = "";
                            try {
                                msg = request.getParameter("msg");
                                if (msg.equals("1")) {
                                    txtmsg = "Login ou senha inválidos!!<br/><br/>";
                                }
                                if (msg.equals("2")) {
                                    txtmsg = "Acesso restrito!! Favor efetuar login!!!! <br/><br/>";
                                }
                                if (msg.equals("3")) {
                                    txtmsg = "É necessario estar logado!!!! <br/><br/>";
                                }
                            } catch (Exception e) {

                            }
                            if (!txtmsg.equals("")) {
                        %>
                        <div class="alert alert-danger d-flex align-items-center" id="msg" role="alert">
                            <strong><%=txtmsg%></strong>
                            <button type="button" class="btn-close" id="btn-fecha" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true"></span>
                            </button>
                        </div>
                        <%
                            }
                        %>
                    </div>
                    <div id="form-login">
                        <form method="post" id="login_cliente" action="login_cliente.do" autocomplete="off">
                            <table class="tabela">
                                <tr>
                                    <td><span>CPF:</span></td>
                                    <td><input type="text" placeholder="Login" name="login" id="cpf" autocomplete="off" required></br><div class="linha"></div></td>
                                </tr>
                                <tr>
                                    <td><span>SENHA:</span></td>
                                    <td><input type="password" placeholder="Senha"  name="senha" autocomplete="off" required></br><div class="linha"></div></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <button type="submit" id="btn">Entrar</button>
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>

                </figcaption>
                <p>Já tem uma conta?<a href="form_inserir_cliente.jsp">Cadastre-se</a></p>
            </section>
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
        </script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

    </body>
</html>