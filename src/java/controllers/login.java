/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import data.BancoDAO;
import entidades.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Monica
 */
public class login extends HttpServlet {

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
        
      
        String cedula= request.getParameter("cedula");
        String password= request.getParameter("password");
        BancoDAO banco= new BancoDAO();
        Usuario user= new Usuario();
        user.setCedula(cedula);
        user.setPassword(password);
        
        int result= -1;
        try{
            result=banco.authUser(user);
        }catch(Exception se){
            System.out.println(se.getMessage());
            result=-1;
        }
        
        switch (result) {
            case -1:
                {
                    RequestDispatcher rd= request.getRequestDispatcher("error.jsp");
                    rd.forward(request, response);
                    break;
                }
            case 0:
                {
                    RequestDispatcher rd= request.getRequestDispatcher("Index.jsp?cedula="+user.getCedula());
                    rd.forward(request, response);
                    break; 
                }
            case 1:
                {
                    RequestDispatcher rd= request.getRequestDispatcher("Listar_Usuarios.jsp");
                    rd.forward(request, response);
                    break;
                }
            case 2:
                {
                    RequestDispatcher rd= request.getRequestDispatcher("Menu_Cajero_vs_Cliente.jsp");
                    rd.forward(request, response);
                    break;
                }
            default:
                break;
        }
        
        
        
      
        
       
        
    }
       
    }

  
