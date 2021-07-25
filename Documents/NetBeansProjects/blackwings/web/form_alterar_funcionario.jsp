<%-- 
    Document   : form_alterar_funcionario
    Created on : 06/06/2021, 12:06:59
    Author     : Janderson
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Perfil"%>
<%@page import="model.PerfilDAO"%>
<%@page import="model.FuncionarioDAO"%>
<%@page import="model.Funcionario"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<%
    try {
        String[] teste = session.getValueNames();
        if (teste[0] != null) {
            if (teste[0].equals("funcionario")) {
                if (teste[0].equals("funcionario")) {
                    Funcionario visitante = new Funcionario();
                    visitante = (Funcionario) session.getAttribute("funcionario");
                    if (visitante.getPerfil().getTitulo().equals("Barbeiro") || visitante.getPerfil().getTitulo().equals("Atendente")) {
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
                    <h2>Alterar Funcionário</h2>
                    <%                Funcionario f = new Funcionario();
                        try {
                            int id = Integer.parseInt(request.getParameter("id"));
                            FuncionarioDAO fDAO = new FuncionarioDAO();
                            f = fDAO.carregarPorId(id);

                        } catch (Exception e) {
                            out.print("Erro Form alterar Funcionario: " + e);
                        }
                        Funcionario user = new Funcionario();
                        user = (Funcionario) session.getAttribute("funcionario");
                     %>
                    <form name="alterar_funcionario" method="post" action="alterar_funcionario.do">
                        <table id="table-cadastro" class="cadastrar-fun">
                            <tr>
                                <td><input type="hidden" name="id"  value="<%=f.getId()%>"></td>
                            </tr>
                            <tr>
                                <td><span>Nome do Funcionario: </span></td>
                                <td><label><input type="text" name="nome" readonly value="<%=f.getNome()%>"></label></td>
                            </tr>        
                            <tr>
                                <td>
                                    <span> Perfil do Funcionario:</span>
                                </td>
                                <td>
                                    <label>
                                        <select type="text" name="perfil">
                                            <%  ArrayList<Perfil> lista = new ArrayList<Perfil>();
                                                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                                                try {
                                                    PerfilDAO pDAO = new PerfilDAO();
                                                    lista = pDAO.listar();

                                                } catch (Exception e) {
                                                    out.print("Erro: " + e);
                                                }
                                            %>
                                            <option value="">Selecione...</option>
                                            <% for (Perfil p : lista) {
                                                    out.print(p.getId());
                                                    String select = "";
                                                    if (p.getId() == f.getPerfil().getId()) {
                                                        select = "selected";
                                                    }
                                            %>                       
                                            <option value="<%=p.getId()%>" <%=select%>><%=p.getTitulo()%></option>
                                            <%}%>
                                        </select>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td><span>Data de Nascimento : </span></td>
                                <td><label><input type="date" name="dataNas" required value="<%=df.format(f.getDataNascimento())%>"></label></td>
                            </tr>
                            <tr>
                                <td><span>Matricula : </span></td>
                                <td><label> <input type="text" name="matricula"  value="<%=f.getMatricula()%>"></label></td>
                            </tr>
                            <tr>
                                <td><span>Senha: </span></td>
                                <td><label><input type="password" name="senha" required value="<%=f.getSenha()%>"></label></td>
                            </tr>
                            <tr>
                                <td><span>Telefone contato : </span></td>
                                <td><label><input type="tel" name="telefoneContato" required value="<%=f.getTelefoneContato()%>"></label></td>
                            </tr>
                            <tr>
                                <td><span>Telefone: </span></td>
                                <td><label><input type="tel" name="telefone" required value="<%=f.getTelefone()%>"></label></td>
                            </tr>
                            <tr>
                                <td><span>CEP: </span></td>
                                <td><label><input type="text" name="cep" required value="<%=f.getCep()%>"></label></td>
                            </tr>
                            <tr>
                                <td><span>Cidade: </span></td>
                                <td><label><input type="text" name="cidade" required value="<%=f.getCidade()%>"></label></td>
                            </tr>
                            <tr>
                                <td><span>Bairro : </span></td>
                                <td><label><input type="text" name="bairro" required value="<%=f.getBairro()%>"></label></td>
                            </tr>
                            <tr>
                                <td><span>Endereço : </span></td>
                                <td><label><input type="text" name="endereco" required value="<%=f.getEndereco()%>"></label></td>
                            </tr>
                            <tr>
                                <td><span>Casa : </span></td>
                                <td><label><input type="text" name="casa" required value="<%=f.getCasa()%>"></label></td>
                            </tr>
                            <tr>
                                <td><span>Data de Contrato: </span></td>
                                <td><label><input type="date" name="dataCon" required value="<%=df.format(f.getDataContrato())%>"></label></td>
                            </tr>
                            <tr>
                                <td><span>Validade do Contrato: </span></td>
                                <td><label><input type="date" name="dataVal" required value="<%=df.format(f.getDataFinalContrato())%>"></label></td>
                            </tr>
                        </table>
                        <button type="submit" id="cadastrar">Alterar</button>
                    </form>
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