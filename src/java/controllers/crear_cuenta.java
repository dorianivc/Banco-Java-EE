/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import data.BancoDAO;
import entidades.Cliente;
import entidades.Cuenta;
import entidades.Moneda;
import entidades.Usuario;
import entidades.Vinculadas;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Monica
 */
public class crear_cuenta extends HttpServlet {

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //Cargamos Datos del Usuario
        Usuario user= new Usuario();
        String cedula = request.getParameter("Cliente_idCliente");
        String limite_transferencia=request.getParameter("limite_transferencia");
       
        String moneda= request.getParameter("Moneda_idMoneda");
        user.setCedula(cedula);
        
        //Debemos verificar si el usuario ya existe como cliente
        try{
        BancoDAO bancoDao= new BancoDAO();
        List lista =bancoDao.list(new Cliente());
        List lista_moneda =bancoDao.list(new Moneda());
        Moneda colones=null;
        Moneda dolares=null;
        Moneda euros=null;
        for(int i=0;i<lista_moneda.size();i++){
            Moneda aux= (Moneda) lista_moneda.get(i);
            switch (aux.getIdMoneda()) {
                case 1:
                    colones=aux;
                    break;
                case 2:
                    dolares=aux;
                    break;
                case 3:
                    euros=aux;
                    break;
                default:
                    break;
            }
        }
        Cliente aux=null;
        Boolean es_cliente=false;
           for (int i=0;i<lista.size();i++){
            aux=(Cliente) lista.get(i);
            if(aux.getUsuario().getCedula().equals(cedula)){
                es_cliente=true;
                break;
            }
           }
        Moneda moneda_usada=null;
        if(es_cliente){
            String identificador_cuenta=null;
            switch(moneda){
                case "1": identificador_cuenta="001-";
                            moneda_usada=colones; break;
                case "2": identificador_cuenta="002-";
                            moneda_usada=dolares;break;
                case "3": identificador_cuenta="003-";
                            moneda_usada=euros;break;
            }
      int min = 11111;
      int max = 99999;
      //Generate random double value from 50 to 100 
      System.out.println("Random value in double from "+min+" to "+max+ ":");
      Integer random_number; 
      random_number = (int) (Math.random() * (max - min + 1) + min);
      String numero_cuenta=identificador_cuenta+ random_number.toString()+cedula;
      Cuenta cuenta= new Cuenta();
      cuenta.setNumCuenta(numero_cuenta);
      cuenta.setCliente(aux);
      cuenta.setMoneda(moneda_usada);
      cuenta.setSaldo(0);
      cuenta.setLimiteTransferencia(Integer.parseInt(limite_transferencia));
      bancoDao.insert(cuenta);
      Integer num_vinculacion = (int) (Math.random() * (max - min + 1) + min);
      Vinculadas cuenta_vinculada= new Vinculadas();
      cuenta_vinculada.setVinId(num_vinculacion.toString());
      cuenta_vinculada.setCuenta(cuenta);
      cuenta_vinculada.setCliente(aux);
      Byte es_owner=1;
      cuenta_vinculada.setOwner(es_owner);
      bancoDao.insert(cuenta_vinculada);
      RequestDispatcher rd= request.getRequestDispatcher("success.jsp");
      rd.forward(request, response);
      }else{//SI EL USUARIO NO EXISTE, SE CREA EN EL REGISTRO
      RequestDispatcher rd= request.getRequestDispatcher("registro_usuario.jsp");
      rd.forward(request, response);
      }
        
      //RequestDispatcher rd= request.getRequestDispatcher("error.jsp");
      //rd.forward(request, response);  
      
        }catch(IOException | NumberFormatException | ServletException se){
            System.out.println(se.getMessage());
        }

        
    }   

    

}
