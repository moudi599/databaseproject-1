package com.example.taxiandrentapp;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.*;

import java.net.URL;
import java.sql.SQLException;
import java.util.ResourceBundle;

public class sign_up_user_Controller implements Initializable {


    public sign_up_user_Controller() throws SQLException {
    }

    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {

    }
    public LoginModel loginModel = new LoginModel();
    @FXML
    private TextField txtfirstname;
    @FXML
    private TextField txtlastname;
    @FXML
    private TextField txtage;
    @FXML
    private TextField txtaddress;
    @FXML
    private TextField txtemail;
    @FXML
    private PasswordField txtpassword;
    @FXML
    private Label info;

    Alert alert = new Alert(Alert.AlertType.ERROR);
    public void ConfirmSignup (ActionEvent event){
        try{
            //loginModel.addInfo(txtfirstname.getText(),txtlastname.getText(),txtage.getText(),txtaddress.getText(),txtemail.getText(),txtpassword.getText());
            //set messageBox
            if(loginModel.addInfo(txtfirstname.getText(),txtlastname.getText(),txtage.getText(),txtaddress.getText(),txtemail.getText(),txtpassword.getText())){
                alert.setTitle("Your information are set into database");
                info.setText("Your information are set into database");
            }
            else {
                alert.setTitle("some problem occurs");
                info.setText("some problem occurs");
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }

    }

  // txtfname.getText.isBlank();


}
