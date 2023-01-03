import 'package:api_progect/controller/controller_helper.dart';
import 'package:api_progect/models/sub_catogres.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Widget/cart_item.dart';
import 'controller/catodres_api_controller.dart';
import 'item.dart';
import 'models/categories.dart';

class Catogies extends StatefulWidget {
  Catogies({Key? key, required this.id}) : super(key: key);
    int id;
  @override
  State<Catogies> createState() => _CatogiesState();
}

class _CatogiesState extends State<Catogies>  {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        appBar: AppBar(
          title: Text("SubTitle"),
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, "/bot");
            },
            icon: Icon(Icons.arrow_back_ios_new),
            iconSize: 24,
            color: Color(context.greenColor),
          ),
        ),
        body: FutureBuilder<List<subCatogres>>(
                future:CatogresApiController().getSubCatogres(widget.id),
                builder: (context ,AsyncSnapshot snapShot){
                  if (snapShot.hasError) {
                    return Center(
                     child: Column(
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
                        )
                    );}
                  if(snapShot.hasData){
                    return GridView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30.h),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 15,
                            childAspectRatio: 60 / 80,
                            mainAxisSpacing: 15),
                        itemCount: snapShot.data!.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return SubCatogries(text:snapShot.data![index].nameEn
                              , image: snapShot.data![index].imageUrl ,
                              id : snapShot.data![index].id);
                        });
                  }
                  else {
                    return Center(
                      child: CircularProgressIndicator(color: Color(context.yellowColor),),
                    );
                  }
                })

    );
  }
}

class SubCatogries extends StatelessWidget {
  final String image, text;
  final int id ;

  const SubCatogries({
    Key? key,
    required this.text,
    required this.image,
  required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        goNextPages(id ,context);

      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 2),
                  color: Colors.black45,
                  blurRadius: 5)
            ],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.location_on_sharp,
                    color: Color(context.greenColor), size: 12),
                context.text(
                    text: "Amireca",
                    size: 12,
                    color: (context.greenColor),
                    wieght: FontWeight.w500),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.favorite_border,
                      color: Color(context.yellowColor), size: 16),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/Favorit');
                  },
                ),
              ],
            ),
            Expanded(
              child: Image(
                alignment: Alignment.center,
                width: 90.w,
                height: 90.h,
                fit: BoxFit.scaleDown,
                image: NetworkImage("$image"),
              ),
            ),
            SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                context.text(
                    text: "$text",
                    size: 17,
                    color: (context.greenColor),
                    wieght: FontWeight.w500),
                Spacer(),
                context.text(
                    text: "10 \$",
                    size: 15,
                    color: (context.blackColor),
                    wieght: FontWeight.w500),
              ],
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
  goNextPages(int id ,BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Item(id: id),));

  }

}

class SubCatogres extends StatelessWidget {
  final int index;
 final int id;

  const SubCatogres({
    Key? key,
    required this.index,
    required this.id,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _tabController.index == index,

      child:
      FutureBuilder<List<subCatogres>>(
          future:CatogresApiController().getSubCatogres(id),
          builder: (context ,AsyncSnapshot snapShot){
            if (snapShot.hasError) {
              return Center(
              );}
            if(snapShot.hasData){
              return GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30.h),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      childAspectRatio: 60 / 80,
                      mainAxisSpacing: 15),
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: (){
                          goNextPages(context, snapShot.data![index].id);
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: 170.w,
                          height: 220.h,
                          decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 2),
                                    color: Colors.black45,
                                    blurRadius: 5)
                              ],
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.location_on_sharp,
                                      color: Color(context.greenColor), size: 12),
                                  context.text(
                                      text: "Amireca", size: 12, color: (context.greenColor) ,wieght: FontWeight.w500),
                                  Spacer(),
                                  Container(
                                    width: 36.w,
                                    height: 36.h,
                                    child: IconButton(
                                      icon: Icon(Icons.favorite_border,
                                          color: Color(context.yellowColor), size: 16),
                                      onPressed: () {
                                        Navigator.pushReplacementNamed(context, '/Favorit');
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Image(
                                  width: 90.w,
                                  height: 90.h,
                                  fit: BoxFit.contain,
                                  image: AssetImage(snapShot.data![index].imageUrl),
                                ),
                              ),
                              SizedBox(height: 10,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  context.text(
                                      text: snapShot.data![index].nameEn
                                      , size: 17, color: (context.greenColor) ,wieght: FontWeight.w500),
                                  Spacer(),
                                  context.text(
                                      text: "50\$", size: 15, color: (context.blackColor) ,wieght: FontWeight.w500),
                                ],
                              ),
                              SizedBox(height: 10,),
                              context.text(
                                  text: "10Kg", size: 15, color: (context.blackColor) ,wieght: FontWeight.w300),
                              SizedBox(height: 10,)
                            ],
                          ),
                        ),
                      );
                  });
            }
            else {
              return Center(
                child: CircularProgressIndicator(),
                );
            }
          })
    );
  }

  goNextPages(BuildContext context , int id){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Item(id: id),));
  }
}

Widget tabBar(){
  return ConstrainedBox(
    constraints: BoxConstraints(maxHeight: 120 ,maxWidth: 400 ,minHeight: 120 ,minWidth: 400),
    child: FutureBuilder<List<Categories>>(
        future: CatogresApiController().getCatogtrs(),
        builder: (context, AsyncSnapshot snapShot) {
          if (snapShot.hasError) {
            return Text("error");
          }
          if (snapShot.hasData) {
            return ListView.builder(
                itemCount: snapShot.data!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Item(id:
                      snapShot.data![index].id
                      ),));

                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10 ,vertical: 10),
                      margin: EdgeInsets.symmetric(horizontal: 10 ,vertical: 10),
                      height: 110.h,
                      width: 70.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(context.greenColor),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 4),
                              color: Colors.black45,
                              blurRadius: 5)
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.center,
                        children: [
                          Image(
                            height: 50.h,
                            width: 50.w,
                           image: NetworkImage(snapShot.data![index].imageUrl),
                          ),
                          context.text(
                              text: snapShot.data![index].nameEn,
                              size: 12,
                              color: context.wihteColor,
                              wieght: FontWeight.w600),
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Color(context.yellowColor),
              ),
            );
          }
        }),
  );

}