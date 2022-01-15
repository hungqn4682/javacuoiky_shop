/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.qlbanhang.Model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author The Bigger
 */
@Entity
@Table(name = "sanpham")
public class sanpham implements Comparable<sanpham>, Serializable{
     @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String tensp;
private int gia;
private int giamgia;
    private String anh;
    private int soluong;
    private int madm;
    private int mahang;
    private int thoigiantao;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTensp() {
        return tensp;
    }

    public void setTensp(String tensp) {
        this.tensp = tensp;
    }

    public int getGia() {
        return gia;
    }

    public void setGia(int gia) {
        this.gia = gia;
    }

    public int getGiamgia() {
        return giamgia;
    }

    public void setGiamgia(int giamgia) {
        this.giamgia = giamgia;
    }

    public String getAnh() {
        return anh;
    }

    public void setAnh(String anh) {
        this.anh = anh;
    }

    public int getSoluong() {
        return soluong;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }

    public int getMadm() {
        return madm;
    }

    public void setMadm(int madm) {
        this.madm = madm;
    }

    public int getMahang() {
        return mahang;
    }

    public void setMahang(int mahang) {
        this.mahang = mahang;
    }

    public int getThoigiantao() {
        return thoigiantao;
    }

    public void setThoigiantao(int thoigiantao) {
        this.thoigiantao = thoigiantao;
    }

    @Override
    public int compareTo(sanpham sp) {
       return this.id - sp.id;
    }


}
