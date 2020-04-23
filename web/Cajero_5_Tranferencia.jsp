<%-- 
    Document   : Cajero_5_Tranferencia
    Created on : Apr 23, 2020, 8:52:11 AM
    Author     : leiner.arce
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
