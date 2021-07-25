<%-- 
    Document   : servico
    Created on : 18/06/2021, 13:48:07
    Author     : Janderson
--%>

<%@page import="java.text.NumberFormat"%>
<%@page import="model.ServicoDAO"%>
<%@page import="model.Servico"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.ClienteDAO"%>
<%@page import="model.Atendimento"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<%
    String teste1 = "cliente";
    Atendimento agendamento = new Atendimento();
    try {
        if (session != null) {
            String[] teste = session.getValueNames();
            if (teste[0].equals("cliente") || teste[0].equals("funcionario")) {
                teste1 = teste[0];
                int idCliente = Integer.parseInt(request.getParameter("id"));
                ClienteDAO cDAO = new ClienteDAO();
                agendamento.setCliente(cDAO.carregarPorId(idCliente));
                session.setAttribute("agendamento", agendamento);
            }
        } else {
            response.sendRedirect("login_" + teste1 + ".jsp");
        }
    } catch (Exception e) {
        out.print("Erro: " + e);
        response.sendRedirect("login_" + teste1 + ".jsp?msg=3");
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
            <h2>Serviços</h2>
            <div class="conteudo-servico">
                <div class="servico">
                    <form id="form_listar_servico" name="meuForm" method="post" onsubmit="return valida()" action="gerenciar_agendamento.do">
                        <input type="hidden" name="etapa" value="1">
                        <h3>Escolha um Serviço</h3>
                        <div class="cont-serv">
                            <div>
                                <h5>Cortes para cabelo</h5>
                                <%                        
                                    ArrayList< Servico> lista = new ArrayList<Servico>();
                                    NumberFormat nf = NumberFormat.getCurrencyInstance();
                                    try {

                                        ServicoDAO sDAO = new ServicoDAO();
                                        lista = sDAO.listar();

                                    } catch (Exception e) {
                                        out.print("Erro ao listar os servicos: " + e);
                                    }

                                    for (Servico s : lista) {
                                        if (s.getTipo().equals("cabelo")) {
                                %>

                                <input type="radio" id="servico<%=s.getId()%>" name="servico" value="<%=s.getId()%>">
                                <label for="servico<%=s.getId()%>"><%=s.getNome() +"  "+ nf.format(s.getValor()) %></label></br>
                                <%
                                        }
                                    }
                                %>
                            </div>
                            <div>
                                <h5>Para a barba</h5>
                                <%
                                    try {

                                        ServicoDAO sDAO = new ServicoDAO();
                                        lista = sDAO.listar();

                                    } catch (Exception e) {
                                        out.print("Erro ao listar os servicos: " + e);
                                    }

                                    for (Servico s : lista) {
                                        if (s.getTipo().equals("barba")) {
                                %>

                                <input type="radio" id="servico<%=s.getId()%>" name="servico" value="<%=s.getId()%>">
                                <label for="servico<%=s.getId()%>"><%=s.getNome() +"  "+ nf.format(s.getValor())%></label></br>
                                <%
                                        }
                                    }
                                %>
                            </div>
                            <div>
                                <h5>Diversos</h5>
                                <%
                                    try {

                                        ServicoDAO sDAO = new ServicoDAO();
                                        lista = sDAO.listar();

                                    } catch (Exception e) {
                                        out.print("Erro ao listar os servicos: " + e);
                                    }

                                    for (Servico s : lista) {
                                        if (s.getTipo().equals("outros")) {
                                %>

                                <input type="radio" id="servico<%=s.getId()%>" name="servico" value="<%=s.getId()%>">
                                <label for="servico<%=s.getId()%>"><%=s.getNome() +"  "+nf.format(s.getValor())%></label></br>
                                <%
                                        }
                                    }
                                %>
                            </div>
                            <div>
                                <h5>Promoções</h5>
                                <%
                                    try {

                                        ServicoDAO sDAO = new ServicoDAO();
                                        lista = sDAO.listar();

                                    } catch (Exception e) {
                                        out.print("Erro ao listar os servicos: " + e);
                                    }

                                    for (Servico s : lista) {
                                        if (s.getTipo().equals("promoções")) {
                                %>

                                <input type="radio" id="servico<%=s.getId()%>" name="servico" value="<%=s.getId()%>">
                                <label for="servico<%=s.getId()%>"><%=s.getNome() +"  "+nf.format(s.getValor())%></label></br>
                                <%
                                        }
                                    }
                                %>
                            </div>

                        </div>

                            <button type="submit" id="proximo-ser">Proximo</button>   

                    </form>
                </div>
            </div>
        </main>
        <footer>
            <%@include file="footer.jsp"%>
        </footer>
        <script>
            function valida(){
                var valid = false;
                var x = document.meuForm.servico;
                
                for(var i=0;i<x.length;i++){
                    if(x[i].checked){
                        valid = true;
                        break;
                    }
                }
                if(!valid){
                    alert("Selecione um serviço para continuar");
                    return false;
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