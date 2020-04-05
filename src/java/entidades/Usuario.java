package entidades;
// Generated 03-abr-2020 21:52:00 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Usuario generated by hbm2java
 */
public class Usuario  implements java.io.Serializable {


     private String cedula;
     private String nombre;
     private String password;
     private int tipoUsuario;
     private Set<Cajero> cajeros = new HashSet<Cajero>(0);
     private Set<Cliente> clientes = new HashSet<Cliente>(0);

    public Usuario() {
    }

	
    public Usuario(String cedula, String nombre, String password, int tipoUsuario) {
        this.cedula = cedula;
        this.nombre = nombre;
        this.password = password;
        this.tipoUsuario = tipoUsuario;
    }
    public Usuario(String cedula, String nombre, String password, int tipoUsuario, Set<Cajero> cajeros, Set<Cliente> clientes) {
       this.cedula = cedula;
       this.nombre = nombre;
       this.password = password;
       this.tipoUsuario = tipoUsuario;
       this.cajeros = cajeros;
       this.clientes = clientes;
    }
   
    public String getCedula() {
        return this.cedula;
    }
    
    public void setCedula(String cedula) {
        this.cedula = cedula;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    public int getTipoUsuario() {
        return this.tipoUsuario;
    }
    
    public void setTipoUsuario(int tipoUsuario) {
        this.tipoUsuario = tipoUsuario;
    }
    public Set<Cajero> getCajeros() {
        return this.cajeros;
    }
    
    public void setCajeros(Set<Cajero> cajeros) {
        this.cajeros = cajeros;
    }
    public Set<Cliente> getClientes() {
        return this.clientes;
    }
    
    public void setClientes(Set<Cliente> clientes) {
        this.clientes = clientes;
    }




}


