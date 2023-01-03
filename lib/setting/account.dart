import 'package:api_progect/controller/controller_helper.dart';
import 'package:api_progect/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Account extends StatefulWidget {
   Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
 late TextEditingController _name , pass , third ;
@override
  void initState() {
    super.initState();
    _name = TextEditingController();
    pass = TextEditingController();
    third = TextEditingController();

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor:Color(0xFF00AD8F),
        elevation: 0,
        title: Text("Edit My Account" ,),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 2),
                      color: Colors.black45,
                      blurRadius: 5)
                ],
                color: Color(0xFF00AD8F),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child:Column(children: [
              CircleAvatar(
                radius: 50,
                // backgroundColor: Colors.white,
                backgroundImage: AssetImage("images/profile_image.jpg"),
              ),
              context.text(text: "Malsa Badwan", size: 18, color: context.wihteColor ,wieght: FontWeight.w500),
              context.text(text: "Information About Malsa Badwn", size: 13, color: context.wihteColor,wieght: FontWeight.w300),
              SizedBox(
                height: 10,
              ),
            ],)
           ),
          SizedBox(
            height: 20,
          ),
           Container(
             padding: EdgeInsets.symmetric(horizontal: 20),
             margin: EdgeInsets.symmetric(horizontal: 20),

             child: Column(
               children: [
                 Container(
                     alignment: Alignment.topLeft,
                     child:   context.text(text: "Enter Yor city", size: 15, color: context.greenColor ,wieght: FontWeight.w300)
                 ),
                 text_field(controller: _name ),
                 SizedBox(
                   height: 10,
                 ),
                 Container(
                     alignment: Alignment.topLeft,
                     child:   context.text(text: "Enter Yor Name", size: 15, color: context.greenColor,wieght: FontWeight.w300)
                 ),
                 text_field(controller: _name ),
                 SizedBox(
                   height: 10,
                 ),
                 Container(
                     alignment: Alignment.topLeft,
                     child:   context.text(text: "Enter Yor Birithday", size: 15, color: context.greenColor,wieght: FontWeight.w300)
                 ),
                 text_field(controller: pass ),

                 SizedBox(
                   height: 20,
                 ),
                 ElevatedButton(onPressed: (){}, child: Text("Update Profile Infprmation") ,
                   style: ElevatedButton.styleFrom(primary: Color(context.yellowColor)),)
               ],
             ),
           )

        ],
      ),
    );
  }
}
