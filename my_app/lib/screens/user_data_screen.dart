import 'package:flutter/material.dart';
import 'package:my_app/constants/colors.dart';
import 'package:my_app/widgets/custom_button.dart';

class UserDataScreen extends StatefulWidget {
  const UserDataScreen({super.key});

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {

  //foe the check box 
  bool _rememberMe = false;

  //form key for the form validation
  final _formKey = GlobalKey<FormState>();

  //controller for the text from feilds
  final TextEditingController _userNameController =TextEditingController();
  final TextEditingController _emailController =TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _conformPasswordController =TextEditingController();
  

  @override
  void dispose () {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _conformPasswordController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(child: 
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Enter your \nPersonal Details" , 
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
              ),
              SizedBox(height: 30,
              ),
              //form
              Form(
                key: _formKey,
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //form feild for the user name
                  TextFormField(
                    controller: _userNameController,
                    validator: (value) {
                      //check weather the user enterd a valid user name
                      if(value!.isEmpty){
                        return"please Enter Your Name";
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),

                      contentPadding: EdgeInsets.all(
                        20
                      ),
                    ),

                  ),

                  const SizedBox(height: 15,),

                  //form feild for the email
                   TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if(value!.isEmpty){
                        return"Please Enter Your Email";
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),

                      contentPadding: EdgeInsets.all(
                        20
                      ),
                    ),

                  ),

                  const SizedBox(height: 15,),

                  //form feild for the user pasword
                   TextFormField(
                    controller: _passwordController,
                    validator: (value) {
                      if(value!.isEmpty){
                        return"Please Enter a Valid Password";
                      }
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),

                      contentPadding: EdgeInsets.all(
                        20
                      ),
                    ),

                  ),
                  const SizedBox(height: 15,),

                  //form feild for the user conform password
                   TextFormField(
                    controller: _conformPasswordController,
                    validator: (value) {
                      if(value!.isEmpty){
                        return"Please Enter The Same Password";
                      }
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Conform Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),

                      contentPadding: EdgeInsets.all(
                        20
                      ),
                    ),

                  ),
                  const SizedBox(height: 15,),

                  //remember me for the next time
                  Row(children: 
                  [Text(
                    "Remember me for the nezt time",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: kGrey
                    ),
                  ),
                  Expanded(
                    
                    child: CheckboxListTile(
                      activeColor: kMainColor,
                      value: _rememberMe,
                       onChanged: (value) {
                    setState(() {
                      _rememberMe = value!;
                    });
                  },
                   ),
                  ),
                  
                  ],
                  ),
                  const SizedBox(height: 30,),

                  //submit button
                  GestureDetector(
                    onTap: () {
                      if(_formKey.currentState!.validate()){

                        //form is valid, process data
                        String userName = _userNameController.text;
                        String email = _emailController.text;
                        String password = _passwordController.text;
                        String conformPassword = _conformPasswordController.text;

                        print("$userName $email $password $conformPassword");
                      
                      }
                    },
                    child: CustomButton(
                      buttonName: "Next", 
                      buttonColor: kMainColor,
                      ),
                  )
                ],

              ),
              ),
            ],
          ),
        ),
        ),
      ),
    );
  }
}