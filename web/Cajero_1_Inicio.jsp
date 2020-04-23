<%-- 
    Document   : vista_usuario
    Created on : Apr 20, 2020, 12:08:11 AM
    Author     : leiner.arce
--%>

<%@page import="entidades.Moneda"%>
<%@page import="data.BancoDAO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="Head.jsp" %>
    <title> Banco Toma Mi Dinero</title> 
    <link rel="shortcut icon" href="images/logo.png">
</head>
<body >
    <!-- Menu Encabezado-->
    <%@ include file="Cajero_0_Encabezado.jsp" %>

    <div>
        <H1 >Bienvenido [Nombre de cajero] <span class="glyphicon glyphicon-briefcase"></span> </H1>
    </div>
    <img id="cajero" src="images/cajero.png">

    <!-- Menu Pie de Pagina-->
    <%@ include file="Footer.jsp" %>
</body>
</html>