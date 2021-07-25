<%-- 
    Document   : form_inserir_servico
    Created on : 01/06/2021, 22:32:15
    Author     : Janderson
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<%
    try {
        String[] teste = session.getValueNames();
        if (teste[0] != null) {
            if (teste[0].equals("funcionario")) {
                Funcionario visitante = new Funcionario();
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
                    <h2>Cadastrar Serviço</h2>
                    <form name="inserir_servico" method="post" action="inserir_servico.do">
                        <table id="table-cadastro" class="cadastrar-fun select">
                            <tr>
                                <td><span>Nome do Servico: </span></td>
                                <td><label><input type="text" name="nome" placeholder="Penteado" required></label></td>
                            </tr>
                            <tr>
                                <td><span>Valor do Servico :</span></td>
                                <td><label><input type="text" name="valor" placeholder="Ex: 10,00" id="valor" onkeyup="formatarMoeda()" required></label></td>
                            </tr>
                            <tr>
                                <td><span>Tipo de Serviço</span></td>
                                <td>
                                    <label>
                                        <select name="tipo">
                                            <option>selecionar...</option>
                                            <option value="cabelo">Cabelo</option>
                                            <option value="barba">Barba</option>
                                            <option value="outros">outros</option>
                                            <option value="promocao">Promoções</option>
                                        </select>
                                    </label>
                                </td>
                            </tr>
                        </table>
                        <button type="submit"  id="cadastrar">Cadastrar</button>
                    </form>
                </div>
            </div>
        </main>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
        <script>
            function formatarMoeda() {
                var elemento = document.getElementById('valor');
                var valor = elemento.value;

                valor = valor + '';
                valor = parseInt(valor.replace(/[\D]+/g, ''));
                valor = valor + '';
                valor = valor.replace(/([0-9]{2})$/g, ",$1");

                if (valor.length > 6) {
                    valor = valor.replace(/([0-9]{3}),([0-9]{2}$)/g, ".$1,$2");
                }

                elemento.value = valor;
                if (valor == 'NaN')
                    elemento.value = '';
            }
        </script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </body>
</html>