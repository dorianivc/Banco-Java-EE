/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import entidades.Usuario;

/**
 *
 * @author Monica
 */
public class NewMain {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Usuario user= new Usuario("44432","DDDDD", "pass", 1);
        BancoDAO bancoDAO = new BancoDAO();
        bancoDAO.insert(user);
    }
    
}
