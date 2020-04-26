/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;


import entidades.Cajero;
import entidades.Cliente;
import entidades.Cuenta;
import entidades.Usuario;
import entidades.Vinculadas;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.*;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import java.io.BufferedInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.Socket;
import java.net.URL;
import org.json.JSONObject;
import java.io.*;
import java.net.*;
import javax.xml.registry.infomodel.User;
import org.hibernate.HibernateException;


public class BancoDAO {
    
    public Session session=null;
    public BaseDatosAWS db= new BaseDatosAWS();

    public BancoDAO() {
    }

    public  Session getSession() {
        return session;
    }

    public void setSession(Session session) {
        session = session;
    }

    public BaseDatosAWS getDb() {
        return db;
    }

    public void setDb(BaseDatosAWS db) {
        this.db = db;
    }
    
    
     
    public int executeUpdate(String statement) {
        try {
            Statement stm = db.conexion.createStatement();
            stm.executeUpdate(statement);
            System.out.println("stament ejecudado");
            return stm.getUpdateCount();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return 0;
    }
    
public void modificar_monto(Cuenta cuenta, Float saldo){
    try{
      StringBuilder result = new StringBuilder();
      URL url = new URL("http://university-testing.azurewebsites.net/api/modify_account?num_cuenta=" + cuenta.getNumCuenta()+"&saldo="+saldo.toString());
      System.out.println("http://university-testing.azurewebsites.net/api/modify_account?num_cuenta=" + cuenta.getNumCuenta()+"&saldo="+saldo.toString());
      URLConnection conn = url.openConnection();
      InputStream is = conn.getInputStream();
      BufferedReader br= new BufferedReader(new InputStreamReader(conn.getInputStream()));
       String t;
      String html = null;
        while((t=br.readLine())!=null) {
           System.out.println(t);
        }
       System.out.println("Modificacion de montos listos");
       }catch(IOException se){
           System.out.println(se.getMessage());
       }
           
}
     
public void agregarCajero(Cajero cajero)  {
       try{
      StringBuilder result = new StringBuilder();
      URL url = new URL("http://university-testing.azurewebsites.net/api/addCajero?cedula=" + cajero.getIdCajero());
      System.out.println("http://university-testing.azurewebsites.net/api/addCajero?cedula=" + cajero.getIdCajero());
      URLConnection conn = url.openConnection();
      InputStream is = conn.getInputStream();
      BufferedReader br= new BufferedReader(new InputStreamReader(conn.getInputStream()));
       String t;
      String html = null;
        while((t=br.readLine())!=null) {
           System.out.println(t);
        }
       System.out.println("Insercion de Cajero listo");
       }catch(Exception se){
           System.out.println(se.getMessage());
       }
           
           
    }
   public void agregarCliente(Cliente clientes)  {
       try{
      StringBuilder result = new StringBuilder();
      URL url = new URL("http://university-testing.azurewebsites.net/api/AddClient?cedula=" + clientes.getIdCliente());
      System.out.println("http://university-testing.azurewebsites.net/api/AddClient?cedula=" + clientes.getIdCliente());
      URLConnection conn = url.openConnection();
      InputStream is = conn.getInputStream();
      BufferedReader br= new BufferedReader(new InputStreamReader(conn.getInputStream()));
       String t;
      String html = null;
        while((t=br.readLine())!=null) {
           System.out.println(t);
        }
       System.out.println("Insercion de Cliente listo");
       }catch(Exception se){
           System.out.println(se.getMessage());
       }
           
           
    }

   
    
    
    public Integer authUser(Usuario obj){
     session=HibernateUtil.getSessionFactory().openSession();
     Transaction tx =session.beginTransaction();
     Usuario ram=null;
     try{
         ram = (Usuario)session.load(entidades.Usuario.class, obj.getCedula()); 
     }catch(Exception se){
         System.out.println(se.getMessage());
         return -1;
     }
     if(ram==null){
         return -1;
     }else if(obj.getPassword().equals(ram.getPassword())){
         return ram.getTipoUsuario();
         }
     return -1;
    }
    
    public ArrayList <Object> list(Object object){
     session=HibernateUtil.getSessionFactory().openSession();
     Transaction tx =session.beginTransaction();
     String HQL=" from "+ object.getClass().getName();
     Query query= session.createQuery(HQL);
     ArrayList<Object> lista= (ArrayList<Object>) query.list();
     tx.commit();
     return lista;
    }
    
    public ArrayList <User> buscarUsuario(String cedula){
        session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx =session.beginTransaction();
        String HQL="from Usuario where cedula = '" + cedula + "'";
        Query query= session.createQuery(HQL);
        ArrayList<User> lista= (ArrayList<User>) query.list();
        tx.commit();
        return lista;
    }
    
    public ArrayList <Vinculadas> cuentasVinculas(String cedula){
        session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx =session.beginTransaction();
        String HQL="from Vinculadas where Cliente_idCliente ='" + cedula + "'";
        Query query= session.createQuery(HQL);
        ArrayList<Vinculadas> lista= (ArrayList<Vinculadas>) query.list();
        tx.commit();
        return lista;
    }
    
    public ArrayList <Cuenta> buscarCuenta(String numero_cuenta){
        session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx =session.beginTransaction();
        String HQL="SELECT * FROM Cuenta where num_Cuenta = '" + numero_cuenta + "'";
        Query query= session.createQuery(HQL);
        ArrayList<Cuenta> lista= (ArrayList<Cuenta>) query.list();
        tx.commit();
        return lista;
    }
    
    public void insert(Object user){
        session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx =session.beginTransaction();
        session.save(user);
        tx.commit();
        session.close();
    }
     public void insert_deposito(Object user){
         Transaction tx = null;
         try{
        session=HibernateUtil.getSessionFactory().openSession();
        
        tx =session.beginTransaction();
        session.update(user);
        tx.commit();
        session.close(); 
         }catch (HibernateException e) {
         if (tx!=null){
             tx.rollback();
             e.printStackTrace(); 
         }
         
      }finally {
         session.close(); 
      }
         }
       
    
     public void delete(Object user){
        session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx =session.beginTransaction();
        session.delete(user);
        tx.commit();
        session.close();
    }
    public void close_session(){
        HibernateUtil.getSessionFactory().close();
    }
     public void update(Object user){
        session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx =session.beginTransaction();
        session.update(user);
        tx.commit();
        session.close();
    }
     
    
   
}
