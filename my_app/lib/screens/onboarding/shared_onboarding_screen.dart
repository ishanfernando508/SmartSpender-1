import 'package:flutter/material.dart';
import 'package:my_app/constants/colors.dart';

class SharedOnboardingScreen extends StatelessWidget {

  final String title;
  final String imagepath;
  final String description; 

  const SharedOnboardingScreen({
    super.key,
     required this.title,
      required this.imagepath,
       required this.description,
       });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagepath,width: 300, fit: BoxFit.cover
          ,),
      
          const SizedBox(height: 20,),
      
          Text(
            title ,
           style:const TextStyle(
            fontSize: 28,
            fontWeight:FontWeight.w500,
      
          ),
          ),
          
          const SizedBox(height: 20,),
      
          Text(
            description ,
           style:const TextStyle(
            fontSize: 16,
            color: kGrey,
            fontWeight:FontWeight.w500,
      
          ),
          ),
      
        ],
      ),
    );
  }
}