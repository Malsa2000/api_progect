import 'package:api_progect/controller/controller_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/faqs_model.dart';

class FaqsTest extends StatefulWidget {
  const FaqsTest({Key? key}) : super(key: key);

  @override
  State<FaqsTest> createState() => _FaqsTestState();
}
class _FaqsTestState extends State<FaqsTest> {
  List<FaqsModel> _faqs = <FaqsModel>[
    FaqsModel(qustion: "About the appliction", answer: "Ecomarce food Feed applcation"),
    FaqsModel(qustion: "How i can mack order in Applcation?", answer: "FoodDoor"),
    FaqsModel(qustion: "How Can Add the product", answer: "Using layout add to crt "),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FAQs"),
      ),
      body: ListView.builder(
        itemCount: _faqs.length,
        itemBuilder: (context, index) {
          return Container(
            padding :EdgeInsets.symmetric(horizontal: 10 ,vertical: 20),
            margin:EdgeInsets.symmetric(horizontal: 20 ,vertical: 10),
            decoration:const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
                topRight: Radius.circular(0),
              ),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 1),
                    color: Colors.black12,
                    blurRadius: 9)
              ],
            ),

            child: ExpansionTile(
              title: Text( "${_faqs[index].qustion}" ,
                style: GoogleFonts.ubuntu(color:  Color(context.greenColor) ,
                    fontWeight: FontWeight.w600 ,fontSize: 17),),
              leading: Icon(Icons.question_answer_sharp ),

              //normal expantioal
              backgroundColor:  Colors.white,
              textColor:  Color(context.greenColor),
              iconColor: Color(context.greenColor),

              //collabs=> when expanded
              collapsedBackgroundColor: Colors.white,
              collapsedIconColor:   Color(0xFFFBA808),
              collapsedTextColor:  Color(0xFFFBA808),
              onExpansionChanged: (bool value){
              },

              children: [
                Text(_faqs[index].qustion,style: GoogleFonts.ubuntu(color: Color(0xFFFBA808), fontSize: 15),
                )],
            ),
          );

        },

      ),
    );
  }
}
