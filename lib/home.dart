import 'dart:convert';
import 'package:flutter/material.dart';
import 'controller/catodres_api_controller.dart';
import 'package:http/http.dart' as http;
import 'detils.dart';
import 'models/sub_catogres.dart';


class home extends StatefulWidget {
  home({Key? key , required this.id}) : super(key: key);
   int id  ;
  @override
  State<home> createState() => _homeState();
}
class _homeState extends State<home> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<subCatogres>>(
            future:CatogresApiController().getSubCatogres(widget.id),
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
                        InkWell(
                          onTap: (){
                            goNextPages(snapShot.data![index].id);

                          },
                          child: Row(children: [
                            SizedBox(
                                height: 30,width: 30,
                                child:Image(image: NetworkImage(snapShot.data![index].imageUrl),)

                              // Image.network(
                              //     snapShot.data![index].imageUrl),
                            ),
                            Text(snapShot.data![index].nameAr),
                            Text(snapShot.data![index].nameEn),



                          ],),
                        );
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
  goNextPages( int id){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Details(id: id),));
  }

}
