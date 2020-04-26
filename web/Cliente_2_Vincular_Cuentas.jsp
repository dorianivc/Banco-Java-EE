<%-- 
    Document   : vista_usuario
    Created on : Apr 20, 2020, 12:08:11 AM
    Author     : leiner.arce
--%>

<%@page import="entidades.Vinculadas"%>
<%@page import="entidades.Cuenta"%>
<% Usuario user = (Usuario) session.getAttribute("usuario");%>
<%@page import="entidades.Moneda"%>
<%@page import="data.BancoDAO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title> Banco Toma Mi Dinero</title> 
    <link rel="shortcut icon" href="images/logo.png">
</head>
<body >
    <!-- Menu Encabezado-->
    <%@ include file="Cliente_0_Encabezado.jsp" %>

    <div>
        <H1 >Bienvenido <%= user.getNombre() %> - <%= user.getCedula() %></H1>
    </div>
    
        <H1 >Sus cuentas vinculadas:</H1>
            <%
            List lista=null;
            
            try{
                BancoDAO bancoDao= new BancoDAO();
                Moneda mon = new Moneda();
                lista=bancoDao.cuentasVinculas(user.getCedula());
                Vinculadas vin = new Vinculadas();
                vin.getCuenta();
                
            %>

            Digite el numero de cedula del propietario de la cuenta a agregar:
            <div class="form">
                <form action="vincular_cuenta" method="post">
                    <div>
                        <div class="form-group" id="groupUsario">
                            <label for="cedula">Cedula:</label>
                            <input type="text" class="form-control" id="cedula" name="cedula">
                        </div>
                        <button type="submit" class="btn btn-default">Acceder</button>
                    </div>
                </form>
            </div>           
            
            <br><br>
            Cantidad de cuentas vinculadas: <%= lista.size() %>
            <br><br>
                <table class="greenTable2" id="Vinculadas">
                    <thead>
                        <tr>
                            <th>Numero de Cuenta</th>
                            <th>Propietario</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            
                            <%
                            for(Integer i=0; i<lista.size(); i++){
                                vin = (Vinculadas)lista.get(i);
                                %>                                
                            <td> <%=vin.getCuenta().getNumCuenta() %></td>
                            <td> <%=vin.getCuenta().getCliente().getUsuario().getNombre() %></td>
                        </tr>    
                            <%}%>
                    </tbody>
                    </table>
                    <%
                    }catch(Exception ex){
                    System.out.println(ex.getMessage());
                    }%>
    

    <!-- Menu Pie de Pagina-->
    <%@ include file="Footer.jsp" %>
</body>
</html>