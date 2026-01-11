import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_app/constants/colors.dart';
import 'package:my_app/models/expense_model.dart';

class ExpenseCard extends StatelessWidget {
  final String titlt;
  final DateTime date;
  final double amount;
  final ExpenceCategory category;
  final String description;
  final DateTime time;
  const ExpenseCard({
    super.key,
     required this.titlt,
      required this.date,
       required this.amount,
        required this.category, 
        required this.description, 
        required this.time
        });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color:  kWhite,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow( color:
           kGrey.withOpacity(0.4),
           spreadRadius: 1,
           blurRadius: 10,
           offset: const Offset(0, 1),

           ),
        ]
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration:BoxDecoration(
              color: expenseCategoriesColors[category]?.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
              
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                expenseCategoriesImages[category]!,
                width: 20,
                height: 20,
                fit: BoxFit.cover,
                ),
            ),

          ),
          SizedBox(width: 10,),
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(titlt,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: kBlack,
            ),),
            SizedBox(
              width: 150,
              child: Text(
                description,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: kGrey,
              ),),
            ),
          ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
            Text("-\$${amount.toStringAsFixed(2)}",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color:kRed,
            ),),
            Text(
              DateFormat.jm().format(date),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: kGrey,
            ),
            overflow: TextOverflow.ellipsis,
            ),
          ],
          ),


        ],
      ),
    );
  }
}