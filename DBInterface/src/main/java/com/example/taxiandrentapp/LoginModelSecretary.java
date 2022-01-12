package com.example.taxiandrentapp;

import javafx.beans.Observable;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.scene.control.TableView;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.*;

public class LoginModelSecretary {

    Database databaseInstance;
    Connection connection;

    public LoginModelSecretary() throws SQLException {
        databaseInstance = Database.getInstance();
        connection = databaseInstance.connect();
    }



    public  ObservableList<CustomersClass> getDataCustomers(int ida){
        CallableStatement cs = null;
        ResultSet rs = null;
        ObservableList <CustomersClass> list = FXCollections.observableArrayList();


        try {
            String query = "{ CALL getCustomerFromID(?)}";
           // String query ="select  CT_ID, CT_FIRSTNAME,CT_LASTNAME,CT_ADDRESS,CT_AGE,CT_EMAIL,CT_PASSWORD,CT_TOT_PRICE,CT_IS_PREMIUM from CUSTOMER C where C.CT_ID = ?";

            cs = connection.prepareCall(query);


           // cs.registerOutParameter(1, (SQLType) tview);
            cs.setInt(1, ida);

            rs = cs.executeQuery();

            while(rs.next()){
                //CT_ID, CT_FIRSTNAME,CT_LASTNAME,CT_AGE,CT_EMAIL,CT_PASSWORD,CT_NB_OF_ORDERS,CT_TOT_PRICE_TAXI,CT_NB_OF_RENTS,CT_TOT_PRICE_RENTS

                list.add(new CustomersClass(Integer.parseInt(rs.getString("CT_ID")), rs.getString("CT_FIRSTNAME"),
                        rs.getString("CT_LASTNAME"),rs.getString("CT_ADDRESS"),rs.getString("CT_AGE"),rs.getString("CT_EMAIL")
                        ,rs.getString("CT_PASSWORD"),rs.getString("CT_TOT_PRICE"),rs.getString("CT_IS_PREMIUM")));

            }



        }
        catch (Exception e){
            e.printStackTrace();

        }
        return list;
    }
}
