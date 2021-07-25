<%-- 
    Document   : conteudo
    Created on : 17/06/2021, 11:13:47
    Author     : Janderson
--%>

<%@page import="model.Funcionario"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<%

    String[] usuario = session.getValueNames();

   if(session.getAttribute("funcionario") != null){
        if (usuario[0].equals("funcionario")) {
        Funcionario fun = new Funcionario();
        fun = (Funcionario) session.getAttribute("funcionario");
        if (fun.getPerfil().getTitulo().equals("Barbeiro")) {
            out.print("Barbeiro");
        } else if (fun.getPerfil().getTitulo().equals("Atendente")) {
            out.print("Atendente");
        } else if (fun.getPerfil().getTitulo().equals("Gerente")) {
            out.print("Gerente");
        } else if (fun.getPerfil().getTitulo().equals("Administrador")) {
            out.print("Admin Barbeiro  Atendente   Gerente");
        }
    }
   }
%>
