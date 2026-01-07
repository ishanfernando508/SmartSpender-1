//enum for expense categories
import 'package:flutter/material.dart';

enum ExpenceCategory {
  food,
  transport,
  health,
  shopping,
  subscription,

}

//category images 
final Map <ExpenceCategory, String> expenseCategoriesImages = {
  ExpenceCategory.food : "assets/images/restaurant.png",
  ExpenceCategory.transport : "assets/images/car.png",
  ExpenceCategory.health : "assets/images/health.png",
  ExpenceCategory.shopping : "assets/images/bag.png",
  ExpenceCategory.subscription : "assets/images/bill.png",
};

//category images
final Map <ExpenceCategory,Color> expenseCategoriesColors = {
  ExpenceCategory.food : const Color(0xFFE57373),
  ExpenceCategory.transport: const Color(0xFF81C784),
  ExpenceCategory.health : const Color(0xFF6485F6),
  ExpenceCategory.shopping : const Color(0xFFFFD54F),
  ExpenceCategory.subscription : const Color(0xFF9575CD),

};


//model
class Expense{
  final int id;
  final String title;
  final double amount;
  final ExpenceCategory category;
  final DateTime date;
  final DateTime time;
  final String description;

  Expense({
    required this.id,
     required this.title,
      required this.amount,
       required this.category,
        required this.date,
         required this.time, 
         required this.description
         });


//convertthe expense object to a JSON object
Map < String , dynamic > toJSON (){
return {
  'id': id,
  'title':title,
  'amount':amount,
  'category': category.index,
  'date':date.toIso8601String(),
  'time':time.toIso8601String(),
  'description':description,

};
}

//creat an expense object feom a JSON object
factory Expense.fromJSON(Map<String,dynamic>json){
  return Expense(
    id: json['id'],
    title: json['title'],
     amount: json['amount'],
      category: ExpenceCategory.values[json['category']],
       date: DateTime.parse(json['date']),
        time: DateTime.parse(json['time']),
         description: json['description'],
         );
}
}