<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<%
    try{
        if(session.getAttribute("cliente") != null){
            response.sendRedirect("index.jsp");
        }
    }catch(Exception e){
        
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
            <div class="cont-cadastrar" id="altura">
                <div class="cadastro">
                    <h2>Cadastrar-se</h2>
                    <form name="inserir_cliente" method="post" action="inserir_cliente.do">
                        <table id="table-cadastro">
                            <tr>
                                <td><span>Nome completo :</span></td>
                                <td><label><input type="text" name="nome" autocomplete="off" placeholder="Ex: Flávio Constantino" required></label></td>
                            </tr>
                            <tr>
                                <td><span>CPF  :</span></td>
                                <td><label><input type="text" name="cpf" autocomplete="off" placeholder="Ex: 000.000.000-00"  id="cpf" required></label></td>
                            </tr>
                            <tr>
                                <td><span>Senha :</span></td>
                                <td><label><input type="password" name="senha" autocomplete="off" placeholder="**********" required></label></td>
                            </tr>
                            <tr>
                                <td><span>Telefone contato:</span></td>
                                <td><label><input type="text" name="telefoneContato" id="tel" placeholder="Ex: (61) 99999-9999" autocomplete="off" required></label></td>
                            </tr>
                            <tr>
                                <td><span>Telefone:</span></td>
                                <td><label><input type="text" name="telefone" id="tel2" placeholder="campo opcional" autocomplete="off"></label></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><input type="checkbox" name="termos" id="termos" value="aceito" required> 
                                    <a data-toggle="modal" data-target="#modalExemplo">
                                        <span>Aceitar os Termos</span>
                                    </a>
                                    <!-- Modal -->
                                    <div class="modal fade" id="modalExemplo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title text-center" id="exampleModalLabel">Termos de privacidade</h5>
                                                    <button type="button" class="btn-close" data-dismiss="modal" aria-label="Fechar"></button>
                                                </div>
                                                <div class="modal-body" id="modal-p">
                                                    <p>
                                                        1 - O usuário, ao aceitar os Termos e Política de Privacidade, autoriza expressamente a plataforma a coletar, usar, armazenar, tratar, ceder ou utilizar as informações derivadas do uso dos serviços, 
                                                        do site e quaisquer plataformas, incluindo todas as informações preenchidas pelo usuário no momento em que realizar ou atualizar seu cadastro, 
                                                        além de outras expressamente descritas na Política de Privacidade que deverá ser autorizada pelo usuário.</p>
                                                    <p>
                                                        2 - Após a confirmação do cadastro, o usuário possuirá um login e uma senha pessoal, a qual assegura ao usuário o acesso individual à mesma. Desta forma, 
                                                        compete ao usuário exclusivamente a manutenção de referida senha de maneira confidencial e segura, evitando o acesso indevido às informações pessoais. 
                                                    </p>
                                                    <p>      
                                                        3 - Ao se cadastrar o usuário deverá informar dados completos, recentes e válidos, 
                                                        sendo de sua exclusiva responsabilidade manter referidos dados atualizados, 
                                                        bem como o usuário se compromete com a veracidade dos dados fornecidos.
                                                    </p>
                                                </div>                                           
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <button id="cadastrar" type="submit">Cadastrar</button>
                    </form>
                </div>
            </div>
        </main>
        <footer>
            <%@include file="footer.jsp"%>
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