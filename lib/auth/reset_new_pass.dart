import 'package:api_progect/controller/controller_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/text_field.dart';
class RestNewPass extends StatefulWidget {
  const RestNewPass({Key? key}) : super(key: key);

  @override
  State<RestNewPass> createState() => _RestNewPassState();
}

class _RestNewPassState extends State<RestNewPass> {

 late TextEditingController _passwordController;
 late TextEditingController _confirmPassController;
 late TextEditingController _oldpasswordController;
 String  _errorMassge ="";



 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordController = TextEditingController();
    _confirmPassController = TextEditingController();
    _oldpasswordController = TextEditingController();

 }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPassController.dispose();
    _oldpasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(context.greenColor),
        body:  Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: EdgeInsets.symmetric(horizontal: 20 ,vertical: 60),
            width: 347.w,
            height: 500.h,
            alignment: Alignment.center,
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
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  context.text(
                      text: "Reset New password",
                      size: 25,
                      color: context.greenColor,
                      wieght: FontWeight.w400),
                  context.text(
                      text: "FoodDooR",
                      size: 24,
                      color: context.yellowColor,
                      wieght: FontWeight.w400),
                  SizedBox(
                    height: 20,
                  ),
                  context.text(
                      text: "Enter the old passwprd ",
                      size: 12,
                      color: context.blackColor,
                      wieght: FontWeight.w200),
                 text_field(controller: _oldpasswordController ,keybord: TextInputType.text),


                  context.text(
                      text: "Enter the new passwprd ",
                      size: 12,
                      color: context.blackColor,
                      wieght: FontWeight.w200),
                  text_field(controller: _passwordController ,keybord: TextInputType.text ,errorText1: _errorMassge,),

                  context.text(
                      text: "Confirm new passwprd ",
                      size: 12,
                      color: context.blackColor,
                      wieght: FontWeight.w200),
                  text_field(controller: _confirmPassController ,keybord: TextInputType.text ,errorText1: _errorMassge),


                 SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: () {
                      performOperation();
                    },
                    child: context.text(
                        text: "Reset", size: 16, color: (0xFFFFFFFF)),
                    style: ElevatedButton.styleFrom(
                      primary: Color(context.yellowColor),
                      minimumSize: Size(291.w, 50.h),
                      maximumSize: Size(291.w, 50.h),
                      elevation: 2,
                      alignment: AlignmentDirectional.center,
                      padding: EdgeInsets.symmetric(horizontal: 20 ,vertical: 10),
                    ),
                  ),
                ])));

  }



 void performOperation() {
   if(_confirmPassController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
     if (_confirmPassController.text == _passwordController.text) {
      context.snackBar(massage: "change the password succsess" ,error:  false);
     }
     else{_errorMassge ="the passsword dont match with confirm";}
   }
   else{_errorMassge ="the value is Empty";}

 }
}
