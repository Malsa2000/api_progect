import 'package:api_progect/controller/controller_helper.dart';
import 'package:api_progect/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  String? _payment ="M";
  String? _namePaymaent ="b";
  bool _click = false;

  @override
  void initState() {
    Provider.of<CartProvider>(context ,listen: false).read();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF00AD8F),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                decoration: BoxDecoration(
                  color: Color(context.wihteColor),
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 2), color: Colors.black45, blurRadius: 5)
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile(
                              title: Text("Bank Payment"),
                              value: 'b',
                              selected: false,
                              activeColor: Color(context.yellowColor),
                              groupValue: _namePaymaent,
                              onChanged: (String? value){
                                setState(() {
                                  _namePaymaent = value;
                                  _click = true ;
                                });
                              }),
                        ),
                        Icon(
                          Icons.check_circle_outline,
                          color: _namePaymaent == 'b'?
                          Color(context.greenColor) :
                          Color(context.greyColor)
                          ,
                        )
                      ],
                    ),
                    Divider(height: 2 ,thickness: 1 ,color: Color(context.blackColor),),
                    SizedBox(height: 10,),
                    context.text(
                        text:
                        "Cash on bank when you receve the order you "
                            "shoulde enter the creadet cart and select "
                            "the total of products ",
                        size: 13,
                        color: context.blackColor,
                        wieght: FontWeight.w300),


                    Container(
                      margin: EdgeInsets.only(left: 20 , top: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.person,
                                color: Color(context.yellowColor),
                                size: 20,
                              ),
                              context.text(
                                  text: "Malsa Badwan",
                                  size: 16,
                                  color: context.blackColor,
                                  wieght: FontWeight.w400)
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.home_repair_service_outlined,
                                color: Color(context.yellowColor),
                                size: 20,
                              ),
                              context.text(
                                  text: "12598432",
                                  size: 16,
                                  color: context.blackColor,
                                  wieght: FontWeight.w400)
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: Color(context.yellowColor),
                                size: 20,
                              ),
                              context.text(
                                  text: "Gaza",
                                  size: 16,
                                  color: context.blackColor,
                                  wieght: FontWeight.w400)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                decoration: BoxDecoration(
                  color: Color(context.wihteColor),
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 2), color: Colors.black45, blurRadius: 5)
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile(
                              title: Text("Cash on delivery"),
                              value: 'c',
                              activeColor: Color(context.yellowColor),

                              selected: false,
                              groupValue: _namePaymaent,
                              onChanged: (String? value){
                                setState(() {
                                  _namePaymaent = value;
                                  _click = true ;
                                });
                              }),
                        ),
                        Icon(
                          Icons.check_circle_outline,
                          color: _namePaymaent == 'c'?
                          Color(context.greenColor) :
                          Color(context.greyColor),
                        )
                      ],
                    ),
                    Divider(height: 2 ,thickness: 1 ,color: Color(context.blackColor),),
                    SizedBox(height: 10,),
                    context.text(
                        text:
                        "Cash on delivery when you receve the order you "
                            "shoulde enter the creadet cart and select "
                            "the total of products ",
                        size: 13,
                        color: context.blackColor,
                        wieght: FontWeight.w300),


                    Container(
                      margin: EdgeInsets.only(left: 20 , top: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.person,
                                color: Color(context.yellowColor),
                                size: 20,
                              ),
                              context.text(
                                  text: "Sara Badwan",
                                  size: 16,
                                  color: context.blackColor,
                                  wieght: FontWeight.w400)
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.home_repair_service_outlined,
                                color: Color(context.yellowColor),
                                size: 20,
                              ),
                              context.text(
                                  text: "12598432",
                                  size: 16,
                                  color: context.blackColor,
                                  wieght: FontWeight.w400)
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: Color(context.yellowColor),
                                size: 20,
                              ),
                              context.text(
                                  text: "Gaza",
                                  size: 16,
                                  color: context.blackColor,
                                  wieght: FontWeight.w400)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],),
          ),

          Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            margin: EdgeInsets.only(top: 20),
            child: Consumer<CartProvider>(
            builder: (context, CartProvider value, child) {

   return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  context.text(
                      text: "total price :",
                      size: 16,
                      color: context.blackColor,
                      wieght: FontWeight.w500),
                  SizedBox(width: 10,),
                  context.text(
                      text: "${value.total}",
                      size: 16,
                      color: context.yellowColor,
                      wieght: FontWeight.w500),
                ],
              );}),
            ),


          ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: Size(350.w, 45.h),
                primary: Color(0xFF00AD8F),
                maximumSize: Size(350.w, 45.h)),
            onPressed: () {},
            child: Text(
              "ok!",
              style: GoogleFonts.ubuntu(color: Colors.white, fontSize: 20),
            ),
          ),
          SizedBox(height: 7,)
        ],
      ),
    );
  }
}
