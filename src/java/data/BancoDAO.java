/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import entidades.Usuario;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class BancoDAO {
    
    static Session session=null;

    public BancoDAO() {
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
