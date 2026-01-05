import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class userServices {
  
  //methode to store the user name and user email in shaerd pref
  static Future <void> storeUserDetails ({
    required String userName ,
    required String email ,
    required String password,
    required String conformPassword,
    required BuildContext context,
     }) async{
    
    

    try{
      //check weather the user entered password and the conform password are the same

    if(password != conformPassword){
      //show a message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("password and conformpassword do not match"),
        ),
      );
      return;
    }

    //if the users password and conformpassword are same 
    //then store the users name and email

      //creat an instantce from shared pref
      SharedPreferences prefs = await SharedPreferences.getInstance();
      //store the user name adn email as key value pairs
      await prefs.setString("username", userName);
      await prefs.setString("email", email);

      //show a messege to the user

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("User Details stord successfully"),
      ),
      );

    }catch (err) {
      err.toString();
    }

  }

  //methode to check weather the username is saved in the shared pref

  static Future<bool> checkUsername()async{

//creat an instance for shared pref
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userName = prefs.getString("username");
    return userName != null;
  }
}
