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
            <li><a href="Cliente_1_Saldos.jsp">             Saldos              </a></li>
            <li><a href="Cliente_2_Vincular_Cuentas.jsp">   Vincular Cuentas    </a></li> 
            <li><a href="Cliente_3_Tranferencias.jsp">      Tranferencias       </a></li>                 
            <li><a href="Cliente_4_Salir.jsp">              Salir               </a></li>
        </ul>
    </div>
</header>          