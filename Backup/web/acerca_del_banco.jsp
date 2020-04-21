<%-- 
    Document   : tipo_de_cambio
    Created on : 12/04/2020, 01:34:51 AM
    Author     : leiner.arce
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="shortcut icon" href="images/logo.png">
    <%@ include file="Head.jsp" %>
    <title>Acerca del Banco</title> 
    <link rel="stylesheet" type="text/css" href="css/mapa.css">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="shortcut icon" href="images/logo.png">
</head>
<body >
    <!-- Menu Encabezado-->
    <%@ include file="Header.jsp" %>

    <div>
        <div class="container">
            <H1 >Bienvenido al Banco Toma Mi Dinero <span class="glyphicon glyphicon-briefcase"></span> </H1>
            <h2>Universidad Nacional</h2>
            <h3>Escuela de Informatica</h3>
            <br>Proyecto Programacion 4
            <br>1er Ciclo, 2020
            <br>Estudiantes:
            <br>Leiner Arce
            <br>Dorian Vallecillo
            <div id="map"></div>
        </div>
        <script>
            function initMap() {
                var uluru = {lat: 9.970767, lng: -84.128955};
                var map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 17,
                    center: uluru
                });
                var marker = new google.maps.Marker({
                    position: uluru,
                    map: map
                });
            }
        </script>
        <script async defer
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCfZBt9Gd3DunxS56TycRvP8mu1sIlb6fs&callback=initMap">
        </script>


    <!-- Menu Pie de Pagina-->
    <%@ include file="Footer.jsp" %>
</body>
</html>

