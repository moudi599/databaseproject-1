package com.example.taxiandrentapp;

import java.sql.*;


public class LoginModel {

    Connection conection;

    Database databaseInstance;
    Connection connection;

    public LoginModel() throws SQLException {
        databaseInstance = Database.getInstance();
        conection = databaseInstance.connect();
    }

    public boolean isDbconnected() {

        try {
            return !conection.isClosed();

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    public boolean isLogin(String user, String pass) throws SQLException {

        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String query = "select * from customer where ct_email = ? and ct_password = ?";

        try {


            preparedStatement = conection.prepareStatement(query);
            preparedStatement.setString(1, user);
            preparedStatement.setString(2, pass);

            resultSet = preparedStatement.executeQuery();

            return resultSet.next();
        } catch (Exception e) {
            return false;
        } finally {
            if (preparedStatement != null) preparedStatement.close();

            resultSet.close();
        }

    }


   /*
   public boolean addInfo (String fname,String lname,String age,String address, String email, String password) throws SQLException{
       PreparedStatement preparedStatement = null;
       ResultSet resultSet = null;
       String query = "declare @cfname varchar(256) ,@clname varchar(256) ,@cage int,@caddress varchar(256),@cemail varchar(256),@cpassword varchar(256)\n" +
               "\n" +
               "set @cfname = ? \n" +
               "set @clname = ? \n" +
               "set @cage = ? \n" +
               "set @caddress = ? \n" +
               "set @cemail = ? \n" +
               "set @cpassword = ? \n" +
               "\n" +
               "exec dbo.addInfor @cfname,@clname,@cage,@caddress,@cemail,@cpassword";



       try {
           preparedStatement = conection.prepareStatement(query);
           preparedStatement.setString(1, fname);
           preparedStatement.setString(2, lname);
           preparedStatement.setString(3, age);
           preparedStatement.setString(4, address);
           preparedStatement.setString(5, email);
           preparedStatement.setString(6, password);

           resultSet = preparedStatement.executeQuery();

           return resultSet.next();
       }
       catch (Exception e){
           return false;
       }

       finally {
           if (preparedStatement != null) preparedStatement.close();

           resultSet.close();
       }
   } */


    public boolean addInfo(String fname, String lname, String age, String address, String email, String password) throws SQLException {

        boolean test;
        CallableStatement proc = null;
        ResultSet rs =null;
        try {

            String query = " {call addInfor(?,?,?,?,?,?)}";
            proc = conection.prepareCall(query);
            proc.setString(1, fname);
            proc.setString(2, lname);
            proc.setString(3, age);
            proc.setString(4, address);
            proc.setString(5, email);
            proc.setString(6, password);

            proc.executeUpdate();

// first result set returning the status
            rs = proc.getResultSet();

            if(rs == null)
                test = true;
            else
                test = false;

             return  test;

           //return rs.next();

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}

