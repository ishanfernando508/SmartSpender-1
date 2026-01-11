import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_app/models/income_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IncomeServices {
  
  //define the key for storing incomes n shared preference

  static const String _incomekey = 'income';

  //save the income to share preference

  Future <void> saveIncome (Income income , BuildContext )async{

    try{
       SharedPreferences prefs = await SharedPreferences.getInstance();

    List <String>? existingIncoms = prefs.getStringList(_incomekey);

    // convert the existing incomes to a list of income object

    List<Income> existingIncomsObjects = [];
    if (existingIncoms != null){
      existingIncoms.map((e) => Income.fromJSON(json.decode(e))).toList();
    }

    //add the new income to the list
    existingIncomsObjects.add(income);

    //convert the list of incomes objects back to a list of strings
    List<String> updatedIncome =
     existingIncomsObjects.map((e)=>json.encode(e.toJSON())).toList();

     //save the updated list of incomes to shared preferenses
     await prefs.setStringList(_incomekey, updatedIncome);

     if(BuildContext.mounted){
      ScaffoldMessenger.of(BuildContext).showSnackBar(
      const SnackBar(content: Text("income added successfuly"),
      duration: Duration(seconds: 2),),
     );
     }

     
    }catch(error){
      ScaffoldMessenger.of(BuildContext).showSnackBar(
      const SnackBar(content: Text("Erorr on adding income"),
      duration: Duration(seconds: 2),),
     );
    }
   


  }

  //load the income fro shared preferences
Future <List <Income >> loadIncomes ()async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  List <String>? existingIncoms = pref.getStringList(_incomekey);

  //convert the exixting incomes to a list of income object
  List<Income> loadIncomes = [];
  if (existingIncoms != null){
    loadIncomes = existingIncoms.map((e) => Income.fromJSON(json.decode(e))).toList();

  }
  return loadIncomes;
}

//function to delete an income 
Future <void> deleteIncome (int id ,BuildContext context)async{

  try{
    SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? existingIncoms= prefs.getStringList(_incomekey);

  //convert the exixting incomes to a ;ist of income object

  List<Income> exixtingIncomeObjects = [];
  if(existingIncoms != null){

    existingIncoms.map((e)=> Income.fromJSON(json.decode(e))).toList();
  }

  //remove the income with the given id the list
  exixtingIncomeObjects.removeWhere((income)=> income.id == id);

  //convert the list of income objects back to a list of strimgs
  List<String>updatedIncomes = exixtingIncomeObjects.map((e)=>json.encode(e.toJSON())).toList();

  //save the  updated list of incomes to shared preferences
  await prefs.setStringList(_incomekey, updatedIncomes);

  //show masseg
  if(context.mounted){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(
        "Income deleted successfully!"
      ),
      duration: Duration(seconds: 2),
      ),

    );
  }
  }catch (error){
    print(error.toString());

    //show snackbar
    if(context.mounted){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Error deleting Income!"),
          duration: Duration(seconds: 2),
          ),
      );
    }
  }
  
}

}