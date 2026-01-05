import 'package:flutter/material.dart';
import 'package:my_app/screens/onboarding_screen.dart';
import 'package:my_app/services/user_service.dart';
import 'package:my_app/widgets/wrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async{
WidgetsFlutterBinding.ensureInitialized();
await SharedPreferences.getInstance();

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: userServices.checkUsername(),
      builder: (context, snapshot) {
        
        //if the snapshot is still waiting 
        if(snapshot.connectionState == ConnectionState.waiting){
          return const CircularProgressIndicator();
          
        }else{
          //here the hasUserName will be set to 
          //ture of the data is ther in the snapshot and otherwise false
          bool hasUserName = snapshot.data ?? false;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: "Inter",
            ),
            home: Wrapper(
              showMainScreen: hasUserName,
              ),

          );
        }
      },
    );
  }
}