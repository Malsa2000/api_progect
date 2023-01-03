import 'package:flutter/material.dart';

import '../controller/shared_pref_controlledr.dart';

class LangugesProvider extends ChangeNotifier{

  static String  languges =SharedPrefController().
  getValueForKey<String>(prefKey.languges.name) ?? 'en';


  void changLanguges(){
    languges =languges =='er' ?'ar' : 'en';
    SharedPrefController().changLanguges(langCode: languges);
    notifyListeners();
  }

}