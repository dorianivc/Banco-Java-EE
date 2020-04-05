package controllers;

import Modelos.LoginBean;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dorianivc
 */
public class login extends HttpServlet {  
  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String name= request.getParameter("name");
        String password = request.getParameter("password");
        
        LoginBean bean = new LoginBean();
        bean.setName(name);
        bean.setPassword(password);
        
        boolean status=bean.validate();
        
        request.setAttribute("user", bean);
        
        if(status){
            RequestDispatcher rd= request.getRequestDispatcher("success.jsp");
            rd.forward(request, response);
            
        } else{
            RequestDispatcher rd= request.getRequestDispatcher("error.jsp");
            rd.forward(request, response);
        }
    }

  
   
}
