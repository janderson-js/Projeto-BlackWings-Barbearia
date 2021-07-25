<%-- 
    Document   : resumo_atendimento
    Created on : 18/06/2021, 19:26:00
    Author     : Janderson
--%>

<%@page import="java.text.NumberFormat"%>
<%@page import="model.ClienteDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Atendimento"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<%
    String teste1 = "cliente";
    try {
        if (session != null) {
            String[] teste = session.getValueNames();
            if (teste[0].equals("cliente") || teste[0].equals("funcionario")) {
                teste1 = teste[0];
            }
        } else {
            response.sendRedirect("login_" + teste1 + ".jsp");
        }
    } catch (Exception e) {
        response.sendRedirect("login_" + teste1 + ".jsp?msg=3");
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    </head>
    <body>
        <header>  
            <div class="cont-nav">
                <%@include file="menu_nav.jsp"%>
            </div>
        </header>
        <main>
            <h2>Resumo do Agendamento</h2>
            <div class="cont-resumo">
                <%                    
                    Atendimento a = new Atendimento();
                    a = (Atendimento) session.getAttribute("agendamento");
                    SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
                    SimpleDateFormat df2 = new SimpleDateFormat("HH:mm:ss");
                    NumberFormat nf = NumberFormat.getCurrencyInstance();
                %>
                <div class="resumo">
                    <form action="gerenciar_agendamento.do" method="post">
                    <input type="hidden" name="etapa" value="4">
                    <table>
                        <tr>
                            <td>
                               <span>Nome do Cliente : </span>
                            </td>
                            <td>
                                <input type="text" readonly value="<%=a.getCliente().getNome()%>">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>Telefone de Contato :</span>
                            </td>
                            <td>
                                <input type="text" readonly value="<%=a.getCliente().getTelefoneContato()%>">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>Serviço:</span>
                            </td>
                            <td>
                                <input type="text" readonly value="<%=a.getServico().getNome()%>">
                            </td>
                           
                        </tr>
                        <tr>
                            <td>
                                <span>Valor :</span>
                            </td>
                            <td>
                                <input type="text" readonly name="valor" id="valor" value="<%=nf.format(a.getServico().getValor())%>">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>Forma de pagamento :</span>
                            </td>
                            <td>
                                <input type="text" readonly name="valor" id="valor" value="<%=a.getFormaPagamento()%>">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>Agendado para :</span>
                            </td>
                            <td>
                                <input type="text" readonly value="<%=df.format(a.getDataAgendamento()) + " as " + df2.format(a.getHoraAgendamento())%>">
                            </td>
                            
                        </tr>
                        <tr>
                            <td>
                                <span>Sera atendido por:</span>
                            </td>
                            <td>
                                <input type="text" readonly value="<%=a.getFuncionario().getNome()%>">
                            </td>
                           
                        </tr>
                        <tr>
                            <td>
                                <button type="submit">Registrar Agendamento?</button>
                            </td>
                            <td>
                                <a href="index.jsp"><button>Cancelar Agendamento?</button></a>
                            </td>
                        </tr>
                    </table>
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