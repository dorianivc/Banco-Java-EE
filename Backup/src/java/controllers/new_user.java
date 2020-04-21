/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import data.BancoDAO;
import entidades.Cajero;
import entidades.Cliente;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entidades.Usuario;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;

/**
 *
 * @author dorianivc
 */

 
public class new_user extends HttpServlet {

    
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
       
        String nombre=request.getParameter("nombre");
        String apellido=request.getParameter("apellido");
        String password= request.getParameter("password");
        String tipo_usuario=request.getParameter("tipo_usuario");
        String cedula= request.getParameter("cedula");
        String telefono= request.getParameter("Numero_tel");
        Integer tipo_user= Integer.parseInt(tipo_usuario);
        Usuario usuario = new Usuario();
        usuario.setCedula(cedula);
        if(apellido != null){
            usuario.setNombre(nombre+" "+ apellido);
        }else{
            usuario.setNombre(nombre);
        }
        usuario.setPassword(password);
        usuario.setNumeroTel(telefono);
        usuario.setTipoUsuario(tipo_user);
        System.out.println("Cedula: "+ usuario.getCedula());
        switch (tipo_user) {
            case 0:
                {
                    Cliente cliente= new Cliente();
                    cliente.setIdCliente(cedula);
                    cliente.setUsuario(usuario);
                    try{
                        BancoDAO bancoDAO= new BancoDAO();
                        bancoDAO.insert(usuario);
                        bancoDAO.agregarCliente(cliente);
                    }catch(Exception se){
                        System.out.println(se.getMessage());
                    }           break;
                }
            case 1:
                {
                    Cajero cashier= new Cajero();
                    cashier.setIdCajero(cedula);
                    cashier.setUsuario(usuario);
                    try{
                        BancoDAO bancoDAO= new BancoDAO();
                        bancoDAO.insert(usuario);
                        bancoDAO.insert(cashier);
                    }catch(Exception se){
                        System.out.println(se.getMessage());
                    }           break;
                }
            case 2:
                {
                    Cajero cashier= new Cajero();
                    cashier.setIdCajero(usuario.getCedula());
                    cashier.setUsuario(usuario);
                    Cliente cliente= new Cliente();
                    
                    cliente.setIdCliente(usuario.getCedula());
                    cliente.setUsuario(usuario);
                    try{
                        BancoDAO bancoDAO= new BancoDAO();
                        bancoDAO.insert(usuario);
                        bancoDAO.insert(cliente);
                        bancoDAO.insert(cashier);
                    }catch(Exception se){
                        System.out.println(se.getMessage());
                    }         break;
                }
            default:
                break;
        }
         RequestDispatcher rd= request.getRequestDispatcher("success.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       // super.doGet(req, resp); //To change body of generated methods, choose Tools | Templates.
    }

    
   
}
