<%-- 
    Document   : tipo_de_cambio
    Created on : 12/04/2020, 01:34:51 AM
    Author     : leiner.arce
--%>

<%@page import="entidades.Moneda"%>
<%@page import="data.BancoDAO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Tipo de Cambio</title> 
    <link rel="shortcut icon" href="images/logo.png">
</head>
<body >
    <!-- Menu Encabezado-->
    <%@ include file="General_0_Encabezado.jsp" %>

    <div>
        <H1 >Bienvenido al Banco Toma Mi Dinero <span class="glyphicon glyphicon-briefcase"></span> </H1>
    </div>
    <div>
        <H1 >La tasa de interés y el tipo de cambio son:</H1>
            <%
            List lista=null;
            
            try{
                BancoDAO bancoDao= new BancoDAO();
                Moneda mon = new Moneda();
                lista=bancoDao.list(mon);
            %>
                <table class="greenTable2" id="Moneda">
                    <thead>
                        <tr>
                            <th>Tipo de Moneda</th>
                            <th>Tasa de Interés *</th>
                            <th>Tipo de Cambio **</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr><%
                            for(Integer i=0;i<lista.size();i++){
                                mon=(Moneda)lista.get(i);
                                String tipo=null;
                                switch(mon.getIdMoneda()){
                                    case 1:tipo="Colon";break;
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
                <H3>* = Puede variar</H3>
                <H3>** = En relación al Colon (CRC), puede variar en cualquier momento</H3>
    </div>

    <!-- Menu Pie de Pagina-->
    <%@ include file="Footer.jsp" %>
</body>
</html>
