package com.example.taxiandrentapp;

import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;

import java.io.SyncFailedException;
import java.net.URL;
import java.sql.SQLException;
import java.util.ResourceBundle;

public class secretary_view_Controller implements Initializable {

    public secretary_view_Controller() throws SQLException {
    }

    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {

    }
    @FXML
    private TextField txtSearchCustomerId;


    @FXML
    private TableView<CustomersClass> CustomerTable;

    @FXML
    private TableColumn<CustomersClass,String> col_address;

    @FXML
    private TableColumn<CustomersClass,String> col_age;

    @FXML
    private TableColumn<CustomersClass,String> col_email;

    @FXML
    private TableColumn<CustomersClass,String> col_fname;

    @FXML
    private TableColumn<CustomersClass,Integer> col_id;

    @FXML
    private TableColumn<CustomersClass,String> col_isPremium;

    @FXML
    private TableColumn<CustomersClass,String> col_lname;

    @FXML
    private TableColumn<CustomersClass,String> col_password;

    @FXML
    private TableColumn<CustomersClass,String> col_totalPrice;




    ObservableList <CustomersClass> listM;
    LoginModelSecretary loginModelSecretary  = new LoginModelSecretary();

    public void ViewCarFromID (ActionEvent event){

        try {


            col_id.setCellValueFactory(new PropertyValueFactory<CustomersClass,Integer>("id"));

            col_fname.setCellValueFactory(new PropertyValueFactory<CustomersClass,String>("fname"));
            col_lname.setCellValueFactory(new PropertyValueFactory<CustomersClass,String>("lname"));


           col_address.setCellValueFactory(new PropertyValueFactory<CustomersClass,String>("address"));

            col_age.setCellValueFactory(new PropertyValueFactory<CustomersClass,String>("age"));
            col_email.setCellValueFactory(new PropertyValueFactory<CustomersClass,String>("email"));
            col_password.setCellValueFactory(new PropertyValueFactory<CustomersClass,String>("password"));
           col_isPremium.setCellValueFactory(new PropertyValueFactory<CustomersClass,String>("ispremium"));
            col_totalPrice.setCellValueFactory(new PropertyValueFactory<CustomersClass,String>("totalPrice"));




            listM = loginModelSecretary.getDataCustomers(Integer.parseInt(txtSearchCustomerId.getText()));



            CustomerTable.setItems(listM);



        }
        catch (Exception e){
            e.printStackTrace();
        }



    }


}
