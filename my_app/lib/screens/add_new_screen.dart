import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_app/constants/colors.dart';
import 'package:my_app/models/expense_model.dart';
import 'package:my_app/models/income_model.dart';
import 'package:my_app/widgets/custom_button.dart';

class AddNewScreen extends StatefulWidget {
  const AddNewScreen({super.key});

  @override
  State<AddNewScreen> createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {

  //state to track the expense or income
  int _selectedMethode = 0;

  ExpenceCategory _expenceCategory = ExpenceCategory.health;
  IncomeCategory _incomeCategory = IncomeCategory.salary;
  final TextEditingController _titleControler = TextEditingController();
  final TextEditingController _descriptionControler = TextEditingController();
  final TextEditingController _amountControler = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  DateTime _selectedTime = DateTime.now();

  @override
  void dispose() {
    _titleControler.dispose();
    _amountControler.dispose();
    _descriptionControler.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _selectedMethode ==0 ? kRed:kGreen,
      body:  SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultFontSize),
            child: Stack(
              children: [
        
                //Expense and income toggle menu
                Padding(
                  padding: const EdgeInsets.all(kDefaultFontSize),
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.06,
                    decoration: BoxDecoration(
                      color: kWhite,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedMethode = 0;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: _selectedMethode ==0 ? kRed:kWhite,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 55,
                                vertical: 10,),
                              child: Text(
                                "Expense",
                                style:TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: _selectedMethode == 0? kWhite:kBlack,
                                ),
                                ),
                            ),
                            ),
                        ),
                  
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedMethode = 1;
                              });
                            },
                            child: Container(
                            decoration: BoxDecoration(
                              color: _selectedMethode  == 1? kGreen: kWhite,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 55,
                                vertical: 10,),
                              child: Text(
                                "Income",
                                style:TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: _selectedMethode == 1? kWhite:kBlack,
                                ),
                                ),
                            ),
                            ),
                          ),
                        
                      ],
                    ),
                  ),
                ),
        
                //amount feild
        
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kDefaultFontSize),
                  child: Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.1,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "How Much?",
                          style: TextStyle(
                            color: kLightGrey.withOpacity(0.8),
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextField(
                    style: TextStyle(
                      fontSize: 60,
                      color: kWhite,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      hintText: "0",
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: kWhite,
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                        
                      ],
                    ),
                  ),
                ),
        
                //user data from
        
                Container(
                  height: MediaQuery.of(context).size.height*0.7,
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height*0.3,
                  ),
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      child: Column(
                        children: [
                          //category selector dropdown
                          DropdownButtonFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 20,
                                ),
                            ),
                            items:_selectedMethode == 0 ? ExpenceCategory.values.map((category){
                              return DropdownMenuItem(
                                value: category,
                                child: Text(category.name),
                                );
                            }).toList(): IncomeCategory.values.map((category){
                              return DropdownMenuItem(
                                value: category,
                                child: Text(category.name),
                                );
                            }).toList(),

                            value: _selectedMethode ==0 ? _expenceCategory:_incomeCategory,
                          onChanged: (value){
                            setState(() {
                              _selectedMethode == 0 
                              ? _expenceCategory =
                               value as ExpenceCategory
                                :_incomeCategory = value as IncomeCategory;
                            });
                          },
                          ),

                          SizedBox(
                            height: 20,
                          ),

                          //title feild

                          TextFormField(
                            controller: _titleControler,
                            decoration: InputDecoration(
                               contentPadding: EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 20,
                                ),
                              hintText: "Title",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              )
                            ),
                          ),
                           SizedBox(
                            height: 20,
                          ),

                          //descriptio feild
                          TextFormField(
                            controller: _descriptionControler,
                            decoration: InputDecoration(
                               contentPadding: EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 20,
                                ),
                              hintText: "Discription",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              )
                            ),
                          ),
                           SizedBox(
                            height: 20,
                          ),

                          //amount feild

                          TextFormField(
                            controller: _amountControler,
                            decoration: InputDecoration(
                               contentPadding: EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 20,
                                ),
                              hintText: "Amount",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              )
                            ),
                          ),
                           SizedBox(
                            height: 20,
                          ),

                          //date picker
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showDatePicker(
                                    context: context, 
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2026),
                                     lastDate: DateTime(2030),
                                     ).then((value){
                                      if(value != null){
                                        setState(() {
                                          _selectedDate = value ;
                                        });
                                      }
                                     }
                                     );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: kMainColor,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 10,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                        Icons.calendar_month_outlined,
                                        color: kWhite,
                                        ),
                                        SizedBox(width: 10,),
                                        Text(
                                          "Select Date",
                                          style: TextStyle(
                                            color: kWhite,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                DateFormat.yMMMd().format(_selectedDate),
                                style: TextStyle(
                                  color: kGrey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 20,),
                          //time picker
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                 showTimePicker(
                                  context: context, 
                                  initialTime: TimeOfDay.now(),
                                  ).then((value) {
                                    if (value != null ){
                                      setState(() {
                                         _selectedTime = DateTime(
                                        _selectedDate.year,
                                        _selectedDate.month,
                                        _selectedDate.day,
                                        value.hour,
                                        value.minute,
                                      );
                                      });
                                      
                                    }

                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: kYellow,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 10,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                        Icons.timer,
                                        color: kWhite,
                                        ),
                                        SizedBox(width: 10,),
                                        Text(
                                          "select Time",
                                          style: TextStyle(
                                            color: kWhite,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                DateFormat.jm().format(_selectedTime),
                                style: TextStyle(
                                  color: kGrey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                           SizedBox(height: 20,),

                           Divider(
                            color: kLightGrey,
                            thickness: 5,
                           ),
                            SizedBox(height: 20,),

                            CustomButton(
                              buttonName: "Add",
                               buttonColor: _selectedMethode == 0 ? kRed:kGreen,
                               ),
                            
                        ],
                      ),
                    ),
                  ),
                ),
                
              ],
            ),
          ),
        
        ),
        ),
    );
  }
}