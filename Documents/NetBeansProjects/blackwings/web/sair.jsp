
<%
    try {
        if (session != null) {
            String[] user = session.getValueNames();
            session.invalidate();
            session = request.getSession(false);
            if (!user[0].equals("funcionario")) {
                response.sendRedirect("index.jsp");
            } else {
                response.sendRedirect("login_funcionario.jsp");
            }
        }
    } catch (Exception e) {
        response.sendRedirect("index.jsp");
    }
%>