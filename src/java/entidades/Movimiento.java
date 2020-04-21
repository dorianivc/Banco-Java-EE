package entidades;
// Generated 20-abr-2020 1:26:05 by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Movimiento generated by hbm2java
 */
public class Movimiento  implements java.io.Serializable {


     private Integer movId;
     private Cuenta cuenta;
     private float monto;
     private Date movFecha;
     private String detalle;

    public Movimiento() {
    }

	
    public Movimiento(Cuenta cuenta, float monto, String detalle) {
        this.cuenta = cuenta;
        this.monto = monto;
        this.detalle = detalle;
    }
    public Movimiento(Cuenta cuenta, float monto, Date movFecha, String detalle) {
       this.cuenta = cuenta;
       this.monto = monto;
       this.movFecha = movFecha;
       this.detalle = detalle;
    }
   
    public Integer getMovId() {
        return this.movId;
    }
    
    public void setMovId(Integer movId) {
        this.movId = movId;
    }
    public Cuenta getCuenta() {
        return this.cuenta;
    }
    
    public void setCuenta(Cuenta cuenta) {
        this.cuenta = cuenta;
    }
    public float getMonto() {
        return this.monto;
    }
    
    public void setMonto(float monto) {
        this.monto = monto;
    }
    public Date getMovFecha() {
        return this.movFecha;
    }
    
    public void setMovFecha(Date movFecha) {
        this.movFecha = movFecha;
    }
    public String getDetalle() {
        return this.detalle;
    }
    
    public void setDetalle(String detalle) {
        this.detalle = detalle;
    }




}

