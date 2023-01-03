import 'package:api_progect/models/process_response.dart';
import 'package:api_progect/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../controller/controller_helper.dart';
import '../controller/auth_api_controller.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  String _languges = "en";
  String? _mobileErorr = "";
  String? _passwordErorr = "";

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(context.greenColor),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                  width: 500,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                          text: "login".tr,
                          size: 28,
                          color: context.greenColor,
                          wieght: FontWeight.w400),
                      context.text(
                          text: "food".tr,
                          size: 25,
                          color: context.yellowColor,
                          wieght: FontWeight.w400),
                      SizedBox(
                        height: 20,
                      ),
                      context.text(
                          text: "entermobile".tr,
                          size: 14,
                          color: context.blackColor,
                          wieght: FontWeight.w200),
                      text_field(
                        controller: _emailController,
                        errorText1: _mobileErorr,
                        keybord: TextInputType.number,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      context.text(
                          text: "enterpass".tr,
                          size: 14,
                          color: context.blackColor,
                          wieght: FontWeight.w200),
                      text_field(
                          controller: _passwordController,
                          errorText1: _passwordErorr,
                          keybord: TextInputType.text,
                          obsecure: true),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, '/forget_pass');
                            },
                            child: context.text(
                                text: "forgetpass".tr,
                                size: 14,
                                color: context.greenColor,
                                wieght: FontWeight.w500),
                          )
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          performLogin();
                        },
                        child: context.text(
                            text: "contiune".tr, size: 16, color: (0xFFFFFFFF)),
                        style: ElevatedButton.styleFrom(
                          primary: Color(context.yellowColor),
                          minimumSize: Size(291.w, 44.h),
                          maximumSize: Size(291.w, 44.h),
                          elevation: 2,
                          alignment: AlignmentDirectional.center,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ),
                      ),
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  context.text(
                      text: "donthave".tr,
                      size: 14,
                      color: context.wihteColor,
                      wieght: FontWeight.w400),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/sign_in');
                    },
                    child: context.text(
                        text: "singup".tr,
                        size: 16,
                        color: context.yellowColor,
                        wieght: FontWeight.w500),
                  )
                ],
              )
            ]),
      ),
    );
  }

  void performLogin() {
    if (checkData()) {
      login();
    }
  }

  bool checkData() {
    checkTextFiled1();
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      return true;
    }
    checkTextFiled1();
    context.snackBar(massage: "enter the value", error: true);
    return false;
  }

  void checkTextFiled1() {
    setState(() {
      _mobileErorr =
          _emailController.text.isEmpty ? 'entermobile'.tr : null;
      _passwordErorr = _passwordController.text.isEmpty ? 'enterpass'.tr : null;
    });
  }

  void login() async {
    ProcessResponse procee = await AuthApiController().login(
        mobile: _emailController.text.toString(),
        password: _passwordController.text.toString());
    if (procee.succsess) {
      print(procee.massage);
      context.snackBar(massage: procee.massage ,error: false);
      Navigator.pushNamed(context, '/bot');
    } else {
      print(procee.succsess);
      context.snackBar(massage: procee.massage);
    }
  }
}
