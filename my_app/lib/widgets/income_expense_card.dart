import 'package:flutter/material.dart';
import 'package:my_app/constants/colors.dart';

class IncomeExpenseCard extends StatefulWidget {

final String title ;
final double amount;
final String imageUrl;
final Color bgColor;


  const IncomeExpenseCard({
    super.key, 
    required this.title,
     required this.amount, 
     required this.imageUrl, 
     required this.bgColor});

  @override
  State<IncomeExpenseCard> createState() => _IncomeExpenseCardState();
}

class _IncomeExpenseCardState extends State<IncomeExpenseCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.46,
      height: MediaQuery.of(context).size.height*0.1,
      decoration: BoxDecoration(
        color: widget.bgColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.15,
              width: MediaQuery.of(context).size.width*0.15,
        
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Image.asset(
                  widget.imageUrl,
                  width: 70,
                  ),
              ),
            ),
            const SizedBox(width: 10,),
            Column(
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                  fontSize: 17,
                  color: kWhite,
                  fontWeight: FontWeight.w500,
                ),
                ),
                Text(
                  widget.amount.toStringAsFixed(0),
                  style: TextStyle(
                  fontSize: 20,
                  color: kWhite,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}