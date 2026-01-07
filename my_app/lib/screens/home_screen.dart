import 'package:flutter/material.dart';
import 'package:my_app/constants/colors.dart';
import 'package:my_app/services/user_service.dart';
import 'package:my_app/widgets/income_expense_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  //for store the username
  String username = "";

  @override
  void initState() {

    //get the username from the shared pref
    userServices.getUserData().then((value) {
      if(value["username"] != null){
        setState(() {
          username = value['username']!;
        });
        
      }
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        //main col
        child: Column(
          children: [
            //bg color col
            Container(
              height: MediaQuery.of(context).size.height*0.3,
              decoration: BoxDecoration(
                color: kMainColor.withOpacity(0.15),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )
              ),
              child: Padding(
                padding: const EdgeInsets.all(9.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: kMainColor,
                            border: Border.all(
                              color: kMainColor,
                              width: 3,
                            )
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(100),
                            child: Image.asset("assets/images/user.jpg",
                            width: 50,
                            fit: BoxFit.cover,
                            ),
                          ),
                          
                        ),
                        
                        const SizedBox(
                          width: 20,
                        ),
                    
                        Text("Welcome $username",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        IconButton(
                          onPressed: () {}, 
                          icon: Icon(Icons.notifications,
                          color: kMainColor,
                          size: 30,
                          ),
                          ),
                    
                      ],
                    ),
                    SizedBox(height: 20,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IncomeExpenseCard(
                          title: "income",
                          amount: 1200,
                          bgColor: kGreen,
                          imageUrl: "assets/images/income.png",
                        ),
                         IncomeExpenseCard(
                          title: "Expense",
                          amount: 2300,
                          bgColor:kRed,
                          imageUrl: "assets/images/expense.png",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )

          ],
        ),
      )),
    );
  }
}