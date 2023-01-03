import 'package:api_progect/controller/shared_pref_controlledr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../main.dart';

class LocaeController extends GetxController{
  static String  languges =SharedPrefController().
  getValueForKey<String>(prefKey.languges.name) ?? 'en';
  //Locale locale = sharedPreferences!.getString("lang") == "en" ? Locale("en") :Locale("en");

  void changLanguges(String codeLangud){
  //  codeLangud =languges =='er' ?'ar' : 'en';
  //  SharedPrefController().changLanguges(langCode: languges);
    Locale locale = Locale(codeLangud);
    Get.updateLocale(locale);
  }
}