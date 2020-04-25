<%-- 
    Document   : Cajero_7_Salir
    Created on : Apr 25, 2020, 5:29:11 PM
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
    <script>
        function NoSalir(){
            hr
        }
    
    </script>
</head>
<body >
    <!-- Menu Encabezado-->
    <%@ include file="Cliente_0_Encabezado.jsp" %>

    <div>
        <H1 >Bienvenido <%= user.getNombre() %> - <%= user.getCedula() %></H1>
    </div>
    <div class="form">
        <form action="logout" method="post">
            <div>
                <div class="form-group" id="groupUsario">
                    <label for="cedula">Cedula:</label>
                    <input type="text" class="form-control" id="cedula" name="cedula">
                </div>
                <div class="form-group" id="groupPassword">
                    <label for="contraseña">Contraseña:</label>
                    <input type="password" class="form-control" id="password" name="password">
                </div>
                <button type="submit" class="btn btn-default">Si</button>
                <button onclick="location.href='Cajero_1_Inicio.jsp'" class="btn btn-default">No</button>
            </div>
        </form>
    </div>

    <!-- Menu Pie de Pagina-->
    <%@ include file="Footer.jsp" %>
    </body>
</html>
