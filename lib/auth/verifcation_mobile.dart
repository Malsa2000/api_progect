import 'package:api_progect/controller/controller_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerfcationMobile extends StatefulWidget {



  const VerfcationMobile({Key? key}) : super(key: key);

  @override
  State<VerfcationMobile> createState() => _VerfcationMobileState();
}

class _VerfcationMobileState extends State<VerfcationMobile> {

 late TextEditingController _num1Controler;
 late TextEditingController _num2Controler;
 late TextEditingController _num3Controler;
 late TextEditingController _num4Controler;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _num1Controler = TextEditingController();
    _num2Controler = TextEditingController();
    _num3Controler = TextEditingController();
    _num4Controler = TextEditingController();

 }
 @override
  void dispose() {
   _num1Controler.dispose();
   _num2Controler.dispose();
   _num3Controler.dispose();
   _num4Controler.dispose();

   super.dispose();
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Color(context.greenColor),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),

        width: 347.w,
        height: 350.h,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 2),
                  color: Colors.black45,
                  blurRadius: 5)
            ],
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  context.text(
                      text: "Vertfication mobile",
                      size: 25,
                      color: context.greenColor,
                      wieght: FontWeight.w400),
                  context.text(
                      text:"FoodDooR",
                      size: 20,
                      color: context.yellowColor,
                      wieght: FontWeight.w400),
                ],
              ),
                    SizedBox(height: 20,),
              Row(
                children: [
                context.text(text: "Entert the number code send via",
                    size: 14, color: context.blackColor ,wieght: FontWeight.w200),
                context.text(text: "+22519180", size: 14, color: context.greenColor ,wieght: FontWeight.w300 ,align: TextAlign.start)

              ],)
            ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: TextField(
                  controller: _num1Controler ,
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  decoration: InputDecoration(
                    counterText: "",
                    constraints: BoxConstraints(
                      maxHeight: 100.h,
                      maxWidth: 60.w,
                    ),
                    filled :true,
                    fillColor: Color(context.greyColor),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.0 ,color:Color( context.greenColor)),
                      borderRadius: BorderRadius.circular(10),
                    )
                  ),
                ),
              ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    controller: _num2Controler ,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    decoration: InputDecoration(
                        counterText: "",
                        constraints: BoxConstraints(
                          maxHeight: 100.h,
                          maxWidth: 60.w,
                        ),
                        filled :true,
                        fillColor: Color(context.greyColor),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1.0 ,color:Color( context.greenColor)),
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    controller: _num3Controler ,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    decoration: InputDecoration(
                        counterText: "",
                        constraints: BoxConstraints(
                          maxHeight: 100.h,
                          maxWidth: 60.w,
                        ),
                        filled :true,
                        fillColor: Color(context.greyColor),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1.0 ,color:Color( context.greenColor)),
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    controller: _num4Controler ,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    decoration: InputDecoration(
                        counterText: "",
                        constraints: BoxConstraints(
                          maxHeight: 100.h,
                          maxWidth: 60.w,
                        ),
                        filled :true,
                        fillColor: Color(context.greyColor),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1.0 ,color:Color( context.greenColor)),
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),
                  ),
                ),
              ],),
            SizedBox(height: 30,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(context.yellowColor),
                  minimumSize: Size(double.infinity, 44),
                  maximumSize: Size(double.infinity, 44),
                  elevation: 2,
                  alignment: AlignmentDirectional.center,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                ),
                onPressed: () {
                  performCheched();
                },
                child: context.text(
                    text: "Verifecation", size: 16, color: context.wihteColor))

          ],
        ),
      ),
    );
  }


 void performCheched(){
  if( checked()){}
  }
   bool checked(){
   if( _num1Controler.text.isNotEmpty && _num2Controler.text.isNotEmpty
       && _num3Controler.text.isNotEmpty  && _num4Controler.text.isNotEmpty ){

     context.snackBar(massage: "check Code true" ,error: false);

     Future.delayed(Duration(seconds: 1) ,(){
       goHome();
     });
     return true;
   }
   context.snackBar(massage: "try Aign Code Not true" ,error: true);

   return false;
   }
    goHome(){
   Navigator.pushReplacementNamed(context, '/bot');
}
}

