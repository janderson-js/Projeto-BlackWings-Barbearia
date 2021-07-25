<%-- 
    Document   : horario_funcionario
    Created on : 18/06/2021, 17:38:52
    Author     : Janderson
--%>

<%@page import="java.util.GregorianCalendar"%>
<%@page import="javafx.scene.chart.PieChart.Data"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="model.AtendimentoDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="model.FuncionarioDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Funcionario"%>
<%@page import="model.Atendimento"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    int idFuncionario = 0;
    String data = "";
    String teste1 = "cliente";
    int size = 16;
    String[] disabled = new String[size];
    String[] horas = new String[size];

    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd");
    SimpleDateFormat df3 = new SimpleDateFormat("HH:mm:ss");

    try {
        data = request.getParameter("data");
        idFuncionario = Integer.parseInt(request.getParameter("id"));
        if (session != null) {
            String[] teste = session.getValueNames();
            if (teste[0].equals("cliente")) {
                teste1 = teste[0];
            } else if (teste[0].equals("funcionario")) {
                teste1 = teste[0];
            }
        } else {
            response.sendRedirect("login_" + teste1 + ".jsp");
        }
    } catch (Exception e) {
        response.sendRedirect("login_" + teste1 + ".jsp?msg=3");
    }

    String[] horario = {
        "09:00:00", "09:30:00", "10:00:00", "10:30:00", "11:00:00",
        "11:30:00", "14:00:00", "14:30:00", "15:00:00", "15:30:00", "16:00:00",
        "16:30:00", "17:00:00", "17:30:00", "18:00:00", "18:30:00"};
    String[] disponivel = {"livre", "livre", "livre", "livre", "livre", "livre", "livre", "livre", "livre", "livre", "livre", "livre", "livre", "livre", "livre", "livre"};
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/estilo.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <header id="top" class="top-header">
            <div class="cont-nav">
                <%@include file="menu_nav.jsp"%>
            </div>
        </header>
        <main>
            <h2>Horarios Disponiveis!</h2>
            <%                Atendimento a = new Atendimento();
                a = (Atendimento) session.getAttribute("agendamento");
            %>
            <div class="conteudo-servico">
                <div class="servico">
                    <form id="form_listar_servico" method="post" name="meuForm" onsubmit="return valida()" action="gerenciar_agendamento.do">
                        <input type="hidden" name="etapa" value="3">
                        <div class="horario" >

                            <h4>Escolha um Horário</h4>
                            <div class="cont-hora">
                                <table>
                                    <%
                                        ArrayList<Atendimento> lista = new ArrayList<Atendimento>();
                                        int ct = 0;
                                        try {
                                            Date datateste = new Date();
                                            AtendimentoDAO aDAO = new AtendimentoDAO();
                                            lista = aDAO.horarioFuncionario(a.getDataAgendamento(), idFuncionario);
                                            String status = "";
                                            String color = "";

                                            Date dataAgen = a.getDataAgendamento();
                                            String horaAgen = df2.format(datateste);

                                            Date horaA = df2.parse(horaAgen);
                                            Date horaB = df.parse(dataAgen + " 00:00:00");

                                            for (int i = 0; i < horario.length; i++) {
                                                Date hora = df.parse(df2.format(datateste) + " " + horario[i]);
                                                horas[i] = df3.format(hora);
                                                if (df2.format(horaA).equals(df2.format(horaB))) {

                                                    if (datateste.getTime() <= hora.getTime()) {
                                                        disponivel[i] = "livre";

                                                    } else {
                                                        disponivel[i] = "indisponivel";
                                                    }
                                                } else {
                                                    disabled[i] = "";
                                                }
                                            }
                                            for (int i = 0; i < horario.length; i++) {
                                                for (Atendimento at : lista) {
                                                    if (horas[i].equals(df3.format(at.getHoraAgendamento()))) {
                                                        disponivel[i] = "ocupado";
                                                    }
                                                }
                                                if (disponivel[i].equals("ocupado")) {
                                                    disabled[i] = "disabled";

                                                    status = "ocupado";
                                                    color = "style='color:red;'";
                                                } else if (disponivel[i].equals("indisponivel")) {
                                                    disabled[i] = "disabled";
                                                    ct++;
                                                    status = "indisponivel";
                                                    color = "style='color:red;'";
                                                } else {
                                                    status = "livre";
                                                    color = "style='color:green;'";
                                                }
                                    %>
                                    <tr>
                                        <td>
                                            <span <%=color%>> <%=status%></span>
                                        </td>
                                        <td>
                                            <input type="radio" <%=disabled[i]%> name="horario" id="horario" value="<%=horario[i]%>">
                                            <label for="horario"><span><%=horario[i]%></span></label></br>
                                        </td>
                                    </tr>
                                    <%}
                                        } catch (Exception e) {
                                            out.print("Erro: " + e);
                                        }
                                    %>
                                </table>
                            </div>
                            <span>Forma de Pagamento</span>
                            <select name="pagamento" id="pagamento" required>
                                <option value="">Selecione...</option>
                                <option value="Cartão">Cartão</option>
                                <option value="Dinheiro">Dinheiro</option>
                                <option value="Pix">PIX</option>
                            </select>
                            <button type="submit" id="proximo">Proximo</button>
                        </div>
                    </form>
                </div>
            </div>
        </main>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
        <script>
            function valida() {
                var valid = false;
                var x = document.meuForm.horario;

                for (var i = 0; i < x.length; i++) {
                    if (x[i].checked) {
                        valid = true;
                        break;
                    }
                }
                if (!valid) {
                    alert("Selecione um horário para continuar");
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