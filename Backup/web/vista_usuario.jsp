<%-- 
    Document   : vista_usuario
    Created on : Apr 20, 2020, 12:08:11 AM
    Author     : leiner.arce
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<%@ include file="Header.jsp" %>
                
        <div class="container">
            <div class="row">
                <div class="col-md-4"> </div>
                <div id="encabezado" class="col-md-4">
                    <h1 id="texto">Banco Toma Mi Dinero</h1>
                    <img id="logo" src="images/tmd.jpg" class="img-rounded">
                    <div class="form">
                        <div>
                            <div class="form-group" id="groupUsario">
                                <label for="cedula">Cedula:</label>
                                <input type="text" class="form-control" id="cedula">
                            </div>
                            <div class="form-group" id="groupPassword">
                                <label for="contraseña">Contraseña:</label>
                                <input type="password" class="form-control" id="contraseña">
                            </div>
                            <button type="submit" class="btn btn-default" onClick="goto()" id="showInfo">Acceder</button>
                        </div>
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
