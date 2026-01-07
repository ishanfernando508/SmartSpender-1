import 'package:flutter/material.dart';
import 'package:my_app/constants/colors.dart';
import 'package:my_app/screens/Transaction_screen.dart';
import 'package:my_app/screens/add_new_screen.dart';
import 'package:my_app/screens/budget_screen.dart';
import 'package:my_app/screens/home_screen.dart';
import 'package:my_app/screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //current page idex
  int _currentPageIndex =0;
  @override
  Widget build(BuildContext context) {

    //screens List
    final List<Widget> pages = [
      HomeScreen(),
      TransactionScreen(),
      AddNewScreen(),
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