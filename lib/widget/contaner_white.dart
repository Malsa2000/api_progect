
import 'package:flutter/material.dart';
class ContanerWhite extends StatelessWidget {

  final  Widget widget;
  final double? width;
  final double? height;
  final int? color ;
  final double topRight ;
  final double topLaft ;
  final double bottomRight ;
  final double bottomLeft;
  final double margin;



  const ContanerWhite({
    required this.widget,
    this.width,
    this.color =(0xFFFFFFFF),
    this.height,
    this.bottomRight =0,
    this.topLaft =0,
    this.bottomLeft =0,
    this.topRight =0,
    this.margin = 0,
   Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        margin: EdgeInsets.symmetric(horizontal: margin),

        decoration: BoxDecoration(
          color: Color(color!),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(topLaft),
                bottomLeft: Radius.circular(bottomLeft),
                bottomRight: Radius.circular(bottomRight),
              topRight: Radius.circular(topRight),
            ),
      boxShadow: [
            BoxShadow(
                offset: Offset(0, 2),
                color: Colors.black45,
                blurRadius: 5)
          ],
        ),
        child:(widget));
  }
}
