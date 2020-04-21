/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import entidades.Usuario;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Monica
 */
public class NewMain {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       
        BancoDAO bancoDAO = new BancoDAO();
        ArrayList<Object> lista= bancoDAO.list(new Usuario());
        lista.forEach(System.out::println);
    }
    
}
