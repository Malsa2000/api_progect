import 'package:api_progect/controller/controller_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Favorit extends StatefulWidget {
  const Favorit({Key? key}) : super(key: key);

  @override
  State<Favorit> createState() => _FavoritState();
}

class _FavoritState extends State<Favorit> {
  double _rate = 0;
  List<String> _image = <String>['paper', 'paper2', 'paper3', 'paper3'];
  List<String> _title = <String>['yaneel', 'yasmeen', 'papery', 'zanonu'];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: AlignmentDirectional.topCenter,
          child:Image(height:160.h ,width: double.infinity,
            fit: BoxFit.cover,
            image: AssetImage("images/vegatabels.png"),),
        ),
        Positioned(
          top: 100,
          left: 20,
          child:
          Column(mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            CircleAvatar(
              backgroundImage: AssetImage("images/paper.png" ),
              radius: 45,),
            Padding(padding: EdgeInsets.only(left: 10),
              child: context.text(text: "FoodDoor Malsa",
                size: 18, color: context.blackColor ,wieght: FontWeight.w500),
            ),
              Padding(padding: EdgeInsets.only(left: 20),
                child: context.text(text: "malsa@gmail0com",
                    size: 13, color: context.blackColor ,wieght: FontWeight.w200),
              ),
            ],),
    ),
          Positioned(
            top: 100 ,
            child: Container(
              padding: EdgeInsets.zero,
              child:
              ListView.builder(
                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                 scrollDirection: Axis.vertical,
                 itemCount: 2,
                 itemBuilder: (context, index) {

                   return Container(
                     margin: EdgeInsets.symmetric(vertical: 10),
                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                     alignment: Alignment.center,
                     decoration:const BoxDecoration(
                         color: Color(0xFFFFFFFF),
                         boxShadow: [
                           BoxShadow(
                               offset: Offset(0, 2),
                               color: Colors.black45,
                               blurRadius: 5)
                         ],
                         borderRadius: BorderRadius.only(
                             topRight: Radius.circular(0),
                             topLeft: Radius.circular(50),
                             bottomLeft: Radius.circular(0),
                             bottomRight: Radius.circular(50))),
                     child: Padding(
                       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                       child: Row(
                         children: [
                           Row(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                               Image(
                                 image: AssetImage("images/${_image[index]}.png"),
                                 alignment: Alignment.center,
                                 height: 60.h,
                                 width: 60.w,
                               ),
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 children: [
                                   context.text(
                                       text: _title[index],
                                       size: 18,
                                       color: (context.greenColor),
                                       wieght: FontWeight.w400),
                                   SizedBox(height: 5,),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       context.text(
                                           text: "Rating  : ${_rate.toString()}",
                                           size: 14,
                                           color: (context.blackColor),
                                           wieght: FontWeight.w300),
                                       Container(
                                         height: 8,
                                         width: 120.w,
                                         child: RatingBar.builder(
                                           initialRating: 2,
                                           minRating: 1,
                                           itemSize: 10.0,
                                           direction: Axis.horizontal,
                                           allowHalfRating: true,
                                           itemCount: 5,
                                           itemPadding:
                                           EdgeInsets.symmetric(horizontal: 0.5),
                                           itemBuilder: (context, _) => Icon(
                                             Icons.star,
                                             color: Colors.amber,
                                           ),
                                           onRatingUpdate: (rating) {
                                             setState(() => _rate = rating);
                                           },
                                         ),
                                       ),
                                     ],
                                   ),
                                   SizedBox(height: 5,),

                                   context.text(
                                       text: "Discount code 10\$",
                                       size: 12,
                                       color: (context.blackColor),
                                       wieght: FontWeight.w400),
                                 ],
                               ),


                               SizedBox(height: 10,),
                               context.text(
                                   text: "400 point",
                                   size: 14,
                                   color: (context.yellowColor),
                                   wieght: FontWeight.w300),


                             ],
                           ),
                         ],
                       ),
                     ),
                   );
                 })

        ),
          )

      ]

    );

  }
}
