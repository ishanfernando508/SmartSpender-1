import 'package:flutter/material.dart';
import 'package:my_app/constants/colors.dart';
import 'package:my_app/models/expense_model.dart';
import 'package:my_app/models/income_model.dart';
import 'package:my_app/services/user_service.dart';
import 'package:my_app/widgets/expense_card.dart';
import 'package:my_app/widgets/income_expense_card.dart';
import 'package:my_app/widgets/line_chart.dart';

class HomeScreen extends StatefulWidget {
  final List<Expense> expensesList;
  final List<Income> incomeList;

  const HomeScreen({super.key , required this.expensesList, required this.incomeList});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  //for store the username
  String username = "";
  double expenseTotal = 0;
  double incomeTotal = 0;

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

    setState(() {
      //total amount of expenses
      for(var i = 0 ; i < widget.expensesList.length ; i++){
        expenseTotal += widget.expensesList[i].amount;

      }

      //total  amount of incomes
      for (var k = 0 ; k <widget.incomeList.length; k++){
        incomeTotal += widget.incomeList[k].amount;
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
                          amount: incomeTotal,
                          bgColor: kGreen,
                          imageUrl: "assets/images/income.png",
                        ),
                         IncomeExpenseCard(
                          title: "Expense",
                          amount: expenseTotal,
                          bgColor:kRed,
                          imageUrl: "assets/images/expense.png",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            //line chart
             const Padding(
              padding:EdgeInsets.all(
                kDefaultFontSize,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Spend Frequency",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  ),
                  SizedBox(height: 20,),

                  LineChartSample(),
                ],
              ),
               ),

               //recent transaction
               Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultFontSize),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Recent Transaction",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    ),
                    SizedBox(height: 20,),

                    Column(
                      children: [
                        ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.expensesList.length,
                        itemBuilder: (context,index){
                        final income = widget.expensesList[index];


                        return ExpenseCard(
                          titlt: income.title, 
                          date: income.date,
                           amount: income.amount,
                            category: income.category, 
                            description: income.description,
                             time:income.time,
                             );
                      },
                      ),
                      ],
                    )
                  ],
                ),
                ),

          ],
        ),
      )),
    );
  }
}