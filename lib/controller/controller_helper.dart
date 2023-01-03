
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension ControllerHelp on BuildContext{

 void snackBar({required String massage , bool error =false}){
   ScaffoldMessenger.of(this).showSnackBar(
     SnackBar(content: Text(massage ,style: GoogleFonts.cairo(fontSize: 16 )),
       backgroundColor:error == true ? Color(0xFFEE3237) :Color(0xFFFBA808),
       elevation: 2,
       duration: Duration(seconds: 2),),
   );
   }

 int get wihteColor{
   return (0xFFFFFFFF);
 }
 int get greyColor{
   return (0xFFEBECF5);
 }
 int get yellowColor{
   return (0xFFFBA808);
 }
 int get greenColor{
   return (0xFF00AD8F);
 }
 int get blackColor{
   return (0xFF01000D);
 }
  text( {required String text ,required double size , required int color ,FontWeight wieght = FontWeight.bold ,
    TextAlign align = TextAlign.center,}){
  return Text(
      text ,style :GoogleFonts.ubuntu(fontSize :size ,fontWeight: wieght ,
      color : Color(color) ,height: 0.9) ,textAlign: align,);
  }
}