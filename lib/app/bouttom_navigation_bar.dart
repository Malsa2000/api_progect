import 'package:api_progect/controller/controller_helper.dart';
import 'package:flutter/material.dart';
import '../cart.dart';
import '../favorit.dart';

import '../settings.dart';
import 'home.dart';


class NavigatorButtom extends StatefulWidget {
  const NavigatorButtom({Key? key}) : super(key: key);

  @override
  State<NavigatorButtom> createState() => _NavigatorButtomState();
}

class _NavigatorButtomState extends State<NavigatorButtom> {
    final List<BnScreen> _screen = <BnScreen> [
    BnScreen(title: "", widget: Home()),
     BnScreen(title: "Favorit", widget: Favorit()),
     BnScreen(title: "Setting", widget: Settinds()),

  ];
  int _currentPaeg = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(title:Text(_screen[_currentPaeg].title),
      actions: [
        IconButton(icon :Icon( Icons.notification_add_sharp ),onPressed: (){
          Navigator.pushNamed(context, '/notfcation');
        },),

      ],),
       // extendBodyBehindAppBar: true,
        body: _screen[_currentPaeg].widget,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(context.greenColor),
            elevation: 5,
            onTap: (int cuttentPage) {
              setState(() => _currentPaeg = cuttentPage);
            },
            currentIndex: _currentPaeg,
            selectedIconTheme: IconThemeData(color: Color( context.yellowColor) ),
            selectedLabelStyle: TextStyle(
                fontWeight: FontWeight.bold, color:Color( context.yellowColor) ,fontSize: 14),
            selectedItemColor: Color(context.yellowColor),
            unselectedIconTheme: IconThemeData(color: Color( context.wihteColor)),
            unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w100, color:Color( context.wihteColor), fontSize: 12),
            items:const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  activeIcon: Icon(Icons.home_outlined),
                  label: "Home",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  activeIcon: Icon(Icons.favorite_border),
                  label: "Favorit",
                ),

              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  activeIcon: Icon(Icons.settings),
                  label: "Setting",
             ),
            ]),
    );
  }


}

class BnScreen {
  String title;
  Widget widget;

  BnScreen({required this.title,required this.widget});
}

