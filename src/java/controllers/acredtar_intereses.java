/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;


import data.BancoDAO;
import entidades.Cuenta;
import entidades.Movimiento;
import java.io.IOException;
import java.io.PrintWriter;
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
public class acredtar_intereses extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Boolean pass=false;
        try{
        Cuenta cuenta=null;
        BancoDAO bancoDAO= new BancoDAO();
        List cuentas= bancoDAO.list(new Cuenta());
        for(int i=0;i<cuentas.size();i++){
            cuenta= (Cuenta) cuentas.get(i);
            Float interes=cuenta.getMoneda().getTasaDeInteres();
            Float saldo_actual= cuenta.getSaldo();
            Float saldo_final=((saldo_actual*interes)/100 )+ saldo_actual;
            cuenta.setSaldo(saldo_final);
            bancoDAO.modificar_monto(cuenta, cuenta.getSaldo());
            Movimiento mov= new Movimiento();
            mov.setCuenta(cuenta);
            mov.setMonto((saldo_actual*interes)/100);
            mov.setMovFecha(new Date());
            mov.setMovId(i);
            mov.setDetalle("Intereses generados acreditados");
            bancoDAO.insert(mov);
            pass=true;
            
        }
        }catch(Exception se){
                System.out.println(se);
            
                }
       if(pass){
           RequestDispatcher rd= request.getRequestDispatcher("success.jsp");
            rd.forward(request, response);
       }else {
           RequestDispatcher rd= request.getRequestDispatcher("error.jsp");
            rd.forward(request, response);
       }
            
            
        }
        
    }

    

