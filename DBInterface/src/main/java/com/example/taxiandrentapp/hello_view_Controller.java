package com.example.taxiandrentapp;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

import java.io.IOException;
import java.net.URL;
import java.sql.SQLException;
import java.util.ResourceBundle;

public class hello_view_Controller implements Initializable {

    public LoginModel loginModel = new LoginModel();
    @FXML
    private Label isConnected;
    @FXML
    private TextField txtuser;
    @FXML
    private PasswordField txtpass;



    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {

       /* if(loginModel.isDbconnected()){
            isConnected.setText("Connected");
        }
        else
            isConnected.setText("not Connected");

        */
    }

    public void Login(ActionEvent event){
        try{
            if(loginModel.isLogin(txtuser.getText(),txtpass.getText())){
                isConnected.setText("user and pass are connected");
            }
            else
                isConnected.setText("Enter valid info");
        }
        catch (SQLException e){
            e.printStackTrace();
        }
    }

    public void SignUp(ActionEvent event) {

        try{
            ((Node)event.getSource()).getScene().getWindow().hide(); //hide current scene

            Stage stage = new Stage();
            FXMLLoader fxmlLoader = new FXMLLoader(HelloApplication.class.getResource("sign_up_user.fxml"));
            Scene scene = new Scene(fxmlLoader.load());
            stage.setTitle("Sign Up");
            stage.setScene(scene);
            stage.show();

        } catch (IOException e){
            e.printStackTrace();
        }
    }

    public void SecretaryMode(ActionEvent event) {

        try{
            ((Node)event.getSource()).getScene().getWindow().hide(); //hide current scene

            Stage stage = new Stage();
            FXMLLoader fxmlLoader = new FXMLLoader(HelloApplication.class.getResource("secretary_view.fxml"));
            Scene scene = new Scene(fxmlLoader.load());
            stage.setTitle("SecretaryMode");
            stage.setScene(scene);
            stage.show();

        } catch (IOException e){
            e.printStackTrace();
        }
    }

}
