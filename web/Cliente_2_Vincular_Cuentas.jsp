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
                <table class="greenTable2" id="Moneda">
                    <thead>
                        <tr>
                            <th>Tipo de Moneda</th>
                            <th>Numero de Cuenta</th>
                            <th>Saldo</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr><%
                            for(Integer i=0;i<lista.size();i++){
                                vin = (Vinculadas)lista.get(i);
                                mon=(Moneda)lista.get(i);
                                String tipo=null;
                                switch(mon.getIdMoneda()){
                                    case 1: tipo="Colon";break;
                                    case 2: tipo="Dolar";break;
                                    case 3: tipo="Euro";break;
                                    default: tipo="Error Retrieving Data";break;
                            }%>
                            <td><%=tipo%></td>
                            <td><%=mon.getTasaDeInteres()%></td>
                            <td><%=mon.getTipoDeCambio()%></td>
                       </tr>    
                            <%}%>
                    </tbody>
                    </table>
                    <%
                    }catch(Exception ex){
                    System.out.println(ex.getMessage());
                    }%>
    </div>
    <div> 
        <H1 >Su dinero es nuestro intéres...</H1>
    </div>

    <!-- Menu Pie de Pagina-->
    <%@ include file="Footer.jsp" %>
</body>
</html>