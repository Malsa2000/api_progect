import 'package:api_progect/controller/controller_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class card_item extends StatelessWidget {
  final String image ,text ;

  const card_item({
    Key? key,
    required this.text,
    required this.image
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
        },
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 2),
                    color: Colors.black45,
                    blurRadius: 5)
              ],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.location_on_sharp,
                      color: Color(context.greenColor), size: 12),
                  context.text(
                      text: "Amireca", size: 12, color: (context.greenColor) ,wieght: FontWeight.w500),
                  Spacer(),
                 IconButton(
                      icon: Icon(Icons.favorite_border,
                          color: Color(context.yellowColor), size: 16),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/Favorit');
                      },
                  ),
                ],
              ),
              Expanded(
                child: Image(
                  alignment: Alignment.center,
                  width: 90.w,
                  height: 90.h,
                  fit: BoxFit.scaleDown,
                  image: NetworkImage("$image"),
                ),
              ),
              SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  context.text(
                      text: "$text", size: 17, color: (context.greenColor) ,wieght: FontWeight.w500),
                  Spacer(),
                  context.text(
                      text: "10 \$", size: 15, color: (context.blackColor) ,wieght: FontWeight.w500),
                ],
              ),
              SizedBox(height: 10,),
              context.text(
                  text: "20 Kg", size: 15, color: (context.blackColor) ,wieght: FontWeight.w300),
              SizedBox(height: 10,)
            ],
          ),
        ),
      )
    ;
  }
}


