import 'package:api_progect/controller/controller_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/catodres_api_controller.dart';
import '../models/city.dart';
import '../widget/text_field.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({Key? key}) : super(key: key);

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late TextEditingController _nameController;
  late TextEditingController _teltephoneController;
  late TextEditingController _adddresController;
  late TextEditingController _quantitiyController;
   String name  = "No Result Found";
   String information  = "No Result Found";
   String number  = "No Result Found";

  CatogresApiController dropDownController = CatogresApiController();
  List<City> _cities = <City>[];
  bool createDrop = false;
  late City dropdownvalue;
  int _cityId =1;
  bool _value = false;
  bool _valueSwitched = true;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _nameController = TextEditingController();
    _teltephoneController = TextEditingController();
    _adddresController = TextEditingController();
    _quantitiyController = TextEditingController();
  }
  @override
  void dispose() {
    _nameController.dispose();
    _teltephoneController.dispose();
    _adddresController.dispose();
    _quantitiyController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Address Information"),),
        body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        children: [
          SizedBox(
            height: 10.h,
          ),
          TabBar(
            onTap: (int index) {
              setState(() => _tabController.index = index);
            },
             indicatorColor: Colors.transparent,
            labelColor: Colors.black,
            controller: _tabController,
            tabs: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                margin: EdgeInsets.symmetric(horizontal: 2, vertical: 20),
                decoration: BoxDecoration(
                  color: Color(context.wihteColor),
                  border: Border.all( color:_tabController.index ==0 ? Color(context.greenColor) : Colors.transparent ,width: 2),
                  borderRadius:const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 1),
                        color: Colors.black12,
                        blurRadius: 9)
                  ],
                ),
                child:
                Column(children: [
                  Icon(Icons.view_comfy_alt_outlined, size: 30, color: Color(0xFFFBA808)),
                  Text("Show Address",
                    style: GoogleFonts.ubuntu(color: Color(0xFFFBA808),
                        fontWeight: FontWeight.w600, fontSize: 12),),
                ]),

              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                margin: EdgeInsets.symmetric(horizontal: 2, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all( color:_tabController.index ==1 ? Color(context.greenColor) : Colors.transparent ,width: 2),
                  borderRadius:const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 1),
                        color: Colors.black12,
                        blurRadius: 5)
                  ],
                ),
                child:
                Column(children: [
                  Icon(Icons.add, size: 20, color: Color(0xFFFBA808)),
                  Text("Add Address",
                    style: GoogleFonts.ubuntu(color: Color(0xFFFBA808),
                        fontWeight: FontWeight.w600, fontSize: 12),),
                ]),
              ),
            ],
          ),


          Expanded(
            child: IndexedStack(
              index: _tabController.index,
              children: [
                Visibility(
                    visible: _tabController.index == 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal:
                      30 ,vertical: 30),
                      child: Column(
                        children: [
                        Row(children: [
                          Icon(Icons.circle ,size: 12, color: Color(context.greenColor),),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blue.shade50,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            padding:const EdgeInsets.all(15),
                            margin: const EdgeInsets.only(right: 5 ,left: 15),
                            child:Text("User Name: " ,
                              style: TextStyle(color: Colors.blue.shade900 ,fontSize: 18),),
                          ),
                          context.text(text: "${name} ", size: 15, color: context.blackColor ,wieght: FontWeight.w400),
                        ],),
                          Row(children: [
                            Icon(Icons.circle ,size: 12, color: Color(context.greenColor),),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.green.shade50,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              padding:const EdgeInsets.all(15),
                              margin: const EdgeInsets.only(right: 5 ,left: 15 ,top: 10),
                              child:Text("Adress information: " ,
                                style: TextStyle(color: Colors.green.shade900 ,fontSize: 15),),
                            ),
                            context.text(text: "${information} ", size: 12, color: context.blackColor ,wieght: FontWeight.w400),
                          ],),
                          Row(children: [
                            Icon(Icons.circle ,size: 12, color: Color(context.greenColor),),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.red.shade50,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              padding:const EdgeInsets.all(15),
                              margin: const EdgeInsets.only(right: 5 ,left: 15 ,top: 10),
                              child:Text("Number :" ,
                                style: TextStyle(color: Colors.red.shade900 ,fontSize: 18),),
                            ),
                            context.text(text: "${number} ", size: 15, color: context.blackColor ,wieght: FontWeight.w400),
                          ],),
                          Row(children: [
                            Icon(Icons.circle ,size: 12, color: Color(context.greenColor),),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.yellow.shade100,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              padding:const EdgeInsets.all(15),
                              margin: const EdgeInsets.only(right: 5 ,left: 15 ,top: 10),
                              child:Text("City " ,
                                style: TextStyle(color: Colors.yellow.shade900 ,fontSize: 18),),
                            ),
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
                                        child: Text("${e.nameEn}"),
                                        value: e,
                                      );
                                    }).toList(),

                                    onChanged: (value) {
                                      setState(() {
                                        dropdownvalue = value!;
                                        createDrop = false;
                                        _cityId = value.id;
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

                          ],),
                        ],),
                    )

                ),
                Visibility(
                  visible: _tabController.index == 1,
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            context.text(
                                text: "full Name",
                                size: 16,
                                color: context.blackColor,
                                wieght: FontWeight.w400),
                            SizedBox(height: 5,),
                            text_field(controller: _nameController),


                            SizedBox(height: 15,),
                            context.text(
                                text: "Address",
                                size: 16,
                                color: context.blackColor,
                                wieght: FontWeight.w400),
                            SizedBox(height: 5,),
                            text_field(controller: _adddresController),


                            SizedBox(height: 15,),
                            context.text(
                                text: "Telephon Nmuber",
                                size: 16,
                                color: context.blackColor,
                                wieght: FontWeight.w400),
                            SizedBox(height: 5,),
                            text_field(controller: _teltephoneController,),

                            SizedBox(height: 15,),
                            Row(children: [
                              context.text(
                                  text: "City ",
                                  size: 16,
                                  color: context.blackColor,
                                  wieght: FontWeight.w400),
                              SizedBox(height: 5, width: 20,),
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
                                          child: Text("${e.nameEn}"),
                                          value: e,
                                        );
                                      }).toList(),

                                      onChanged: (value) {
                                        setState(() {
                                          dropdownvalue = value!;
                                          createDrop = false;
                                          _cityId = value.id;
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


                            ],),

                          ],
                        ),
                      ),
                    Container(
                      padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(5),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            color: Color(context.wihteColor),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 2),
                                  color: Colors.black45,
                                  blurRadius: 5)
                            ],
                            borderRadius: BorderRadius.circular(10.r)),
                        child :SwitchListTile(
                          activeColor: Color(context.greenColor),
                          title: context.text(
                              text: "Chooes the Defult Adress"
                              , size: 18, color: context.greenColor),
                               subtitle:context.text
                                 (text: "Gaza Adaress ", size: 15,
                                   color: context.blackColor ,wieght: FontWeight.w400) ,
                                value: _valueSwitched,
                                onChanged: (bool value){
                              setState(() {
                                _valueSwitched = value;
                              });
                            })
                        ),
                          SizedBox(height: 20,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(350.w, 45.h),
                            primary: Color(0xFF00AD8F),
                            maximumSize: Size(350.w, 45.h)),
                        onPressed: () {
                          saveInformation();
                        },
                        child: Text(
                          "Save Information!",
                          style: GoogleFonts.ubuntu(color: Colors.white, fontSize: 20),
                        ),
                      ),
                  ],)
                ),
              ],
            ),
          ),
        ]));
  }
  void saveInformation(){

    if(_nameController.text.isNotEmpty && _adddresController.text.isNotEmpty &&
     _teltephoneController.text.isNotEmpty){
      name = _nameController.text;
      number = _teltephoneController.text;
      information = _adddresController.text;
      context.snackBar(massage: "Successful add address");

    }
    else{
      context.snackBar(massage: "please full requred Data" ,error: true);
    }
  }
}
