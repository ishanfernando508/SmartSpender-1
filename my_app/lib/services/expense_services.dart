import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_app/models/expense_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExpenseServices {
  
  //expense list

  List <Expense> expensesList = [];

  //define the keyfor storing expenses in shared preferences
  static const String _expenseKey = 'expenses';

  //save the expenses to shared preferencec
  Future <void> saveExpenses(Expense expense,BuildContext context) async {
    try{

      SharedPreferences prefs = await SharedPreferences.getInstance();
      List <String>? existingExpenses = prefs.getStringList(_expenseKey);

      //convert the existing expenses to a list of Expense objects
      List<Expense>existingExpensesObjects = [];

      if(existingExpenses != null){
        existingExpenses
        .map((e) => Expense.fromJSON(json.decode(e)))
        .toList();
      }

      //add the new expense to the list
      existingExpensesObjects.add(expense);

      //convert the list of the Expense objects bckto a list of strings
      List<String> updateExpenses = 
      existingExpensesObjects.map((e)=>json.encode(e.toJSON())).toList();

      //save the updated list of expenses to shared preferences
      await prefs.setStringList(_expenseKey, updateExpenses);

      //show massage
      if(context.mounted){
         ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Expense added successfully"),
        duration: Duration(seconds: 2),
        ),
      );
      }
      


    }catch(error){
      //show massage
      if(context.mounted){
         ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error on adding expenses"),
        duration: Duration(seconds: 2),
        ),
      );
      }
    }

  }

  //load the expenses feom shared preferences
  Future <List<Expense>> loadExpenses ()async{

    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String>? existingExpenses = pref.getStringList(_expenseKey);

    //convert the existing expenses to a list of Expense objects
    List<Expense> loadedExpenses = [];
    if(existingExpenses != null){
      loadedExpenses = existingExpenses
      .map((e) => Expense.fromJSON(json.decode(e)))
      .toList();
    }

    return loadedExpenses;
  }
}