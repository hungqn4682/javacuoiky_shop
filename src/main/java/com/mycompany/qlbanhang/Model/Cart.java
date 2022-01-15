/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.qlbanhang.Model;

/**
 *
 * @author The Bigger
 */
import java.util.Map;
import java.util.TreeMap;
public class Cart {
 private TreeMap<sanpham , Integer> listSanpham;
 private long cartID;
 public Cart(){
     listSanpham = new TreeMap<sanpham, Integer>();
     cartID = System.currentTimeMillis();
 }

    public TreeMap<sanpham, Integer> getListSanpham() {
        return listSanpham;
    }

    public void setListSanpham(TreeMap<sanpham, Integer> listSanpham) {
        this.listSanpham = listSanpham;
    }

    public long getCartID() {
        return cartID;
    }

    public Cart(TreeMap<sanpham, Integer> listSanpham, long cartID) {
        this.listSanpham = listSanpham;
        this.cartID = cartID;
    }

    public void setCartID(long cartID) {
        this.cartID = cartID;
    }
    
    public void addToCart(sanpham sp, int soluong){
        boolean check = listSanpham.containsKey(sp);
        if(check){
            int old_soluong = listSanpham.get(sp);
            soluong += old_soluong;
            listSanpham.put(sp, soluong);
        }else{
            listSanpham.put(sp, soluong);
        }
    }
     public void updateToCart(sanpham sp, int soluong){
        boolean check = listSanpham.containsKey(sp);
        if(check = true){
          if(soluong <= 0){
                listSanpham.remove(sp);
          }else{
              listSanpham.remove(sp);
              listSanpham.put(sp, soluong);
          }
        }
    }
     public void removeToCart(sanpham sp, int soluong){
        boolean check = listSanpham.containsKey(sp);
        if(check == true){
             int old_soluong = listSanpham.get(sp);
             soluong = old_soluong - soluong;
          if(soluong <= 0){
                listSanpham.remove(sp);
          }else{
              listSanpham.remove(sp);
              listSanpham.put(sp, soluong);
          }
        }
    }
      public void removeCart(sanpham sp){
        boolean check = listSanpham.containsKey(sp);
        if(check == true){
             
              listSanpham.remove(sp);
              
        }
    }
      public int countItem(){
          int count = 0;
          for(Map.Entry<sanpham, Integer> list : listSanpham.entrySet()){
              count += list.getValue();
          }
          return count;
      }
       public double total(){
          int count = 0;
          for(Map.Entry<sanpham, Integer> list : listSanpham.entrySet()){
              count += list.getValue() * (list.getKey().getGia() - list.getKey().getGiamgia());
          }
          return count;
      }
     
}
