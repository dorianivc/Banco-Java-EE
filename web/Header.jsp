<%@page import="entidades.Usuario"%>
<% Usuario usuario=  new Usuario("603","al","pass",1); /* null;*/  %>

<header>
    <div class="logo">
        <span>Banco Santander</span>
        <img src="images/logo.png">
    </div> 
    <div class="menu">
        <ul> 
              <li>
                <a href="Index.jsp">Inicio</a>
              </li>
                        <% if (usuario!=null){ %>
                <li>
                  <a href="Vista_Login.jsp">Cuentas</a>
                  <ul>  <!--submenu --> </ul>
                </li>                        
                <li >
                  <a  href="#">User:<%=usuario.getCedula()%></a>
                  <ul>  <!--submenu --> </ul>
                </li> 
                        <% } %>
                        <% if (usuario==null){%>
                <li>
                  <a href="Vista_Login.jsp">Login</a>
                </li>            
                        <% }%>             
            </ul>
    </div>
  </header>          

