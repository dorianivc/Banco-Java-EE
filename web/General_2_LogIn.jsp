<%-- 
    Document   : Vista_Login
    Created on : 09/03/2020, 01:27:32 PM
    Author     : dorianivc
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="entidades.Usuario"%>
<%@page import="data.BancoDAO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio de Sesion</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="shortcut icon" href="images/logo.png">
        <script src="js/login.js" type="text/javascript"></script>
    </head>
    <body>
        
        <!-- Menu Encabezado-->
        <%@ include file="General_0_Encabezado.jsp" %>
                
        <div class="container">
            <div class="row">
                <div class="col-md-4"> </div>
                <div id="encabezado" class="col-md-4">
                    <h1 id="texto">Banco Toma Mi Dinero</h1>
                    <img id="logo" src="images/tmd.jpg" class="img-rounded">
                    <div class="form">
                        <form action="login" method="post">
                            <div>
                                <div class="form-group" id="groupUsario">
                                    <label for="cedula">Cedula:</label>
                                    <input type="text" class="form-control" id="cedula" name="cedula">
                                </div>
                                <div class="form-group" id="groupPassword">
                                    <label for="contraseña">Contraseña:</label>
                                    <input type="password" class="form-control" id="password" name="password">
                                </div>
                                <button type="submit" class="btn btn-default" onClick="goto()" id="showInfo">Acceder</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-md-4"> </div>
            </div>
        </div>
        
        <!-- Modal -->
        <div class="container">
            <!-- The Modal -->
            <div class="modal" id="infoModal">
                <div class="modal-dialog">
                    <!-- Modal Content -->
                    <div class="modal-content">
                        <!-- Modal Header -->
                        <div class="modal-header text-center">
                            <h2 class="modal-title" id="infoModalTitle"> <span class="glyphicon glyphicon-info-sign"></span> &nbsp Error de acceso. &nbsp <span class="glyphicon glyphicon-info-sign"></span> </h2>
                        </div>
                        <!-- Modal body -->
                        <div class="modal-body">
                            <font size="4px" id="mensaje_error" color="red"><b> Por favor complete todos los campos </b></font><br>
                        </div>
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Aceptar</button>
                        </div>
                    </div>
                    <!-- End Modal Content -->
                </div>
            </div>
        </div>
        
        <!-- Menu Pie de Pagina-->
        <%@ include file="Footer.jsp" %>        
    </body>
</html>
