<%-- 
    Document   : form_inserir_funcionario
    Created on : 02/06/2021, 12:37:42
    Author     : Janderson
--%>

<%@page import="model.PerfilDAO"%>
<%@page import="model.Perfil"%>
<%@page import="java.util.ArrayList"%>
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
            <div class="cont-cadastrar" id="cont-cadastra-fun">
                <div class="cadastro" id="cadastro-fun">
                    <h2>Cadastrar Funcionário</h2>
                    <form name="inserir_funcionario" method="post" action="inserir_funcionario.do">
                        <table id="table-cadastro" class="cadastrar-fun">
                            <tr>
                                <td><span>Nome:</span></td>
                                <td><label><input type="text" name="nome" placeholder="Ex: Flávio Constatino" autocomplete="off" required></label></td>
                            </tr>
                            <tr>
                                <td><span>Perfil:</span></td>
                                <td>
                                    <label><select name="perfil" required>
                                        <%                                ArrayList<Perfil> lista = new ArrayList<Perfil>();
                                            try {

                                                PerfilDAO pDAO = new PerfilDAO();
                                                lista = pDAO.listar();
                                            } catch (Exception e) {
                                                out.print("Erro: " + e);
                                            }

                                        %>
                                        <option value="">Selecione...</option>
                                        <% for (Perfil p : lista) {%>
                                        <option value="<%=p.getId()%>"><%=p.getTitulo()%></option>
                                        <%}%>
                                    </select></label>
                                </td>
                            </tr>
                            <tr>
                                <td><span>Matricula :</span></td>
                                <td><label><input type="text" name="matricula" placeholder="Ex: 302000" autocomplete="off" required></label></td>
                            </tr>
                            <tr>
                                <td><span>Senha:</span></td>
                                <td><label><input type="password" name="senha" placeholder="**********" autocomplete="off" required></label></td>
                            </tr>
                            <tr>
                                <td><span>Telefone contato :</span></td>
                                <td><label><input type="text" id="tel" onkeypress="mask(this, mphone);" placeholder="Ex:(61)90000-0000" name="telefoneContato" autocomplete="off" required></label></td>
                            </tr>
                            <tr>
                                <td><span>Telefone :</span></td>
                                <td><label><input type="text" autocomplete="off" onkeypress="mask(this, mphone);" placeholder="Campo opcional" name="telefone" ></label></td>
                            </tr>
                            <tr>
                                <td><span>CEP :</span> </td>
                                <td><label><input type="text" id="cep" autocomplete="off" placeholder="Ex:72.000-000" name="cep"></label></td>
                            </tr>
                            <tr>
                                <td><span>Cidade :</span> </td>
                                <td><label><input type="text" autocomplete="off" placeholder="Ex: Brasília" name="cidade"></label></td>
                            </tr>
                            <tr>
                                <td><span>Bairro :</span> </td>
                                <td><label><input type="text" autocomplete="off" placeholder="Ex: Recanto das Emas" name="bairro"></label></td>
                            </tr>
                            <tr>
                                <td><span>Endereço :</span> </td>
                                <td><label><input type="text" autocomplete="off" placeholder="Qd 300 Cj 01" name="endereco"></label></td>
                            </tr>
                            <tr>
                                <td><span>Número da Casa:</span></td>
                                <td><label><input type="text" autocomplete="off" placeholder="Ex: Casa 5" name="casa"></label></td>
                            </tr>
                            <tr>
                                <td><span>Data de Nascimento  :</span></td>
                                <td><label><input type="date" autocomplete="off"  name="dataNascimento"></label></td>
                            </tr>
                            <tr>
                                <td><span>Data de contrato :</span></td>
                                <td><label><input type="date" autocomplete="off" name="dataContrato"></label></td>
                            </tr>
                            <tr>
                                <td><span>Validade do Contrato :</span></td>
                                <td><label><input type="date" autocomplete="off" name="dataFinalContrato"></label></td>
                            </tr>
                        </table>
                        <button id="cadastrar" type="submit">Cadastrar</button>
                    </form>
                </div>
            </div>
        </main>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
        <script src="https://cdn.jsdelivr.net/npm/cleave.js@1.6.0/dist/cleave.min.js"></script>
        <script>
                                    new Cleave('#cep', {
                                        blocks: [2, 3, 3],
                                        delimiters: ['.', '-'],
                                        numericOnly: true
                                    });

                                    new Cleave('#tel', {
                                        blocks: [0, 2, 5, 4],
                                        delimiters: ['(', ') ', '-'],
                                        numericOnly: true
                                    });

        </script>
        <script>
            function mask(o, f) {
                setTimeout(function () {
                    var v = mphone(o.value);
                    if (v != o.value) {
                        o.value = v;
                    }
                }, 1);
            }

            function mphone(v) {
                var r = v.replace(/\D/g, "");
                r = r.replace(/^0/, "");
                if (r.length > 10) {
                    r = r.replace(/^(\d\d)(\d{5})(\d{4}).*/, "($1) $2-$3");
                } else if (r.length > 5) {
                    r = r.replace(/^(\d\d)(\d{4})(\d{0,4}).*/, "($1) $2-$3");
                } else if (r.length > 2) {
                    r = r.replace(/^(\d\d)(\d{0,5})/, "($1) $2");
                } else {
                    r = r.replace(/^(\d*)/, "($1");
                }
                return r;
            }
        </script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </body>         
</html>