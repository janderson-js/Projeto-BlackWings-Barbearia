<%-- 
    Document   : index
    Created on : 26/05/2021, 15:29:01
    Author     : Janderson
--%>

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
            <section class="hero">
                <div class="cor">
                    <h2>Bem-vindo à Black Wings.</h2>
                    <p>"Inove seu visual com a gente."</p>
                </div>
                <a href="#amostra" class="btn">Conheça nosso serviços</a>
            </section>
            <section class="endereco-barbe">
                <h3>Como chegar até barbearia?</h3>
                <div class="div-endereco">
                    <div class="mapa">
                        <iframe id="map-pequeno" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3834.6908671150386!2d-48.031588685142!3d-16.029599988905403!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMTbCsDAxJzQ2LjYiUyA0OMKwMDEnNDUuOCJX!5e0!3m2!1spt-BR!2sbr!4v1625260065845!5m2!1spt-BR!2sbr" width="400" height="300" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                        <iframe id="map-grande" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3834.7188418486876!2d-48.03200398537357!3d-16.028145083017083!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x935980ee373e58ff%3A0xbebf97403bf5ec6f!2sQR%20206%20-%20Santa%20Maria%2C%20Bras%C3%ADlia%20-%20DF%2C%2072506-400!5e0!3m2!1spt-BR!2sbr!4v1625069850516!5m2!1spt-BR!2sbr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                    </div>
                    <div class="endereco"> 
                        <ul>
                            <h5>Endereço</h5>
                            <li>- QR 206 CJ F Casa 8 - Santa Maria-Brasília-DF</li>
                            <li>- CEP - 72506-400 </li>
                            <li>- CNPJ - 33.885.304/0001-32</li>
                            <li>- Telefone de contato - 61 9241-2347</li>
                            <li></li>
                        </ul>
                    </div>
                </div>
            </section>
            <section class="amostra" id="amostra">
                <h3>Alguns dos nossos serviços</h3>
                <div class="lista-prod">
                    <div class="prod">
                        <figure>
                            <img src="img/blog-1.jpg" alt="sadasda">
                        </figure>
                        <figcaption>
                            <h4>Penteado + Navalhado</h4>

                        </figcaption>
                    </div>
                    <div class="prod">
                        <figure>
                            <img src="img/blog-2.jpg" alt="sadasda">
                        </figure>
                        <figcaption>
                            <h4>Penteado</h4>

                        </figcaption>
                    </div>
                    <div class="prod">
                        <figure>
                            <img src="img/blog-3.jpg" alt="sadasda">
                        </figure>
                        <figcaption>
                            <h4>Platinado Masculino</h4>
                        </figcaption>
                    </div>
                    <div class="prod">
                        <figure>
                            <img src="img/blog-4.jpg" alt="sadasda">
                        </figure>
                        <figcaption>
                            <h4>Maquina e Tesoura</h4>
                        </figcaption>
                    </div>
                    <div class="prod">
                        <figure>
                            <img src="img/blog-5.jpg" alt="sadasda">
                        </figure>
                        <figcaption>
                            <h4>Degradê + Listra e luzes </h4>
                        </figcaption>
                    </div>
                    <div class="prod">
                        <figure>
                            <img src="img/blog-6.jpg" alt="sadasda">
                        </figure>
                        <figcaption>
                            <h4>Listra</h4>
                        </figcaption>
                    </div>
                    <div class="prod">
                        <figure>
                            <img src="img/blog-7.jpg" alt="sadasda">
                        </figure>
                        <figcaption>
                            <h4>Navalhado</h4>
                        </figcaption>
                    </div>
                    <div class="prod">
                        <figure>
                            <img src="img/blog-8.jpg" alt="sadasda">
                        </figure>
                        <figcaption>
                            <h4>Degradê</h4>
                        </figcaption>
                    </div>
                </div>
            </section>

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