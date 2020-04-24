/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import data.BancoDAO;
import entidades.Cliente;
import entidades.Cuenta;
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
public class vincular_cuenta extends HttpServlet {

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BancoDAO bancoDAO= new BancoDAO();
        String id_cliente=request.getParameter("Cliente_idCliente");
        String Num_Cuenta_vinculada=request.getParameter("Num_Cuenta_vinculada");
        Cliente cliente= new Cliente();
        cliente.setIdCliente(id_cliente);
        List clientes= bancoDAO.list(cliente);
        for(int i=0;i<clientes.size();i++){
            cliente=(Cliente) clientes.get(i);
            if(cliente.getIdCliente() == null ? id_cliente == null : cliente.getIdCliente().equals(id_cliente)){
                cliente=(Cliente) clientes.get(i);
                i=2*clientes.size();
            }
            
        }
        Cuenta cuenta= new Cuenta();
        cuenta.setNumCuenta(Num_Cuenta_vinculada);
        List cuentas= bancoDAO.list(cuenta);
        for(int i=0;i<cuentas.size();i++){
            cuenta= (Cuenta) cuentas.get(i);
            if(cuenta.getNumCuenta() == null ? Num_Cuenta_vinculada == null : cuenta.getNumCuenta().equals(Num_Cuenta_vinculada)){
                cuenta= (Cuenta) cuentas.get(i);
                i=cuentas.size()*2;
            }
        }
        
        Byte ownership=0;
       
        Vinculadas cuenta_vincular= new Vinculadas();
        cuenta_vincular.setCliente(cliente);
        cuenta_vincular.setCuenta(cuenta);
        int min = 11111;
      int max = 99999;
      //Generate random double value from 50 to 100 
      System.out.println("Random value in double from "+min+" to "+max+ ":");
      Integer random_number; 
      random_number = (int) (Math.random() * (max - min + 1) + min);
      cuenta_vincular.setVinId(random_number.toString());
      cuenta_vincular.setOwner(ownership);
      
      bancoDAO.insert(cuenta_vincular);
      RequestDispatcher rd= request.getRequestDispatcher("success.jsp");
      rd.forward(request, response);
        
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
