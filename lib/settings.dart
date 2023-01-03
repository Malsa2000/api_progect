import 'package:api_progect/controller/controller_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import 'controller/auth_api_controller.dart';
import 'local/local_controller.dart';
import 'models/process_response.dart';

class Settinds extends StatefulWidget {

  const Settinds({Key? key}) : super(key: key);

  @override
  State<Settinds> createState() => _SettindsState();
}

class _SettindsState extends State<Settinds> {
  LocaeController controller = Get.find();
  String _languges ='ar';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Color(context.wihteColor),
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 2),
                      color: Colors.black45,
                      blurRadius: 5)
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, '/languges');
                    },
                    title: context.text(
                        text: 'languges'.tr,
                        size: 16,
                        color: context.greenColor,
                        wieght: FontWeight.w200),
                    subtitle: context.text(
                        text: 'languges2'.tr,
                        size: 12,
                        color: context.blackColor,
                        wieght: FontWeight.w200),
                    leading: Icon(
                      Icons.language,
                      color: Color(context.yellowColor),
                    ),
                    trailing: Icon(Icons.send_rounded),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, '/faqs_test');
                    },
                    title: context.text(
                        text: "faqs".tr,
                        size: 16,
                        color: context.greenColor,
                        wieght: FontWeight.w200),
                    subtitle: context.text(
                        text: "fqas2".tr,
                        size: 12,
                        color: context.blackColor,
                        wieght: FontWeight.w200),
                    leading: Icon(
                      Icons.question_answer,
                      color: Color(context.yellowColor),
                    ),
                    trailing: Icon(Icons.send_rounded),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, '/payment_methods');
                    },
                    title: context.text(
                        text: "cardpay".tr,
                        size: 16,
                        color: context.greenColor,
                        wieght: FontWeight.w200),
                    subtitle: context.text(
                        text: "cardpay2".tr,
                        size: 12,
                        color: context.blackColor,
                        wieght: FontWeight.w200),
                    leading: Icon(
                      Icons.money,
                      color: Color(context.yellowColor),
                    ),
                    trailing: Icon(Icons.send_rounded),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, '/add_address');
                    },
                    title: context.text(
                        text: "address".tr,
                        size: 16,
                        color: context.greenColor,
                        wieght: FontWeight.w200),
                    subtitle: context.text(
                        text: "address2".tr,
                        size: 12,
                        color: context.blackColor,
                        wieght: FontWeight.w200),
                    leading: Icon(
                      Icons.location_on_outlined,
                      color: Color(context.yellowColor),
                    ),
                    trailing: Icon(Icons.send_rounded),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, '/my_account');
                    },
                    title: context.text(
                        text: "profile".tr,
                        size: 16,
                        color: context.greenColor,
                        wieght: FontWeight.w200),
                    subtitle: context.text(
                        text:"profile2".tr,
                        size: 12,
                        color: context.blackColor,
                        wieght: FontWeight.w200),
                    leading: Icon(
                      Icons.person,
                      color: Color(context.yellowColor),
                    ),
                    trailing: Icon(Icons.send_rounded),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, '/reset_new_pass');
                    },
                    title: context.text(
                        text: "changpass".tr,
                        size: 16,
                        color: context.greenColor,
                        wieght: FontWeight.w200),
                    subtitle: context.text(
                        text: "changpass2".tr,
                        size: 12,
                        color: context.blackColor,
                        wieght: FontWeight.w200),
                    leading: Icon(
                      Icons.password,
                      color: Color(context.yellowColor),
                    ),
                    trailing: Icon(Icons.send_rounded),
                  ),
                  ListTile(
                    onTap: () async {
                      ProcessResponse procee = await AuthApiController()
                          .loggOut();
                      if (procee.succsess) {
                        print(procee.massage);
                        context.snackBar(massage: procee.massage, error: true);
                        Navigator.pushNamed(context, '/login');
                      } else {
                        print(procee.succsess);
                        context.snackBar(massage: procee.massage);
                      }
                    },
                    title: context.text(
                        text: "logout".tr,
                        size: 16,
                        color: context.greenColor,
                        wieght: FontWeight.w200),
                    subtitle: context.text(
                        text: "logout".tr,
                        size: 12,
                        color: context.blackColor,
                        wieght: FontWeight.w200),
                    leading: Icon(Icons.logout_outlined,
                        color: Color(context.yellowColor)),
                    trailing: Icon(Icons.send_rounded),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),

              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Color(context.wihteColor),
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 2),
                      color: Colors.black45,
                      blurRadius: 5)
                ],),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  context.text(
                      text: "conuctus".tr,
                      size: 16,
                      color: context.greenColor,
                      align: TextAlign.start),
                  ListTile(
                    title: context.text(text: "mobilenumber".tr,
                        size: 14,
                        color: context.greenColor,
                        wieght: FontWeight.w400,
                        align: TextAlign.start),
                    subtitle: context.text(text: "+123 -123598452",
                        size: 12,
                        color: context.blackColor,
                        wieght: FontWeight.w200,
                        align: TextAlign.start),
                    leading: Icon(Icons.call, color: Colors.green, size: 16,),
                  ),
                  ListTile(
                    title: context.text(text: "facebook".tr,
                        size: 14,
                        color: context.greenColor,
                        wieght: FontWeight.w400,
                        align: TextAlign.start),
                    subtitle: context.text(text: "malsa Badwan",
                        size: 12,
                        color: context.blackColor,
                        wieght: FontWeight.w200,
                        align: TextAlign.start),
                    leading: Icon(
                      Icons.facebook, color: Colors.blueAccent, size: 16,),
                  ),
                  ListTile(
                    title: context.text(text: "gmail".tr,
                        size: 14,
                        color: context.greenColor,
                        wieght: FontWeight.w400,
                        align: TextAlign.start),
                    subtitle: context.text(text: "malsa@gmail.com",
                        size: 12,
                        color: context.blackColor,
                        wieght: FontWeight.w200,
                        align: TextAlign.start),
                    leading: Icon(
                      Icons.alternate_email_outlined, color: Colors.red,
                      size: 16,),
                  ),
                ],),
            ),
          ],
        ));
  }

  void _showLangugesBottomSheet(BuildContext context) async {
    String lanCode = await showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return BottomSheet(
                  onClosing: () {},
                  builder: (context) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "languges",
                          style: GoogleFonts.cairo(
                              fontSize: 18, color: Color(context.yellowColor)),
                        ),
                        Text(
                          "login",
                          style: GoogleFonts.cairo(
                              fontSize: 18, color: Color(context.greenColor)),
                        ),
                        Divider(),
                        RadioListTile<String>(
                            title: Text("ar"),
                            value: "ar",
                            groupValue: _languges,
                            activeColor: Color(context.yellowColor),
                            onChanged: (String? value) {
                              if (value != null) {
                                setState(() => _languges = value);
                                Navigator.pop(context);
                              }
                            }),
                        RadioListTile<String>(
                            title: Text("en"),
                            value: "en",
                            activeColor: Color(context.yellowColor),
                            groupValue: _languges,
                            onChanged: (String? value) {
                              if (value != null) {
                                setState(() => _languges = value);
                                Navigator.pop(context);

                              }
                            }),
                      ],
                    );
                  });
            },
          );
        });

      controller.changLanguges(_languges);
      print(_languges);

  }
}