import 'package:api_progect/controller/controller_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'local/local_controller.dart';
class languges extends StatelessWidget {
  const languges({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocaeController controller = Get.find();

    return Scaffold(
      appBar: AppBar(title: Text('languges'.tr),),
      body: Container(
        height: 300.h,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 150, horizontal: 20),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Color(context.wihteColor),
          borderRadius: BorderRadius.circular(25.r),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 2),
                color: Colors.black45,
                blurRadius: 5)
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            context.text(text: 'languges'.tr, size: 23, color: context.greenColor ,wieght: FontWeight.w600),
            SizedBox(height: 5,),
            context.text(text: 'languges2'.tr, size: 18, color: context.yellowColor ,wieght: FontWeight.w500),
            SizedBox(height: 10,),
            Divider(height: 5,thickness: 1.3),
            SizedBox(height: 20,),
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(radius: 20,
                  backgroundImage:AssetImage("images/arabic.png")),
              SizedBox(width: 10,),
            context.text(text: "اللغة العربية", size: 18, color: context.greenColor ,wieght: FontWeight.w400),
              Spacer(),
            ElevatedButton(style: ElevatedButton.styleFrom(primary: Color(context.yellowColor) ,maximumSize: Size(100, 60)),
                onPressed: (){
              controller.changLanguges("ar");
            }, child: Text('1'.tr)),
          ],),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(radius: 20,
                    backgroundImage:AssetImage("images/english.png")),
                SizedBox(width: 10,),
                context.text(text: "English", size: 18, color: context.greenColor ,wieght: FontWeight.w400),
                Spacer(),
                ElevatedButton(style: ElevatedButton.styleFrom(primary: Color(context.yellowColor) ,maximumSize: Size(100, 60)),
                    onPressed: (){
                      controller.changLanguges("en");
                    }, child: Text('2'.tr)),

              ],),

            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(radius: 20,
                  backgroundImage:AssetImage("images/fran.png")),
                SizedBox(width: 10,),
                context.text(text: "Franch", size: 18, color: context.greenColor ,wieght: FontWeight.w400),
                Spacer(),
                ElevatedButton(style: ElevatedButton.styleFrom(primary: Color(context.yellowColor) ,maximumSize: Size(100, 60)),
                    onPressed: (){
                      controller.changLanguges("fr");
                    }, child: Text("Franch ")),

              ],),
        ],),
      ),
    );
  }
}
