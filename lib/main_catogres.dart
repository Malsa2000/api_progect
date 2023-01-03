import 'package:api_progect/controller/controller_helper.dart';
import 'package:api_progect/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'all_catorgries.dart';
import 'controller/catodres_api_controller.dart';
import 'models/categories.dart';
import 'package:http/http.dart' as http;

class Catogres extends StatefulWidget {
  const Catogres({Key? key}) : super(key: key);

  @override
  State<Catogres> createState() => _CatogresState();
}

class _CatogresState extends State<Catogres> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Catogries"),),
        body: FutureBuilder<List<Categories>>(
            future: CatogresApiController().getCatogtrs(),
            builder: (context, AsyncSnapshot snapShot) {

              if (snapShot.hasError) {
                return Column(
                  children: [
                    Image(
                        height: 220.h,
                        width: 100.w,
                        image: AssetImage("images/search.png")),
                    context.text(
                        text: "Not Result Found!",
                        size: 20,
                        color: context.blackColor,
                        wieght: FontWeight.w600)
                  ],
                );
              }
              if (snapShot.hasData) {
                return ListView.builder(
                    itemCount: snapShot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                          onTap: () {
                            print(snapShot.data![index].id);
                            goNextPages(snapShot.data![index].id);
                          },
                          child: Container(
                              alignment: Alignment.centerLeft,
                              width: 320.w,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 10),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 4),
                                        color: Colors.black45,
                                        blurRadius: 5)
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      topLeft: Radius.circular(50),
                                      bottomLeft: Radius.circular(50),
                                      bottomRight: Radius.circular(10))),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundColor: Color(context.greenColor),
                                    child:Padding(
                                      padding: EdgeInsets.all(15),
                                      child: Image(fit: BoxFit.contain,
                                          image:  NetworkImage(
                                          snapShot.data![index].imageUrl.toString())),
                                    ),


                          ),
                              //    Image.network( snapShot.data![index].imageUrl.toString()),
                                  SizedBox(width: 10,),
                                  context.text(
                                      text: snapShot.data![index].nameEn,
                                      size: 18,
                                      color: context.blackColor),
                                  Spacer(),
                                  context.text(
                                      text: snapShot.data![index].subCategoriesCount,
                                      size: 15,
                                      wieght: FontWeight.w200,
                                      color: context.yellowColor),
                                  SizedBox(width: 20,),

                                ],
                              )));
                    });
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: Color(context.yellowColor),
                  ),
                );
              }



            })

    );
  }

  goNextPages(int id) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => Catogies(id: id),
    ));
  }
}
