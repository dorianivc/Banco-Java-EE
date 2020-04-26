<%-- 
    Document   : Cliente_4_Salir
    Created on : Apr 25, 2020, 5:11:42 PM
    Author     : leiner.arce
--%>

<%@page import="entidades.Cuenta"%>
<%@page import="entidades.Moneda"%>
<%@page import="data.BancoDAO"%>
<%@page import="java.util.List"%>
<% Usuario user = (Usuario) session.getAttribute("usuario");%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title> Banco Toma Mi Dinero</title> 
    <link rel="shortcut icon" href="images/logo.png">
</head>
<body >
    <!-- Menu Encabezado-->
    <%@ include file="Cliente_0_Encabezado.jsp" %>

    <div>
        <H1 >Bienvenido <%= user.getNombre() %> - <%= user.getCedula() %></H1>
    </div>
    <div class="form">
        <h3> Seguro que desea salir? </h3>
        <form action="logout" method="post">
            <button type="submit" class="btn btn-default">Si</button>
        </form>
            <button onclick="location.href='Cliente_1_Saldos.jsp'" class="btn btn-default">No</button>
        
    </div>

    <!-- Menu Pie de Pagina-->
    <%@ include file="Footer.jsp" %>
    </body>
</html>

   