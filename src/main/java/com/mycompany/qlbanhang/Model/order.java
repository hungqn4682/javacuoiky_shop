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

public class order {



    private int id;

    private String name;

    private String phone;

    private String address;

    private String email;

    private String note;

    private int total;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public order(int id, String name, String phone, String address, String email, String note, int total) {
        super();
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.email = email;
        this.note = note;
        this.total = total;
    }

    public order(String name, String phone, String address, String email, String note, int total) {
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.email = email;
        this.note = note;
        this.total = total;
    }




}
