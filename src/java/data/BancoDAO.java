/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import entidades.Usuario;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.*;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class BancoDAO {
    
    static Session session=null;

    public BancoDAO() {
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
    public void insert(Object user){
        session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx =session.beginTransaction();
        session.save(user);
        tx.commit();
        session.close();
    }
     public void delete(Object user){
        session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx =session.beginTransaction();
        session.delete(user);
        tx.commit();
        session.close();
    }
     public static void update(Object user){
        session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx =session.beginTransaction();
        session.update(user);
        tx.commit();
        session.close();
    }
     
    
   
}
