<%-- 
    Document   : registro_usuario
    Created on : 09/03/2020, 06:56:19 PM
    Author     : dorianivc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entidades.Usuario"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Usuarios</title>
    </head>
    <body>
        <h1>Creando Usuario</h1>
        <form action="new_user" method="post">
        <table>
            <tbody>
                <tr>
                    <th>Cedula: </th>
                    <th><input type="text" name="cedula"> </th>
                </tr>
                <tr>
                    <th> Nombre: </th>
                    <th><input type="text" name="nombre"> </th>
                    <th> Apellido: </th>
                    <th><input type="text" name="apellido"> </th>
                </tr>
                <tr>
                    <th>Password: </th>
                    <th><input type="password" name="password"></th>
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
        <button type="submit">
            Crear
        </button>
        </form>
    </body>
</html>
