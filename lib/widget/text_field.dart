import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controller/controller_helper.dart';
import 'package:google_fonts/google_fonts.dart';

class text_field extends StatefulWidget {
  final TextEditingController? controller;
  final IconData? icon;

  final IconData? prefexIcon;
  final bool obsecure;
  final String? errorText1;
  final TextInputType? keybord;

  const text_field(
      {Key? key,
      required this.controller,
      this.obsecure = false,
      this.icon,
      this.keybord,
      this.prefexIcon,
      this.errorText1})
      : super(key: key);

  @override
  State<text_field> createState() => _text_fieldState();
}

class _text_fieldState extends State<text_field> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.obsecure,
      keyboardType: widget.keybord,
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.prefexIcon ,color: Color(context.greenColor),),
        filled: true,
        errorText: widget.errorText1,
        fillColor: Color(context.greyColor),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: Color(context.greenColor), width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.0, color: Color(context.greenColor)),
          borderRadius: BorderRadius.circular(16.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: Color(context.yellowColor), width: 1.0),
        ),
      ),
      enabled: true,
    );
  }
}
