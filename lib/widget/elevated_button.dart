import 'package:api_progect/controller/controller_helper.dart';
import 'package:flutter/material.dart';
class elevatedButton extends StatelessWidget {

  final String buttonText;
  final double padding ,size;
  final void Function() onClick;

  const elevatedButton({
    Key? key,
    required this.buttonText,
    required this.padding,
    required this.onClick,
    required  this.size,

  }) :super(key: key);


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Color(context.yellowColor),
            minimumSize: Size(double.infinity, size),
           maximumSize: Size(double.infinity, size),
          elevation: 2,
            alignment: AlignmentDirectional.center,
            padding: EdgeInsets.symmetric(horizontal: padding),

        ),
        onPressed: () =>onClick,
        child: context.text(
            text: buttonText, size: 20, color: context.wihteColor));
  }
}
