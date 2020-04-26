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
<div>
        <H1> Seleccione su cuenta y digite el monte a transferir</H1>
            <%
            List lista=null;
            List listaVinc=null;
            
            try{
                BancoDAO bancoDao= new BancoDAO();
                Cuenta con = new Cuenta();
                Vinculadas vin = new Vinculadas();
                lista = bancoDao.list(con);
                listaVinc=bancoDao.cuentasVinculas(user.getCedula());
            %>
                <table class="greenTable2" id="Cuentas_Propias">
                    <thead>
                        <tr>
                            <th>Usar</th>
                            <th>Tipo de Moneda</th>
                            <th>Numero de Cuenta</th>
                            <th>Saldo</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr><%
                            for(Integer i=0;i<lista.size();i++){
                                con=(Cuenta)lista.get(i);
                                if(user.getCedula().equals(con.getCliente().getIdCliente())){
                                    String tipo=null;
                                    switch(con.getMoneda().getIdMoneda()){
                                        case 1:tipo="Colon";break;
                                        case 2: tipo="Dolar";break;
                                        case 3: tipo="Euro";break;
                                        default: tipo="Error Retrieving Data";break;
                                    }%>
                                    <td> <input type="checkbox" id="<%= con.getNumCuenta() %>" value="<%= con.getNumCuenta() %>" onchange="modificar('<%= con.getNumCuenta().toString() %>')"> </td>
                                    <td><%=tipo%></td>
                                    <td><%= con.getNumCuenta() %></td>
                                    <td><%= con.getSaldo() %></td>
                                <%}%>
                       </tr>    
                            <%}%>
                    </tbody>
                    </table>
        
                    <table class="greenTable2" id="CuentasVinculadas">
                    <thead>
                        <tr>
                            <th>Usar</th>
                            <th>Tipo de Moneda</th>
                            <th>Numero de Cuenta</th>
                            <th>Saldo</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            
                            <%
                            for(Integer x=0; x<lista.size(); x++){
                                vin = (Vinculadas)lista.get(x);
                                String tipo=null;
                                    switch(vin.getCuenta().getMoneda().getIdMoneda()){
                                        case 1:tipo="Colon";break;
                                        case 2: tipo="Dolar";break;
                                        case 3: tipo="Euro";break;
                                        default: tipo="Error Retrieving Data";break;
                                    }%>             
                            <td> <input type="checkbox" id="<%= vin.getCuenta().getNumCuenta() %>" value="<%= vin.getCuenta().getNumCuenta() %>" onchange="modificar('<%= con.getNumCuenta().toString() %>')"> </td>
                            <td><%=tipo%></td>
                            <td> <%=vin.getCuenta().getNumCuenta() %></td>
                            <td> <%=vin.getCuenta().getCliente().getUsuario().getNombre() %></td>
                        </tr>    
                            <%}%>
                    </tbody>
                    </table>
                    
                    <div class="form">
                        <form action="transferencia" method="post">
                            <div>
                                <div class="form-group">
                                    <label for="cuenta">Numero de Cuenta: [Origen]</label>
                                    <input type="text" class="form-control" id="cuenta" name="cuenta_origen">
                                </div>
                                <div class="form-group">
                                    <label for="cuenta">Numero de Cuenta: [Vinculada]</label>
                                    <input type="text" class="form-control" id="cuenta" name="cuenta">
                                </div>                                
                                <div class="form-group">
                                    <label for="monto">Monto a transferir:</label>
                                    <input type="text" class="form-control" id="monto" name="monto">
                                </div>
                                <button type="submit" class="btn btn-default">Trasnferir</button>
                            </div>
                        </form>
                    </div>
                    
                    <%
                    }catch(Exception ex){
                    System.out.println(ex.getMessage());
                    }%>
    </div>

    <!-- Menu Pie de Pagina-->
    <%@ include file="Footer.jsp" %>
    
    <script>
        function modificar(num_cuenta){
            document.getElementById("cuenta").value = num_cuenta;
        }   
        
    </script>
</body>
</html>