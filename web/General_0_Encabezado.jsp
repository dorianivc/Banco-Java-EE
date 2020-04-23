<%@page import="entidades.Usuario"%>
<% 
    HttpSession sesion = request.getSession();
    Usuario usuario = new Usuario();
    if (sesion.getAttribute("usuario") != null) {
        usuario = (Usuario) sesion.getAttribute("usuario");
    }
%>
    <link href="css/menu.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    
<header>
    
    <!-- Encabezado Titulo -->
    <div class="logo">
        &nbsp&nbsp&nbsp&nbsp
        <img src="images/tmd.jpg"> &nbsp&nbsp
        <span> Banco Toma Mi Dinero </span>
    </div> 
    
    <!-- Encbezado Menu -->
    <div class="menu">
        <ul> 
            <li><a href="General_1_Inicio.jsp">         Inicio              </a></li>
            <li><a href="General_2_LogIn.jsp">          Login               </a></li>
            <li><a href="General_3_Tipo_Cambio.jsp">    Tipo de Cambio      </a></li> 
            <li><a href="General_4_Acerca.jsp">         Acerca del Banco    </a></li>                 
        </ul>
    </div>
</header>          