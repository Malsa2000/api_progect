import 'package:api_progect/apiSetting/api_setting.dart';
import 'package:api_progect/models/process_response.dart';
import 'package:api_progect/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/catodres_api_controller.dart';
import '../models/city.dart';
import '../models/student.dart';
import '../widget/text_field.dart';
import '../controller/auth_api_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/process_response.dart';
import '../controller/controller_helper.dart';
import '../controller/auth_api_controller.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController _mabileController;

  late TextEditingController _passwordController;

  late TextEditingController _nameController;

  String? _nameErorr;

  String? _mobileErorr;

  String? _passwordErorr;

  String? _gender;

  CatogresApiController dropDownController = CatogresApiController();
  List<City> _cities = <City>[];
  bool createDrop = false;
  late City dropdownvalue;
  int _cityId =1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mabileController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();
  }
  @override
  void dispose() {
    _nameController.dispose();
    _mabileController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(context.greenColor),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 80,
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                  height: 600,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 2),
                            color: Colors.black45,
                            blurRadius: 5)
                      ],
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          context.text(
                              text: "singup".tr,
                              size: 25,
                              color: context.greenColor,
                              wieght: FontWeight.w400),
                          context.text(
                              text: "food".tr,
                              size: 20,
                              color: context.yellowColor,
                              wieght: FontWeight.w400),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      context.text(
                          text: "entername".tr,
                          size: 14,
                          color: context.blackColor,
                          wieght: FontWeight.w200),
                      text_field(
                        controller: _nameController,
                        errorText1: _nameErorr,
                        keybord: TextInputType.text,
                        prefexIcon: Icons.title,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      context.text(
                          text: "entermobile".tr,
                          size: 14,
                          color: context.blackColor,
                          wieght: FontWeight.w200),
                      text_field(
                        controller: _mabileController,
                        errorText1: _mobileErorr,
                        keybord: TextInputType.number,
                        prefexIcon: Icons.numbers,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      context.text(
                          text: "enterpass".tr,
                          size: 14,
                          color: context.blackColor,
                          wieght: FontWeight.w200),
                      text_field(
                        controller: _passwordController,
                        errorText1: _passwordErorr,
                        keybord: TextInputType.text,
                        icon: Icons.visibility_outlined,
                        obsecure: true,
                        prefexIcon: Icons.security,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      context.text(
                          text: "gender".tr,
                          size: 14,
                          color: context.blackColor,
                          wieght: FontWeight.w200),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: RadioListTile(
                                title: context.text(
                                    text: "femeal".tr,
                                    size: 14,
                                    color: context.blackColor,
                                    wieght: FontWeight.w300,
                                    align: TextAlign.start),
                                value: 'f',
                                activeColor: Color(context.greenColor),
                                groupValue: _gender,
                                onChanged: (String? value) {
                                  setState(() => _gender = value);
                                }),
                          ),
                          Expanded(
                            child: RadioListTile(
                                title: context.text(
                                    text: "meal".tr,
                                    size: 14,
                                    color: context.blackColor,
                                    wieght: FontWeight.w300,
                                    align: TextAlign.start),
                                value: 'm',
                                activeColor: Color(context.greenColor),
                                groupValue: _gender,
                                onChanged: (String? value) {
                                  setState(() => _gender = value);
                                }),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      context.text(
                          text: "city".tr,
                          size: 14,
                          color: context.blackColor,
                          wieght: FontWeight.w200),

                      FutureBuilder<List<City>>(
                        future: CatogresApiController().getCity(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Center(
                                child: CircularProgressIndicator());

                          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                            _cities = snapshot.data ?? [];
                            if (!createDrop)
                              dropdownvalue = _cities.last;
                            return DropdownButton<City>(
                              value: dropdownvalue,
                              items: _cities.map((e) {
                                return DropdownMenuItem<City>(
                                  child: Text("${e.id} : ${e.nameAr}"),
                                  value: e,
                                );
                              }).toList(),

                              onChanged: (value) {
                                setState(() {
                                  dropdownvalue = value!;
                                  createDrop = false;
                                  _cityId = value.id;
                                  print(value.id);
                                  print(dropdownvalue.nameEn);
                                });
                              },
                            );
                          } else {return
                            Center(
                              child: Column(
                                children: const [
                                  Icon(Icons.warning, size: 80),
                                  Text("No Data!"
                                     ,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                  )
                                ],
                              ),
                            );}},),

                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          performLogin();
                        },
                        child: context.text(
                            text: "contiune".tr, size: 16, color: (0xFFFFFFFF)),
                        style: ElevatedButton.styleFrom(
                          primary: Color(context.yellowColor),
                          minimumSize: Size(340.w, 60.h),
                          elevation: 2,
                          alignment: AlignmentDirectional.center,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ),
                      ),
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  context.text(
                      text: "haveaccount".tr,
                      size: 14,
                      color: context.greyColor,
                      wieght: FontWeight.w200),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: context.text(
                        text: "login".tr,
                        size: 14,
                        color: context.yellowColor,
                        wieght: FontWeight.w400),
                  )
                ],
              )
            ]),
      ),
    );
  }

  void performLogin() {
    if (checkLogin()) {
      login();
    }
  }
  bool checkLogin() {
    checkTextFiled1();
    if (_mabileController.text.isNotEmpty &&
        _nameController.text.isNotEmpty &&
        _gender != null &&
        _passwordController.text.isNotEmpty) {
      return true;
    }
    checkTextFiled1();
    context.snackBar(massage: "enter the value", error: true);
    return false;
  }
  void checkTextFiled1() {
    setState(() {
      _mobileErorr =
          _mabileController.text.isEmpty ? 'Enter Mobile number' : null;
      _passwordErorr = _passwordController.text.isEmpty ? 'Enter pass' : null;
    });
  }

  void login() async {
    ProcessResponse processResponse = await AuthApiController().regester(
        mobile: _mabileController.text,
        password:  _passwordController.text,
        name: _nameController.text,
        gender: _gender!,
        city: _cityId);
    if (processResponse.succsess) {
      Navigator.pushNamed(context, '/veryfied_code');
    }
    else{
    }
    context.snackBar(
        massage: processResponse.massage, error: !processResponse.succsess);

  }

  User get stdent {
    User user = User();
    user.name = _nameController.text;
    user.mobile = _mabileController.text;
    user.password = _passwordController.text;
    user.gender = _gender!;
    user.cityId = _cityId as String;
    return user;
  }
}
