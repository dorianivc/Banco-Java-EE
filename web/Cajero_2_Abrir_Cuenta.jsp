<%-- 
    Document   : Cajero_2_Abrir_Cuenta
    Created on : Apr 23, 2020, 8:51:05 AM
    Author     : leiner.arce
--%>

<!DOCTYPE html>
<html>
<head>
    <title> Banco Toma Mi Dinero</title> 
    <link rel="shortcut icon" href="images/logo.png">
</head>
<body >
    <!-- Menu Encabezado-->
    <%@ include file="Cajero_0_Encabezado.jsp" %>

        <h1>Creación de nueva cuenta.</h1>
        <h2>Por favor solicite los siguientes datos al cliente.</h2>
        <form action="new_user" method="post">
        <table class="steelBlueCols">
            <tbody>
                <tr>
                    <th>Cedula: </th>
                    <th><input type="text" name="cedula"> </th>
                </tr>
                <tr>
                    <th> Nombre: </th>
                    <th><input type="text" name="nombre"> </th>
                </tr>
                <tr>
                    <th> Apellido: </th>
                    <th><input type="text" name="apellido"> </th>
                </tr>
                <tr>
                    <th>Password: </th>
                    <th><input type="password" name="password"></th>
                </tr>
                 <tr>
                    <th>Numero de Telefono: </th>
                    <th><input type="text" name="Numero_tel"></th>
                </tr>
                <tr>
                    <th> Tipo de Usuario</th>
                    <th> 
                        <select name="tipo_usuario">
                            <option value="0">Cliente</option>
                            <option value="1">Cajero</option>
                            <option value="2">Cajero y Cliente</option>
                        </select>                      
                    </th>
                </tr>
            </tbody>
        </table>
            <br>
        <button type="submit">
            Crear
        </button>
        </form>
    <!-- Menu Pie de Pagina-->
    <%@ include file="Footer.jsp" %>
</body>
</html>
