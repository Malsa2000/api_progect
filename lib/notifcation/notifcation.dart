import 'package:api_progect/controller/controller_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Notfcations extends StatelessWidget {

   Notfcations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notfcations"),),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(children: [
            const  SizedBox(height: 20,),
            CircleAvatar(
            backgroundColor: Color(context.yellowColor),
            radius: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
             Icon(Icons.call ,size: 35, color: Colors.black,),
              context.text(text: "Call Notiy", size: 18, color: context.wihteColor ,wieght: FontWeight.w500),
                context.text(text: "you can mack call", size: 15, color: context.blackColor ,wieght: FontWeight.w300)

            ],),),
            const  SizedBox(height: 20,),
            CircleAvatar(
              backgroundColor: Color(context.greenColor),
              radius: 65,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const  Icon(Icons.email ,size: 30, color: Colors.white,),
                  context.text(text: "Call Notiy", size: 15, color: context.blackColor ,wieght: FontWeight.w500),
                  context.text(text: "you can mack call", size: 12, color: context.wihteColor ,wieght: FontWeight.w300)

                ],),),
            const SizedBox(height: 20,),
            CircleAvatar(
              backgroundColor: Color(context.yellowColor),
              radius: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.access_alarm ,size: 35,color: Colors.black,),
                  context.text(text: "Alarm Notiy", size: 18, color: context.wihteColor ,wieght: FontWeight.w500),
                  context.text(text: "you can mack Alarm", size: 15, color: context.blackColor ,wieght: FontWeight.w300)

                ],),),
            const  SizedBox(height: 20,),
            CircleAvatar(
              backgroundColor: Color(context.greenColor),
              radius: 65,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const  Icon(Icons.accessible_forward ,size: 30,color: Colors.white,),
                  context.text(text: "Call Notiy", size: 15, color: context.blackColor ,wieght: FontWeight.w500),
                  context.text(text: "you can mack call", size: 12, color: context.wihteColor ,wieght: FontWeight.w300)

                ],),),

          ],),
          Column(children: [
            const SizedBox(height: 20,),

            const SizedBox(height: 80,),
            CircleAvatar(
              backgroundColor: Color(context.yellowColor),
              radius: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.label_important ,size: 35,color: Colors.black,),
                  context.text(text: "Call Notiy", size: 18, color: context.wihteColor ,wieght: FontWeight.w500),
                  context.text(text: "you can mack call", size: 15, color: context.blackColor ,wieght: FontWeight.w300)

                ],),),
            const SizedBox(height: 20,),
            CircleAvatar(
              backgroundColor:  Color(context.greenColor),
              radius: 65,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 const  Icon(Icons.account_balance_rounded ,size: 30,color: Colors.white,),
                  context.text(text: "Call Notiy", size: 15, color: context.blackColor ,wieght: FontWeight.w500),
                  context.text(text: "you can mack call", size: 12, color: context.wihteColor ,wieght: FontWeight.w300)

                ],),),
            const SizedBox(height: 20,),
            CircleAvatar(
              backgroundColor: Color(context.yellowColor),
              radius: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.abc ,size: 40,color: Colors.black,),
                  context.text(text: "Call Notiy", size: 18, color: context.wihteColor ,wieght: FontWeight.w500),
                  context.text(text: "you can mack call", size: 15, color: context.blackColor ,wieght: FontWeight.w300)

                ],),),

          ],),
        ],)
    );
  }
}
