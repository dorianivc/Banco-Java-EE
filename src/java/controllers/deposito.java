/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import data.BancoDAO;
import entidades.Cliente;
import entidades.Cuenta;
import entidades.Movimiento;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Array;
import java.util.ArrayList;
import java.util.Date;
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
public class deposito extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
  

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String monto_str=  request.getParameter("monto_a_depositar");
        System.out.println("Monto: "+ monto_str);
        float monto=Float.parseFloat(monto_str);
        String num_cuenta= request.getParameter("numero_cuenta");
        System.out.println("Numero de cuenta: "+ num_cuenta);
        String detalle= request.getParameter("detalle");
        Movimiento deposito = new Movimiento();
        BancoDAO bancoDAO= new BancoDAO();
        List cuentas=bancoDAO.list(new Cuenta());
       
        Cuenta cuenta=null;
        Boolean pass=false;
        for(int i=0;i<cuentas.size();i++){
            cuenta=(Cuenta) cuentas.get(i);
            if(cuenta.getNumCuenta() == null ? num_cuenta == null : cuenta.getNumCuenta().equals(num_cuenta)){
                cuenta=(Cuenta) cuentas.get(i);
                cuenta.setSaldo(cuenta.getSaldo()+monto);
              
               // bancoDAO.update(cuenta);
                
                deposito.setCuenta(cuenta);
                deposito.setDetalle(detalle);
                deposito.setMonto(monto);
                deposito.setMovFecha(new Date());
                deposito.setMovId(1);
                bancoDAO= new BancoDAO();
                bancoDAO.insert(deposito);
                pass=true;
                i=2*cuentas.size();
            }
            
          }
        if(pass){
             RequestDispatcher rd= request.getRequestDispatcher("success.jsp");
             
             bancoDAO.insert_deposito(cuenta);//error al hacer update, utilizare serverless function
             rd.forward(request, response);
             
        }else{
            RequestDispatcher rd= request.getRequestDispatcher("error.jsp");
                rd.forward(request, response);
        }
        
        }
    

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
