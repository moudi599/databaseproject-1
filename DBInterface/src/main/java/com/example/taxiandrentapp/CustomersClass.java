package com.example.taxiandrentapp;

public class CustomersClass {


    private int id;
    private String fname;
    private String lname;
    private String address;
    private String age;
    private String email;
    private String password;
    private String ispremium;
    private String totalPrice;

    public CustomersClass(int id, String fname, String lname,String address, String age, String email,
                          String password, String totalPrice,  String ispremium){
        this.id = id;
        this.fname = fname;
        this.lname = lname;
        this.age = age;

        this.email = email;
        this.password = password;

        this.totalPrice = totalPrice;
        this.address = address;
        this.ispremium = ispremium;
    }

    public void setIspremium(String ispremium) {
        this.ispremium = ispremium;
    }

    public String getIspremium() {
        return ispremium;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    public String getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(String totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

}

