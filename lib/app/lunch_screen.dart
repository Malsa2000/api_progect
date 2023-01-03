import 'package:api_progect/controller/controller_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LunchScreen extends StatefulWidget {
  const LunchScreen({Key? key}) : super(key: key);

  @override
  State<LunchScreen> createState() => _LunchScreenState();
}

class _LunchScreenState extends State<LunchScreen> {
  
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2) ,(){
      Navigator.pushReplacementNamed(context, '/onBording');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Container(
        color: Color(context.greenColor),
     alignment: Alignment.center,
     child:Text('food'.tr ,style:
     GoogleFonts.cairo(color :Color(context.yellowColor) ,fontSize :55 ,fontWeight: FontWeight.w800 )
     ),
      )
    );
  }
}
