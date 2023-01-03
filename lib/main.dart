import 'package:api_progect/cart.dart';
import 'package:api_progect/favorit.dart';
import 'package:api_progect/log.dart';
import 'package:api_progect/provider/cart_provider.dart';
import 'package:api_progect/setting/account.dart';
import 'package:api_progect/auth/login.dart';
import 'package:api_progect/auth/singin.dart';
import 'package:api_progect/setting/add_address.dart';
import 'package:api_progect/setting/show_address.dart';
import 'package:api_progect/setting/test.dart';
import 'package:api_progect/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:api_progect/main_catogres.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'app/bouttom_navigation_bar.dart';
import 'app/home.dart';
import 'app/lunch_screen.dart';
import 'app/on_bording.dart';
import 'auth/forget_pass.dart';
import 'auth/reset_new_pass.dart';
import 'auth/verifcation_mobile.dart';
import 'controller/db_controller.dart';
import 'controller/shared_pref_controlledr.dart';
import 'local/local.dart';
import 'local/local_controller.dart';
import 'notifcation/notifcation.dart';
import 'order/add_order.dart';
import 'order/order_det.dart';
import 'setting/faqs.dart';

//SharedPreferences? sharedPreferences;
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().inittalShared();
  await DbController().initDataBase();
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Get.put(LocaeController());
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
        builder: (context ,child){
          return   MultiProvider(
            providers: [
              ChangeNotifierProvider<CartProvider>(create: (context) => CartProvider()),
            ],
            builder: (context, widget) {
             return GetMaterialApp(
                theme: ThemeData(
                    appBarTheme: AppBarTheme(
                        backgroundColor: Color(0xFF00AD8F),
                        centerTitle: false,
                        elevation: 0,
                        iconTheme: const IconThemeData(
                            color: Color(0xFFFBA808)),
                        titleTextStyle: GoogleFonts.ubuntu(
                          fontSize: 18,
                          color: const Color(0xFFFFFFFF),
                        ))),
                locale: Get.deviceLocale,
                translations :MyLocale(),
                debugShowCheckedModeBanner: false,
                initialRoute: '/LunchScreen',
                routes: {
                  '/onBording': (context) => const OnBording(),
                  '/LunchScreen': (context) => const LunchScreen(),
                  '/Home': (context) => Home(),
                  '/payment_methods' :(context) => Test(),
                  '/my_account' :(context) =>Account(),
                  '/faqs_test' :(context) => FaqsTest(),
                  '/login' :(context) => Login(),
                  '/sign_in' :(context) => SignUp(),
                  '/allCatogres': (context)=> Catogres(),
                  '/setting': (context)=> Settinds(),
                  '/favorit': (context)=> Favorit(),
                  '/bot': (context)=> NavigatorButtom(),
                  '/Favorit': (context) => const Favorit(),
                  '/veryfied_code': (context) => const VerfcationMobile(),
                  '/forget_pass': (context) => const ForgetPass(),
                  '/reset_new_pass': (context) => RestNewPass(),
                  '/order': (context) => Order(),
                  '/notfcation': (context) => Notfcations(),
                  '/add_address': (context) => AddAddress(),
                  '/show_address': (context) => ShowAddress(),
                  '/languges' :(context) =>languges(),
                  '/cart' :(context) =>Cart(),

                },
              );
            },
          );


      }
    );


  }
}

