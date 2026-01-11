import 'package:flutter/material.dart';
import 'package:my_app/constants/colors.dart';
import 'package:my_app/models/expense_model.dart';
import 'package:my_app/models/income_model.dart';
import 'package:my_app/screens/Transaction_screen.dart';
import 'package:my_app/screens/add_new_screen.dart';
import 'package:my_app/screens/budget_screen.dart';
import 'package:my_app/screens/home_screen.dart';
import 'package:my_app/screens/profile_screen.dart';
import 'package:my_app/services/expense_services.dart';
import 'package:my_app/services/income_services.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //current page idex
  int _currentPageIndex =0;

  List<Expense> expenseList = [];
  List<Income> incomeList = [];

  //funtion to fetch expenses
void fetchAllExpenses()async{
  List<Expense>loadedExpenses = await ExpenseServices().loadExpenses();
  setState(() {
    expenseList = loadedExpenses;
  });
}

//funtion to fetch all incomes
void fetchAllIncomes()async{
  List<Income>loadeIncomes = await IncomeServices().loadIncomes();
  setState(() {
    incomeList = loadeIncomes;
  });
}

//funtion to add a new expenses
  void addNewExpenses (Expense newExpenses){
    ExpenseServices().saveExpenses(newExpenses, context);

    //update the list of expensesse
    setState(() {
      expenseList.add(newExpenses);
    });
  }

  //funtion to add new income 
  void addNewIncome (Income newIncome){
    IncomeServices().saveIncome(newIncome, BuildContext);

    //update the income list
    setState(() {
      incomeList.add(newIncome);
      print(incomeList.length);
    });
  }

@override
  void initState() {
    super.initState();
    setState(() {
      fetchAllExpenses();
      fetchAllIncomes();
    });
  }

  //functon to remove a expense
  void removeExpense (Expense expense){
    ExpenseServices().deleteExpense(expense.id, context);
    setState(() {
      expenseList.remove(expense);
    });
  }
  
  //funtion to remove an icome 
  void removeIncome (Income income){
    IncomeServices().deleteIncome(income.id, context);
    setState(() {
      incomeList.remove(income);
    });
  }
  

  @override
  Widget build(BuildContext context) {

    //screens List
    final List<Widget> pages = [
      HomeScreen(),
      TransactionScreen(
        expensesList: expenseList,
        incomeList: incomeList,
        onDismissedExpense: removeExpense,
        onDismissedIncome: removeIncome,
      ),
      AddNewScreen(
        addExpense: addNewExpenses,
        addIncome: addNewIncome,
      ),
      BudgetScreen(),
      ProfileScreen(),
    ];
    
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: kWhite,
        selectedItemColor: kMainColor,
        unselectedItemColor: kGrey,
        currentIndex: _currentPageIndex,
        onTap: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        selectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        items: [
         BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
          ),
           BottomNavigationBarItem(
          icon: Icon(Icons.list_rounded),
          label: "Transaction",
          ),
          BottomNavigationBarItem(
          icon: Container(
            padding: EdgeInsets.all(10) ,
            decoration: BoxDecoration(
              color: kMainColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.add,
              color: kWhite,
              size: 30,
            ),),
            label: "",
          
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.rocket),
          label: "Budget",
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
          ),
      ]),
      body: pages[_currentPageIndex],
    );
  }
}