import 'package:api_progect/controller/controller_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnBording extends StatefulWidget {
  const OnBording({Key? key}) : super(key: key);

  @override
  State<OnBording> createState() => _OnBordingState();
}

class _OnBordingState extends State<OnBording> {
  late PageController _pageController;
  int _curentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCF5DB),
      body: Container(
        child: Column(
          children: [
            SizedBox(height:_curentIndex != 3 ? 64.h : 0.h),
            Container(
              width: 319.w,
              height: _curentIndex != 3 ? 43.h : 0.h ,
              padding: EdgeInsets.symmetric(horizontal: 10 ,vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height:_curentIndex == 0? 25.h :15.h,
                      width: 74.w,
                      color: _curentIndex == 0
                          ? Color(context.greenColor)
                          : Color(context.greyColor),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height:_curentIndex == 1 ? 25.h :15.h,
                      width: 74.w,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      color: _curentIndex == 1
                          ? Color(context.greenColor)
                          : Color(context.greyColor),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height:_curentIndex == 2 ? 25.h :15.h,
                      width: 74.w,
                      color: _curentIndex == 2
                          ? Color(context.greenColor)
                          : Color(context.greyColor),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10 ,vertical: 46.h),
                      height:_curentIndex == 3 ? 25.h :15.h,
                      width: 74.w,
                      color: _curentIndex == 3
                          ? Color(context.greenColor)
                          : Color(context.greyColor),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() => _curentIndex = page);
                },
                children: [
                  Stack(
                    children: [
                      Image(
                        image: AssetImage("images/on_bording3.png"),
                        alignment: AlignmentDirectional.centerEnd,
                        height: double.infinity.w,
                        width: double.infinity.w,
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                        top :20,
                        left: 31,
                        right: 31,
                        child: context.text(
                            text: "onbording1".tr,
                            size: 20,
                            color: (context.blackColor) ,wieght: FontWeight.w700),
                      )
                    ],
                  ),
                  Stack(
                    children: [
                      Image(
                        image: AssetImage("images/on_bording1.png"),
                        alignment: AlignmentDirectional.centerEnd,
                        height: double.infinity.w,
                        width: double.infinity.w,
                        fit: BoxFit.fill,

                      ),
                      Positioned(
                        top :20,
                        left: 31,
                        right: 31,
                        child: context.text(
                            text: "onbording2".tr,
                            size: 20,
                            color: (context.blackColor) ,wieght: FontWeight.w700),
                      )
                    ],
                  ),
                  Stack(
                    children: [
                      Image(
                        image: AssetImage("images/on_bording2.png"),
                        alignment: AlignmentDirectional.centerEnd,
                        height: double.infinity.w,
                        width: double.infinity.w,
                        fit: BoxFit.fill,

                      ),
                      Positioned(
                        top :20,
                        left: 31,
                        right: 31,
                        child: context.text(
                            text: "onbording3".tr,
                            size: 20,
                            color: (context.blackColor) ,wieght: FontWeight.w700),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20 ,right: 20 ,bottom: 20 ,top: 100.h) ,

                    color: Color(context.greenColor),
                 height: double.infinity.h,
                 width: double.infinity.w,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Padding(
                       padding: EdgeInsets.only(top: 20,left: 10 ,right: 110 ,bottom: 20.h) ,
                       child:
                       Column(children: [
                         context.text(text: "welcom".tr, size: 30, color: context.yellowColor ,wieght: FontWeight.w600),
                         context.text(text:"onbording4".tr,
                             size: 16, color: context.wihteColor ,wieght: FontWeight.w300),

                       ],)
                       ,),

                    ElevatedButton(onPressed: (){
                      Navigator.pushReplacementNamed(context, "/login");
                    }, child: context.text(text: "getstart".tr , size: 16, color: context.wihteColor)
                    ,style: ElevatedButton.styleFrom(minimumSize: Size(180 ,44) ,primary:Color( context.yellowColor) ),
                    ),
                     Expanded(child: Image(image: AssetImage("images/on_bording4.png"),
                       height:380.h , width: 350.w, alignment: AlignmentDirectional.bottomEnd,))

                   ],
                 ),

               )
                ],
              ),
            // ),
            // Stack(
            //   children: [
            //     Positioned(
            //       top: 600,
            //       child:
            //     Row(mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         TabPageSelectorIndicator(backgroundColor: _curentIndex ==0 ? Color(context.greenColor) :Colors.black45,
            //             borderColor: Color(context.greenColor), size: 8)
            //         ,TabPageSelectorIndicator(backgroundColor: _curentIndex ==1 ? Color(context.greenColor) :Colors.black45,
            //             borderColor: Color(context.greenColor), size: 8)
            //         ,TabPageSelectorIndicator(backgroundColor: _curentIndex ==2 ? Color(context.greenColor) :Colors.black45,
            //             borderColor: Color(context.greenColor), size: 8)
            //         , TabPageSelectorIndicator(backgroundColor: _curentIndex ==3 ? Color(context.greenColor) :Colors.black45,
            //             borderColor: Color(context.greenColor), size: 8)
            //
            //       ],),
            //
            //     ),
            //   ],
             )


          ],
        ),
      ),
    );
  }
}
