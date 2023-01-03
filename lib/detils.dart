import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'controller/catodres_api_controller.dart';
import 'models/categories.dart';
import 'apiSetting/api_setting.dart';
import 'package:http/http.dart' as http;

import 'models/catogres_details.dart';
import 'models/sub_catogres.dart';


class Details extends StatefulWidget {
  Details({Key? key , required this.id}) : super(key: key);
  int id  ;
  @override
  State<Details> createState() => _DetailsState();
}
class _DetailsState extends State<Details> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<CatogresDetalis>>(
            future:CatogresApiController().getCatoresDetails(widget.id),
            builder: (context ,AsyncSnapshot snapShot){
              if (snapShot.hasError) {
                return Center(
                  child: CircularProgressIndicator(),
                );}
              if(snapShot.hasData){
                return ListView.builder(
                    itemCount: snapShot.data!.length,
                    itemBuilder: (context ,index){
                      return
                        Column(children: [
                          Container(
                            alignment: Alignment.centerLeft,
                              width :320.w,
                              padding: EdgeInsets.symmetric(horizontal: 10 ,vertical: 10),
                              margin: EdgeInsets.symmetric(horizontal: 20 ,vertical: 10),
                              height :80.h,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 4),
                                        color: Colors.black45,
                                        blurRadius: 5)
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topRight :Radius.circular(10),
                                      topLeft :Radius.circular(40),
                                      bottomLeft: Radius.circular(40),
                                      bottomRight: Radius.circular(10))),
                              child: Row(children :[
                                CircleAvatar(radius: 30, child:
                                Image(height: 60,
                                      width: 60,
                                    image: NetworkImage(snapShot.data![index].imageUrl)),),
                                Column(children: [
                                  Text(snapShot.data![index].nameEn),
                                  Text(snapShot.data![index].infoEn),
                                  Text(snapShot.data![index].quantity),
                                ],),

                              ])
                          ),




                        ],);

                    });

              }
              else {
                return Center(
                  child: Column(
                    children: [
                      SizedBox(height: 120,),
                      Text("Not Result fonud"),
                      Text("Not Result fonud"),
                      Text("Not Result fonud"),

                    ],
                  ),
                );
              }
            })
    );
  }


}
