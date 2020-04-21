<%-- 
    Document   : abrir_cuenta
    Created on : 19-abr-2020, 20:31:08
    Author     : Monica
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        
        <form action="crear_cuenta" method="post">
  <label for="name">Cedula del Cliente </label
  ><br /> <input name="Cliente_idCliente" type="text" value="" /> <br /> <label for="Monedas">Eliga una moneda por favor: </label>
<select name="Moneda_idMoneda">
<option value="1">Colones</option>
<option value="2">Dolares</option>
<option value="3">Euros</option>
</select>
  <br /> <br /> 
  <label for="name">Limite de transferencia diaria en su moneda </label><br /> <input name="limite_transferencia" type="text" value="100" /> 
    <button type="submit" value="Submit" >Crear</button>
    </form>
    
    
    </body>
</html>
