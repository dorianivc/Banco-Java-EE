package entidades;
// Generated 20-abr-2020 1:26:05 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Usuario generated by hbm2java
 */
public class Usuario  implements java.io.Serializable {


     private String cedula;
     private String nombre;
     private String numeroTel;
     private String password;
     private int tipoUsuario;
     private Set cajeros = new HashSet(0);
     private Set clientes = new HashSet(0);

    public Usuario() {
    }

	
    public Usuario(String cedula, String nombre, String numeroTel, String password, int tipoUsuario) {
        this.cedula = cedula;
        this.nombre = nombre;
        this.numeroTel = numeroTel;
        this.password = password;
        this.tipoUsuario = tipoUsuario;
    }
    public Usuario(String cedula, String nombre, String numeroTel, String password, int tipoUsuario, Set cajeros, Set clientes) {
       this.cedula = cedula;
       this.nombre = nombre;
       this.numeroTel = numeroTel;
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
    public String getNumeroTel() {
        return this.numeroTel;
    }
    
    public void setNumeroTel(String numeroTel) {
        this.numeroTel = numeroTel;
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
    public Set getCajeros() {
        return this.cajeros;
    }
    
    public void setCajeros(Set cajeros) {
        this.cajeros = cajeros;
    }
    public Set getClientes() {
        return this.clientes;
    }
    
    public void setClientes(Set clientes) {
        this.clientes = clientes;
    }




}


