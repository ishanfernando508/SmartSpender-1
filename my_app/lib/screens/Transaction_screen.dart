import 'package:flutter/material.dart';
import 'package:my_app/constants/colors.dart';
import 'package:my_app/models/expense_model.dart';
import 'package:my_app/models/income_model.dart';
import 'package:my_app/widgets/expense_card.dart';
import 'package:my_app/widgets/income%20card.dart';


class TransactionScreen extends StatefulWidget {
  final List<Expense>expensesList;
  final List<Income>incomeList;
  final void Function (Expense) onDismissedExpense;
  final void Function (Income)onDismissedIncome;
  const TransactionScreen(
    {super.key,
     required this.expensesList,
      required this.onDismissedExpense,
       required this.incomeList, 
       required this.onDismissedIncome,
      });

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(kDefaultFontSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "See your financial report",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: kMainColor,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Incomes",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kBlack,
                ),
              ),
              SizedBox(
                height: 20,
              ),

              //show all the expenses
              SizedBox(
                height: MediaQuery.of(context).size.height*0.30,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.incomeList.length,
                        itemBuilder: (context,index){
                        final income = widget.incomeList[index];


                        return Dismissible(
                          key: ValueKey(income),
                          direction: DismissDirection.startToEnd,
                          onDismissed: (direction) {
                            setState(() {
                              widget.onDismissedIncome(income);
                            });
                          },
                          child: IncomeCard(
                            titlt: income.title, 
                            date: income.date,
                             amount: income.amount,
                              category: income.category, 
                              description: income.description,
                               time:income.time,
                               ),
                        );
                      },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Expense",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kBlack,
                ),
              ),
              SizedBox(
                height: 20,
              ),

              //show all the incomes
              SizedBox(
                height: MediaQuery.of(context).size.height*0.30,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.expensesList.length,
                        itemBuilder: (context,index){
                        final expense = widget.expensesList[index];


                        return Dismissible(
                          key: ValueKey(expense),
                          direction: DismissDirection.startToEnd,
                          onDismissed: (direction) {
                            setState(() {
                              widget.onDismissedExpense(expense);
                            });
                          },
                          child: ExpenseCard(
                            titlt: expense.title, 
                            date: expense.date,
                             amount: expense.amount,
                              category: expense.category, 
                              description: expense.description,
                               time: expense.time,
                               ),
                        );
                      },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ),
          ),
    );
  }
}