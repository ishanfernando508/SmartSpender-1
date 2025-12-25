import 'package:my_app/models/onboarding_model.dart';

class OnboardingData {

  static final List <Onboarding> onboardingDataList = [
    Onboarding(title: "Gain total control of your money",
     imagepath:"assets/images/onboard_1.png",
      description:
       "Become your own money manger and make every cent count,"),
      Onboarding(title:"Know where your money gose",
       imagepath: "assets/images/onboard_2.png",
        description:"Track your transaction easily,with categories and financial report",
        ),
        Onboarding(title:"planing ahead",
         imagepath: "assets/images/onboard_3.png", 
         description:"Track your transaction easily,with categories and financial report",
         ),
  ];
}