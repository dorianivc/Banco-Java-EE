/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import data.BancoDAO;
import entidades.Cuenta;
import entidades.Moneda;
import entidades.Movimiento;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Monica
 */
public class transferencia extends HttpServlet {

    private Moneda colon=new Moneda();
    private Moneda dolar=null;
    private Moneda euro=null;
    public void start() {
        try{
            BancoDAO bancoDao= new BancoDAO();
            List monedas= bancoDao.list(new Moneda());
            Moneda aux=null;
            for(int i=0;i<monedas.size();i++){
                aux=(Moneda) monedas.get(i);
                switch (aux.getIdMoneda()) {
                    case 1:
                        colon=aux;
                        break;
                    case 2:
                        dolar=aux;
                        break;
                    case 3:
                        euro=aux;
                        break;
                    default:
                        break;
                }
            }
        }catch(Exception se){
            
        }
    }

    public Moneda getColon() {
        return colon;
    }

    public void setColon(Moneda colon) {
        this.colon = colon;
    }

    public Moneda getDolar() {
        return dolar;
    }

    public void setDolar(Moneda dolar) {
        this.dolar = dolar;
    }

    public Moneda getEuro() {
        return euro;
    }

    public void setEuro(Moneda euro) {
        this.euro = euro;
    }

    public Float Colones_a_dolares(float colones){
        return colones/dolar.getTipoDeCambio();
    }
     public Float Colones_a_euros(float colones){
        return colones/euro.getTipoDeCambio();
    }
    public Float Dolar_a_colones(float dolares){
        return dolares*dolar.getTipoDeCambio();
    }
    public Float Dolar_a_euro(float dolares){
        Float colones= Dolar_a_colones(dolares);
        return colones/euro.getTipoDeCambio();
        
    }
    public Float Euro_a_Colon(float euros){
        return euros*euro.getTipoDeCambio();
    }
     public Float Euro_a_dolar(float euros){
        Float colones= Euro_a_Colon(euros);
        return Colones_a_dolares(colones);
    }
    
   
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        start();
        String num_cuenta_origen=request.getParameter("cuenta_origen");
        String num_cuenta_destino=request.getParameter("cuenta_destino");
        String monto_a_transferir=request.getParameter("monto_a_transferir");
        Float monto=Float.parseFloat(monto_a_transferir);
        Cuenta origen=null;
        Cuenta destino=null;
        try{
            BancoDAO bancoDAO= new BancoDAO();
            List cuentas= bancoDAO.list(new Cuenta());
            Cuenta aux1=null;
          
            for(int i=0;i<cuentas.size();i++){
               aux1=(Cuenta) cuentas.get(i);
               
                if(aux1.getNumCuenta() == null ? num_cuenta_origen == null : aux1.getNumCuenta().equals(num_cuenta_origen)){
                    origen=aux1;
                }
                if(aux1.getNumCuenta() == null ? num_cuenta_destino == null : aux1.getNumCuenta().equals(num_cuenta_destino)){
                    destino=aux1;
                }
                
            }
            
           if(origen!=null&&destino!=null){
               
            if(origen.getSaldo()>=monto&& monto<=origen.getLimiteTransferencia()){//verificamos que tenga saldo
                   


//Verificamos la moneda
               if(origen.getMoneda().getIdMoneda()==destino.getMoneda().getIdMoneda()){//transferencia entre misma monedas
                   this.procesar_transferencia(origen, destino, monto, monto);
               }else if(origen.getMoneda().getIdMoneda()==1&&destino.getMoneda().getIdMoneda()==2){//Colones a dolares
                   Float dolares=this.Colones_a_dolares(monto);
                   this.procesar_transferencia(origen, destino, monto, dolares);
                   
               }else if(origen.getMoneda().getIdMoneda()==1&&destino.getMoneda().getIdMoneda()==3){//Colones a euros
                   Float euros= this.Colones_a_euros(monto);
                   this.procesar_transferencia(origen, destino, monto, euros);
               }else if(origen.getMoneda().getIdMoneda()==2&&destino.getMoneda().getIdMoneda()==1){//Dolares a colones
                   Float colones=this.Dolar_a_colones(monto);
                   this.procesar_transferencia(origen, destino, monto, colones);
               }else if(origen.getMoneda().getIdMoneda()==2&&destino.getMoneda().getIdMoneda()==3){//Colones a euro
                   Float euros=this.Colones_a_euros(monto);
                   this.procesar_transferencia(origen, destino, monto, euros);
               }else if(origen.getMoneda().getIdMoneda()==3&&destino.getMoneda().getIdMoneda()==1){//Euro a colon
                   Float colones= this.Euro_a_Colon(monto);
                   this.procesar_transferencia(origen, destino, monto, colones);
               }else if(origen.getMoneda().getIdMoneda()==3&&destino.getMoneda().getIdMoneda()==2){//Euro a dolares
                   Float dolares=this.Euro_a_dolar(monto);
                   this.procesar_transferencia(origen, destino, monto, dolares);
                   
               }
               
               
               }
               
               
               
           } 
            
            
        }catch(Exception se){
            System.out.println(se.getMessage());  
        }
      
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
    
    public void procesar_transferencia(Cuenta origen, Cuenta destino,Float monto_moneda_original, Float monto_moneda_destino){
        Movimiento mov_origen= new Movimiento();
        Movimiento mov_destino= new Movimiento();
        //Sacamos la plata del origen
        Float monto_moneda_origen= origen.getSaldo()-monto_moneda_original;
        origen.setSaldo(monto_moneda_origen);
        mov_origen.setMovId(Integer.SIZE);
        mov_origen.setMonto(monto_moneda_original);
        mov_origen.setCuenta(origen);
        mov_origen.setDetalle("Transferencia para: "+ destino.getNumCuenta());
        
        
        //Metemos la plata en el monto del destino
        Float monto_destino_final=destino.getSaldo()+monto_moneda_destino;
        destino.setSaldo(monto_destino_final);
        mov_destino.setMovId(Integer.SIZE);
        mov_destino.setMonto(monto_moneda_destino);
        mov_destino.setCuenta(destino);
        mov_destino.setDetalle("Transferencia de "+origen.getNumCuenta());
        try{
            BancoDAO bancoDAO= new BancoDAO();
            bancoDAO.insert(mov_origen);
            bancoDAO.insert(mov_destino);
            bancoDAO.modificar_monto(destino, destino.getSaldo());
            bancoDAO.modificar_monto(origen, origen.getSaldo());
            System.out.println("Transferencia realizada");
        }catch(Exception se){
            System.out.println(se.getMessage());
        }
        
    }

}
