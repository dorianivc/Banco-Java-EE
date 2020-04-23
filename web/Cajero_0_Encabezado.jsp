<%@page import="entidades.Usuario"%>
<% 
    HttpSession sesion = request.getSession();
    Usuario usuario = new Usuario();
    if (sesion.getAttribute("usuario") != null) {
        usuario = (Usuario) sesion.getAttribute("usuario");
    }
%>
    <script>
        function LogOut(){
            alert("adios");
            //Llmar al Servlet LogOut
        }
    </script>
    
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
            <li><a onclick="LogOut()">                  Salir               </a></li>
            <li><a href="Cajero_Abrir_Cuenta.jsp">      Abrir Cuenta        </a></li>
            <li><a href="Cajero_Deposito.jsp">          Deposito            </a></li> 
            <li><a href="Cajero_Retiro.jsp">            Retiro              </a></li>   
            <li><a href="Cajero_Tranferencia.jsp">      Tranferencia        </a></li>   
            <li><a href="Cajero_Acreditar.jsp">         Acreditar           </a></li>              
        </ul>
    </div>
</header>          