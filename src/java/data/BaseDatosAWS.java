
package data;

import static com.mysql.cj.conf.PropertyKey.PORT;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;




public class BaseDatosAWS {
    public Connection conexion;
   
   
    
    
       public BaseDatosAWS(){
        //System.out.println("----MySQL JDBC Connection Testing -------");
          try {
        Class.forName("com.mysql.cj.jdbc.Driver");
                } catch (ClassNotFoundException e) {
                    System.out.println("Where is your MySQL JDBC Driver?");
                    return ;
                }
        System.out.println("MySQL JDBC Driver Registered!");
        this.conexion=null;
         try {
        conexion = DriverManager.
                getConnection("jdbc:mysql://" + "dorian-database.cy1hmbiynvfm.us-east-1.rds.amazonaws.com" + ":" +"3306" + "/" + "Banco", "banco", "banco");
             System.out.println("jdbc:mysql://" + "dorian-database.cy1hmbiynvfm.us-east-1.rds.amazonaws.com" + ":" +"3306" + "/" + "Banco");
        } catch (SQLException e) {
        System.out.println("Connection Failed!:\n" + e.getMessage());
            }
         try{
          
         }catch(Exception se){
             System.out.println(se.getMessage());
         }
         }
   
    
    

}
