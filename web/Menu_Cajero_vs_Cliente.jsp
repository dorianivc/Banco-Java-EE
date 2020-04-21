<%-- 
    Document   : Menu_Cajero_vs_Cliente
    Created on : 10-abr-2020, 0:48:18
    Author     : Monica
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="Head.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu_Cajero_vs_Cliente</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/cajerovscliente.js"></script>
        <link href="css/cajerovscliente.css" rel="stylesheet"/>
    </head>
    <body>
        
        <br><br>
        <center><h1>Seleccione el tipo de Usuario al que desee acceder.</h1></center>        
        <br><br>
        <div class="col-md-12 align-items-center center-block">

                <div class="col-md-2 ">
                </div>
            
                <div class="col-md-4 center-block">
                    <div class="card center-block" >                       
                        <img class="card-img-top img-responsive gray_image"  onclick="goTo(1)" id="img1" src="images/cajero.png" alt="Card image cap">
                        <div class="card-body">
                        </div>
                    </div>
                </div>

                <div class="col-md-4 ">
                    <div class="card center-block ">
                        <img class="card-img-top gray_image img-responsive" onclick="goTo(2)" id="img2" src="images/cliente.png" alt="Card image cap">
                        <div class="card-body"><center>
                        </center></div>
                    </div>
                </div>


            </div>
            <br>

        </div>
        
    </body>
</html>
