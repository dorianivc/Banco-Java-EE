<%-- 
    Document   : Listar_Usuarios
    Created on : 09-abr-2020, 20:38:45
    Author     : Monica
--%>

<%@page import="entidades.Usuario"%>
<%@page import="data.BancoDAO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <%@ include file="Head.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de Clientes</title>
    </head>
    <body>

     
        <h1>Listado de Clientes</h1>
        <%
            List lista=null;
            
            try{
                BancoDAO bancoDao= new BancoDAO();
                Usuario user= new Usuario();
                lista=bancoDao.list(user);
            %>
           <table class="greenTable">

           <thead>
            <tr>
            <th>Cedula</th>
            <th>Nombre</th>
            <th>Numero de Telefono</th>
            <th>Tipo Usuario</th>
            </tr>
           </thead>
           <tbody>
               <tr>
                   <%
                for(Integer i=0;i<100;i++){
                user=(Usuario)lista.get(i);
                String tipo=null;
                switch(user.getTipoUsuario()){
                    case 0: tipo="Cliente";break;
                    case 1:tipo="Cajero";break;
                    case 2: tipo="Cliente y Cajero";break;
                    default: tipo="Error Retrieving Data";break;
                }
                   %>
           <td><%=user.getCedula()%></td>
           <td><%=user.getNombre()%></td>
           <td><%=user.getNumeroTel()%></td>
           <td><%=tipo%></td>
           </tr>    
           <% }%>
          </tbody>
          </table>
            
       <%
        }catch(Exception ex){
        System.out.println(ex.getMessage());
        }%>
    </body>
</html>
