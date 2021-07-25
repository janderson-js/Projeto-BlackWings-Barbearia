<%-- 
    Document   : funcionario
    Created on : 18/06/2021, 16:48:27
    Author     : Janderson
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Servico"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<%
    String teste1 = "cliente";
    int idServico = Integer.parseInt(request.getParameter("id"));
    try {
        if (session != null) {
            String[] teste = session.getValueNames();
            if (teste[0].equals("cliente")) {
                teste1 = teste[0];
            } else if (teste[0].equals("funcionario")) {
                teste1 = teste[0];
            }
            idServico = Integer.parseInt(request.getParameter("id"));
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
            <h2>Funcionarios</h2>
            <div class="conteudo-servico">
                <form id="form_listar_servico" method="post" name="meuForm"  onsubmit="return valida()" action="gerenciar_agendamento.do" >
                    <input type="hidden" name="etapa" value="2">

                    <div class="servico">

                        <div >
                            <h3 class="h3">Escolha um Funcionário e Data</h3>
                            <div class="funcionario">
                                <%                                    ArrayList<Funcionario> lista = new ArrayList<Funcionario>();
                                    try {

                                        FuncionarioDAO fDAO = new FuncionarioDAO();
                                        lista = fDAO.funcionarioServico(idServico);

                                    } catch (Exception e) {
                                        out.print("Erro ao listar os servicos: " + e);
                                    }

                                    for (Funcionario f : lista) {

                                %>
                                <div id="branco">
                                    <input type="radio" id="funcionario" name="funcionario" value="<%=f.getId()%>">
                                    <label for="servico"><span><%=f.getNome()%></span></label>
                                </div>
                                <%
                                    }
                                %>
                            </div>

                            <div class="data-button">
                                <div><span>Informe a data: </span><input type="date" name="data" id="data" required></div>
                                <button type="submit" id="proximo-fun">Proximo</button>
                            </div>
                        </div>
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
            var x = document.meuForm.funcionario;
            var dataInput = document.querySelector('#data');
            var dataAtual = new Date();
            var dataForm = new Date(dataInput.value);

            for (var i = 0; i < x.length; i++) {
                if (x[i].checked) {
                    valid = true;
                    break;
                }
            }
            if (!valid) {
                alert("Selecione um Funcionário para continuar");
                return false;
            }

            if (dataForm.getDay() === 6) {
                alert("Estamos Fechado aos Domigos!! \nPor favor escolha outra data!!");
                return false;
            }


            var horaInput = dataForm.getFullYear() + '-' + (dataForm.getMonth() + 1) + '-' + (dataForm.getDate() + 1) + ' ' + dataAtual.getHours() + ':' + dataAtual.getMinutes() + ':' + dataAtual.getSeconds();
            var horaAtual = dataAtual.getFullYear() + '-' + (dataAtual.getMonth() + 1) + '-' + dataAtual.getDate() + ' ' + dataAtual.getHours() + ':' + dataAtual.getMinutes() + ':' + dataAtual.getSeconds();


            var dt = new Date(horaInput);
            var dtAtual = new Date(horaAtual);
            
            if (dtAtual.getTime() === dt.getTime()) {
                var hora = dataForm.getFullYear() + '-' + (dataForm.getMonth() + 1) + '-' + (dataForm.getDate() + 1) + ' 18:30:00';
                var dataH = new Date(hora);
                if(dtAtual.getTime() > dataH.getTime()){
                    alert("Não a mais horarios disponiveis para hoje!!\nHorarios\nseg a sab\n9:00 a 11:00\n14:00 a 18:30");
                    return false;
                }
            } else {
                if (dt.getTime() < dtAtual.getTime()) {
                    alert("Data invalida!!\nPor favor escolha outra data!!");
                    return false;
                }
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