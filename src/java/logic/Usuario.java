package banca.logic;

public class Usuario  implements java.io.Serializable {


     private String cedula;
     private String clave;
     private Integer tipo;


    public Usuario() {
    }

	
    public Usuario(String cedula) {
        this.cedula = cedula;
    }
    public Usuario(String cedula, String clave, Integer tipo) {
       this.cedula = cedula;
       this.clave = clave;
       this.tipo = tipo;
    }
   
    public String getCedula() {
        return this.cedula;
    }
    
    public void setCedula(String cedula) {
        this.cedula = cedula;
    }
    public String getClave() {
        return this.clave;
    }
    
    public void setClave(String clave) {
        this.clave = clave;
    }
    public Integer getTipo() {
        return this.tipo;
    }
    
    public void setTipo(Integer tipo) {
        this.tipo = tipo;
    }

}


