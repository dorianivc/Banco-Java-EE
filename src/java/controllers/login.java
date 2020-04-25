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
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
        
        String cedula = request.getParameter("cedula");
        String password = request.getParameter("password");
        
        boolean respuesta;
        try (PrintWriter out = response.getWriter()) {
            
            List lista = null;
            List lista2 = null;
            try{
                BancoDAO bancoDao= new BancoDAO();
                Usuario user = new Usuario();
                lista=bancoDao.buscarUsuario(cedula);
                if (lista.size() == 1){
                    user = (Usuario)lista.get(0);   
                    if( user.getPassword().equals(password) ){
                        int tipo = user.getTipoUsuario();
                        HttpSession s = request.getSession(true);
                        switch (tipo) {
                                case 0:
                                    s.setAttribute("usuario", user);
                                    request.getRequestDispatcher("Cliente_1_Saldos.jsp").forward(request, response);
                                case 1:
                                    s.setAttribute("usuario", user);
                                    request.getRequestDispatcher("Cajero_1_Inicio.jsp").forward(request, response);
                                case 2:
                                    s.setAttribute("usuario", user);
                                    request.getRequestDispatcher("Menu_Cajero_vs_Cliente.jsp").forward(request, response);
                            }
                    }
                } else {
                    request.getRequestDispatcher("General_2_Login_Error.jsp").forward(request, response);
                }
                        
                        
                for(Integer i=0;i<lista.size();i++){
                    //recorremos la lista
                    user=(Usuario)lista.get(i);   
                    if( user.getCedula().equals(cedula) ){
                        HttpSession session = request.getSession(true);
                        if( user.getPassword().equals(password) ){
                            
                            //Usuario Logueado de forma exitosa
                            int tipo = user.getTipoUsuario();
                            HttpSession s = request.getSession(true);
                            
                            switch (tipo) {
                                case 0:
                                    s.setAttribute("usuario", user);
                                    request.getRequestDispatcher("Cliente_1_Saldos.jsp").forward(request, response);
                                case 1:
                                    s.setAttribute("usuario", user);
                                    request.getRequestDispatcher("Cajero_1_Inicio.jsp").forward(request, response);
                                case 2:
                                    s.setAttribute("usuario", user);
                                    request.getRequestDispatcher("Menu_Cajero_vs_Cliente.jsp").forward(request, response);
                            }
                            }//preguntamos si la contraseña ingresada es igual a alguna de la base de datos                
                        }//preguntamos si la cedula ingresada es igual a alguna de la base de datos
                }// fin for recorrer lista

            }catch(Exception ex){
            System.out.println(ex.getMessage());
            } 
    
    }
}
}