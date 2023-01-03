import 'package:api_progect/controller/controller_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/text_field.dart';


class ForgetPass extends StatefulWidget {
  const ForgetPass({Key? key}) : super(key: key);

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
 late TextEditingController _mobilController;
@override
  void initState() {
    super.initState();
    _mobilController = TextEditingController();
  }
  @override
  void dispose() {
  _mobilController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(context.greenColor),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),

            width: 347.w,
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  context.text(
                      text: "Forget Password",
                      size: 30,
                      color: context.greenColor,
                      wieght: FontWeight.w400),
                  context.text(
                      text: "FoodDooR",
                      size: 28,
                      color: context.yellowColor,
                      wieght: FontWeight.w400),
                  SizedBox(
                    height: 20,
                  ),
                  context.text(
                      text: "Forget Password",
                      size: 14,
                      color: context.greyColor,
                      wieght: FontWeight.w200),
                  text_field(controller: _mobilController),
                  ElevatedButton(
                    onPressed: () {
                      performOperation();
                    },
                    child: context.text(
                        text: "Contiune", size: 16, color: (0xFFFFFFFF)),
                    style: ElevatedButton.styleFrom(
                      primary: Color(context.yellowColor),
                      minimumSize: Size(291.w, 44.h),
                      maximumSize: Size(291.w, 44.h),
                      elevation: 2,
                      alignment: AlignmentDirectional.center,
                      padding: EdgeInsets.symmetric(horizontal: 20 ,vertical: 10),
                    ),
                  ),
                ])));
  }

  void performOperation() {
  if(_mobilController.text.isNotEmpty){
    context.snackBar(massage: "Change password Succseful" ,error: false);
    Navigator.pushReplacementNamed(context, '/Login');
  }
  }
}
