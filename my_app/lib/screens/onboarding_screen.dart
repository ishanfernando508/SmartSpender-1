import 'package:flutter/material.dart';
import 'package:my_app/constants/colors.dart';
import 'package:my_app/data/onboarding_data.dart';
import 'package:my_app/screens/onboarding/front_page.dart';
import 'package:my_app/screens/onboarding/shared_onboarding_screen.dart';
import 'package:my_app/screens/user_data_screen.dart';
import 'package:my_app/widgets/custom_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  //page controler
  final PageController _controller = PageController();
  bool showDetailsPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
            
                //onbording screen
                
                   PageView(
                    controller: _controller,
                    onPageChanged: (index) {
                      setState(() {
                        showDetailsPage = index == 3;
                      });
                    },
                    children: [
                      const FrontPage(),
                      SharedOnboardingScreen(
                        title: OnboardingData.onboardingDataList[0].title,
                        imagepath: OnboardingData.onboardingDataList[0].imagepath,
                        description: OnboardingData.onboardingDataList[0].description,
                      ),
                      SharedOnboardingScreen(
                        title: OnboardingData.onboardingDataList[1].title,
                        imagepath: OnboardingData.onboardingDataList[1].imagepath,
                        description: OnboardingData.onboardingDataList[1].description,
                      ),
                      SharedOnboardingScreen(
                        title: OnboardingData.onboardingDataList[2].title,
                        imagepath: OnboardingData.onboardingDataList[2].imagepath,
                        description: OnboardingData.onboardingDataList[2].description,
                      ),
                    ],
                  ),

                  //page dot indicator
                  
                
                Container(
                  alignment: const Alignment(0, 0.75),
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: 4,
                    effect: const WormEffect(
                      activeDotColor: kMainColor,
                      dotColor: kLightGrey
                      
                    )

                  )
                ),
                // navigation button
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child:Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child:!showDetailsPage ? GestureDetector(
                      onTap: () {
                        _controller.animateToPage(
                          _controller.page!.toInt() +1,
                          duration: Duration(microseconds: 400),
                          curve: Curves.easeInOut,

                        );
                      },
                      child: CustomButton(
                        buttonName: showDetailsPage ?"Get Started" : "Next", 
                        buttonColor: kMainColor,),
                    )
                    :GestureDetector(
                      onTap: () {
                       //Navigate to the user data screen
                       Navigator.push(
                        context, 
                       MaterialPageRoute(
                        builder: (context) => const UserDataScreen(),
                       ),
                       );
                      },
                      child: CustomButton(
                        buttonName: showDetailsPage ?"Get Started" : "Next", 
                        buttonColor: kMainColor,),
                    )
                  ),
                    
                  
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}