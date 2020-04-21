package entidades;
// Generated 20-abr-2020 1:26:05 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Cuenta generated by hbm2java
 */
public class Cuenta  implements java.io.Serializable {


     private String numCuenta;
     private Cliente cliente;
     private Moneda moneda;
     private float saldo;
     private int limiteTransferencia;
     private Set movimientos = new HashSet(0);
     private Set vinculadases = new HashSet(0);

    public Cuenta() {
    }

	
    public Cuenta(String numCuenta, Cliente cliente, Moneda moneda, float saldo, int limiteTransferencia) {
        this.numCuenta = numCuenta;
        this.cliente = cliente;
        this.moneda = moneda;
        this.saldo = saldo;
        this.limiteTransferencia = limiteTransferencia;
    }
    public Cuenta(String numCuenta, Cliente cliente, Moneda moneda, float saldo, int limiteTransferencia, Set movimientos, Set vinculadases) {
       this.numCuenta = numCuenta;
       this.cliente = cliente;
       this.moneda = moneda;
       this.saldo = saldo;
       this.limiteTransferencia = limiteTransferencia;
       this.movimientos = movimientos;
       this.vinculadases = vinculadases;
    }
   
    public String getNumCuenta() {
        return this.numCuenta;
    }
    
    public void setNumCuenta(String numCuenta) {
        this.numCuenta = numCuenta;
    }
    public Cliente getCliente() {
        return this.cliente;
    }
    
    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
    public Moneda getMoneda() {
        return this.moneda;
    }
    
    public void setMoneda(Moneda moneda) {
        this.moneda = moneda;
    }
    public float getSaldo() {
        return this.saldo;
    }
    
    public void setSaldo(float saldo) {
        this.saldo = saldo;
    }
    public int getLimiteTransferencia() {
        return this.limiteTransferencia;
    }
    
    public void setLimiteTransferencia(int limiteTransferencia) {
        this.limiteTransferencia = limiteTransferencia;
    }
    public Set getMovimientos() {
        return this.movimientos;
    }
    
    public void setMovimientos(Set movimientos) {
        this.movimientos = movimientos;
    }
    public Set getVinculadases() {
        return this.vinculadases;
    }
    
    public void setVinculadases(Set vinculadases) {
        this.vinculadases = vinculadases;
    }




}

