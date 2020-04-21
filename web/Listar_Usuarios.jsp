<%-- 
    Document   : Listar_Usuarios
    Created on : 09-abr-2020, 20:38:45
    Author     : Monica
--%>

<%@page import="java.util.ArrayList"%>
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

     
        <h1>Listado General</h1>
        <%
            List lista=null;
            
            try{
                BancoDAO bancoDao= new BancoDAO();
                Usuario user= new Usuario();
                lista=bancoDao.list(user);
            %>
            <table class="greenTable" id="General">

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
                    for(Integer i=0;i<lista.size();i++){
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
        
        
        
        <!-- Inicio Tabla Clientes-->
        
        <%
            //Nomenclatura de Listas Java 5
            List<Usuario> listaCliente = new ArrayList();
            List<Usuario> listaCajero = new ArrayList();
            List<Usuario> listaAmbos = new ArrayList();
            try{
                BancoDAO dao= new BancoDAO();
                Usuario usu = new Usuario();
                lista = dao.list(usu);
                for(Integer contadorlista=0; contadorlista < lista.size(); contadorlista++){
                    usu=(Usuario)lista.get(contadorlista);
                    
                    if(usu.getTipoUsuario()==0){
                        listaCliente.add(usu);
                    }//Lista de Clientes
                    if(usu.getTipoUsuario()==1){
                        listaCajero.add(usu);
                    }//Lista de Cajero
                    if(usu.getTipoUsuario()==2){
                        listaAmbos.add(usu);
                    }//Lista de Ambos
                }
            %>
            
            <table class="greenTable" id="Clientes">
            <thead>
                <h1>Listado de Clientes</h1>
                <tr>
                    <th>Cedula</th>
                    <th>Nombre</th>
                    <th>Numero de Telefono</th>
                </tr>
            </thead>
            <tbody>
               <tr>
                   <%
                    for(Integer contadorCliente=0; contadorCliente<listaCliente.size(); contadorCliente++){
                        usu=(Usuario)listaCliente.get(contadorCliente);
                        String tipo=null;
                   %>
                    <td><%=usu.getCedula()%></td>
                    <td><%=usu.getNombre()%></td>
                    <td><%=usu.getNumeroTel()%></td>
                </tr>    
                    <% }%>
            </tbody>
            </table>
            
            <table class="greenTable" id="Cajeros">
            <thead>
                <h1>Listado de Cajeros</h1>
                <tr>
                    <th>Cedula</th>
                    <th>Nombre</th>
                    <th>Numero de Telefono</th>
                </tr>
            </thead>
            <tbody>
               <tr>
                   <%
                    for(Integer contadorCajero=0; contadorCajero< listaCajero.size(); contadorCajero++){
                        usu=(Usuario)listaCajero.get(contadorCajero);
                        String tipo=null;
                   %>
                    <td><%=usu.getCedula()%></td>
                    <td><%=usu.getNombre()%></td>
                    <td><%=usu.getNumeroTel()%></td>
                </tr>    
                    <% }%>
            </tbody>
            </table>
            
            <table class="greenTable" id="Ambos">
            <thead>
                <h1>Listado de Doble Tipo</h1>
                <tr>
                    <th>Cedula</th>
                    <th>Nombre</th>
                    <th>Numero de Telefono</th>
                </tr>
            </thead>
            <tbody>
               <tr>
                   <%
                    for(Integer contadorAmbos=0; contadorAmbos< listaAmbos.size(); contadorAmbos++){
                        usu=(Usuario)listaAmbos.get(contadorAmbos);
                        String tipo=null;
                   %>
                    <td><%=usu.getCedula()%></td>
                    <td><%=usu.getNombre()%></td>
                    <td><%=usu.getNumeroTel()%></td>
                </tr>    
                    <% }%>
            </tbody>
            </table>
            
        <%
        }catch(Exception ex){
        System.out.println(ex.getMessage());
        }%>
        <!-- FIn Tabla Clientes-->
    </body>
</html>
