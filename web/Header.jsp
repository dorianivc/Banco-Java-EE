<%@page import="entidades.Usuario"%>
<% 
    HttpSession sesion = request.getSession();
    Usuario usuario = new Usuario();
    if (sesion.getAttribute("usuario") != null) {
        usuario = (Usuario) sesion.getAttribute("usuario");
    }
%>

<header>
    <script>
        alert(<% usuario.getCedula(); %>);
    </script>
    
    <!-- Encabezado Titulo -->
    <div class="logo">
        &nbsp&nbsp&nbsp&nbsp
        <img src="images/tmd.jpg"> &nbsp&nbsp
        <span> Banco Toma Mi Dinero </span>
    </div> 
    
    <!-- Encbezado Menu -->
    <div class="menu">
        <ul> 
            <li>
              <a href="Index.jsp">Inicio</a>
            </li>
                <!-- Si usuario NO esta logueado -->
                <% if (usuario.getTipoUsuario() < 0 || usuario.getTipoUsuario() > 2){%>
                    <li>
                      <a href="Vista_Login.jsp">Login</a>
                    </li>
                    <li>
                      <a  href="tipo_de_cambio.jsp">Tipo de Cambio</a>
                    </li> 
                    <li>
                      <a  href="acerca_del_banco.jsp">Acerca del Banco</a>
                    </li> 
                <% }%>  
            
                <!-- Si usuario NO esta logueado -->
                <% if (usuario.getCedula() == "null"){%>
                    <li>
                      <a href="Vista_Login.jsp">Login</a>
                    </li>
                    <li >
                      <a  href="#">User:<%=usuario.getCedula()%></a>
                      <a  href="#">Usuario NO logueado</a>
                      <ul>  <!--submenu --> </ul>
                    </li> 
                <% }%>  
                
           
        </ul>
    </div>
</header>          