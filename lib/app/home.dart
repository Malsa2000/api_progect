import 'package:api_progect/controller/controller_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controller/catodres_api_controller.dart';
import '../models/categories.dart';
import '../models/catogres_details.dart';
import '../models/home_last_item.dart';
import '../widget/cart_item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController _pageController;
  int _currentIndex = 0;
  List<String> _image_pageview = <String>[
    "pag_view1",
    "pag_view2",
    "pag_view1",
    "pag_view2",
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 2, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(context.greyColor),
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 210.h,
                  width: 360.w,
                  child: Column(
                      children: [
                        SizedBox(height: 10,),
                    Row(
                      children: [
                        context.text(
                            text: "FOOD",
                            size: 28,
                            color: context.wihteColor,
                            wieght: FontWeight.w500),
                        context.text(
                            text: "DOOR",
                            size: 28,
                            color: context.yellowColor,
                            wieght: FontWeight.w500)
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          size: 9,
                          color: Color(context.wihteColor),
                        ),
                        context.text(
                            text: "202 AlNakhel street in Gaza ,M205132",
                            size: 14,
                            color: context.wihteColor,
                            wieght: FontWeight.w400)
                      ],
                    ),
                  ]),
                  decoration: BoxDecoration(
                    color: Color(context.greenColor),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                ),
                Container(
                  width: 360.w,
                  decoration: BoxDecoration(
                    color: Color(context.wihteColor),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
                ),
              ],
            ),
            Positioned(
                top: 70,
                child: Column(
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: 170.h,
                        minWidth: 350.w,
                        maxHeight: 170.h,
                        maxWidth: 350.w,
                      ),
                      child: PageView.builder(
                          itemCount: 4,
                          controller: _pageController,
                          onPageChanged: (int pagIndex) {
                            setState(() => _currentIndex = pagIndex);
                          },
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              alignment: Alignment.center,
                              height: 180.h,
                              width: 350.w,
                              child: Image(
                                // image: AssetImage("images/${_image_pageview[index]}.png"),
                                image: AssetImage(
                                    "images/${_image_pageview[index]}.png"),
                              ),
                            );
                          }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TabPageSelectorIndicator(
                            backgroundColor: _currentIndex == 0
                                ? Color(context.greenColor)
                                : Colors.black45,
                            borderColor: Color(context.greenColor),
                            size: 8),
                        TabPageSelectorIndicator(
                            backgroundColor: _currentIndex == 1
                                ? Color(context.greenColor)
                                : Colors.black45,
                            borderColor: Color(context.greenColor),
                            size: 8),
                        TabPageSelectorIndicator(
                            backgroundColor: _currentIndex == 2
                                ? Color(context.greenColor)
                                : Colors.black45,
                            borderColor: Color(context.greenColor),
                            size: 8),
                        TabPageSelectorIndicator(
                            backgroundColor: _currentIndex == 3
                                ? Color(context.greenColor)
                                : Colors.black45,
                            borderColor: Color(context.greenColor),
                            size: 8)
                      ],
                    ),
                  ],
                )),
            Positioned(
              top:270 ,
                left: 10,
                right: 10,
                child: ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 400 ,maxWidth: 380),
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    children: [
                  row_main(text: "Catogres", rout: '/allCatogres'),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        minWidth: 320,
                        minHeight: 90,
                        maxWidth: 320,
                        maxHeight: 90),
                    child: FutureBuilder<List<Categories>>(
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
                              return GridView.builder(
                                        scrollDirection: Axis.horizontal,
                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 1,
                                            crossAxisSpacing: 20,
                                            mainAxisSpacing: 20,
                                            childAspectRatio: 100 / 70),
                                        itemCount: snapShot.data!.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            height: 90.h,
                                            width: 70.w,
                                            padding: EdgeInsets.symmetric(horizontal: 5 ,vertical: 5),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: Color(context.greenColor),
                                                border: Border.all(color: Color(0xFFC8C8D3)),
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(5),
                                                    bottomRight: Radius.circular(5),
                                                    bottomLeft: Radius.circular(5))),
                                              child: imgeBulider(snapShot.data![index].imageUrl),
                                          );
                                        });

                            } else {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: Color(context.yellowColor),
                                ),
                              );
                            }
                          })
                  ),





                  SizedBox(
                    height: 10,
                  ),
                  row_main(text: "Last Product", rout: '/'),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 240.h, maxWidth: 200.w),

                        child: FutureBuilder<List<HomeLastItem>>(
                            future: CatogresApiController().homeLastItem(),
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
                                return GridView.builder(
                                      padding: EdgeInsets.symmetric(horizontal: 10 ,vertical: 2),

                                      scrollDirection: Axis.horizontal,
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 1,
                                          crossAxisSpacing: 10,
                                          mainAxisSpacing: 10,
                                          childAspectRatio: 290 / 200),
                                      itemCount: 5,
                                      itemBuilder: (context, index) {
                                        return card_item(
                                            text:  snapShot.data![index].nameEn,
                                            image: snapShot.data![index].imageUrl,
                                        );

                                      });
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: Color(context.yellowColor),
                                  ),
                                );
                              }
                            })
                      ),
                      const  SizedBox(
                    height: 20,
                  ),
                      const row_main(text: "Favorit", rout: '/Favorit'),
                      Padding(padding: EdgeInsets.symmetric(vertical: 10),
                          child: const list_last_seen()),
                      const SizedBox(height: 20,)
              ],
            ),
                )),
          ],
        ));

    //  ListView(
    // padding: EdgeInsets.symmetric(horizontal: 20 ,vertical: 10),
    // children: [
    // ConstrainedBox(
    // constraints: BoxConstraints(
    // minHeight: 200.h,
    // minWidth: 350.w,
    // maxHeight: 200.h,
    // maxWidth: 350.w,
    // ),
    // child: PageView.builder(
    // itemCount: 4,
    // controller: _pageController,
    // onPageChanged: (int pagIndex) {
    // setState(() => _currentIndex = pagIndex);
    // },
    // itemBuilder: (context, index) {
    // return Container(
    // padding: EdgeInsets.symmetric(horizontal: 10),
    // alignment: Alignment.center,
    // height: 180.h,
    // width: 350.w,
    // child: Image(
    // // image: AssetImage("images/${_image_pageview[index]}.png"),
    // image: AssetImage("images/${_image_pageview[index]}.png"),
    // ),
    // );
    // }),),
    // Row(mainAxisAlignment: MainAxisAlignment.center,
    // children: [
    // TabPageSelectorIndicator(backgroundColor: _currentIndex ==0 ? Color(context.greenColor) :Colors.black45,
    // borderColor: Color(context.greenColor), size: 8)
    // ,TabPageSelectorIndicator(backgroundColor: _currentIndex ==1 ? Color(context.greenColor) :Colors.black45,
    // borderColor: Color(context.greenColor), size: 8)
    // ,TabPageSelectorIndicator(backgroundColor: _currentIndex ==2 ? Color(context.greenColor) :Colors.black45,
    // borderColor: Color(context.greenColor), size: 8)
    // ,TabPageSelectorIndicator(backgroundColor: _currentIndex ==3 ? Color(context.greenColor) :Colors.black45,
    // borderColor: Color(context.greenColor), size: 8)
    //
    // ],),
    //
    // SizedBox(height: 20,),
    // row_main(text: "Catogres", rout: '/AllCatogres'),
    // ConstrainedBox(
    // constraints: BoxConstraints(minWidth: 320 ,minHeight: 90 ,maxWidth: 320 ,maxHeight: 90),
    // child:
    // GridView.builder(
    // scrollDirection: Axis.horizontal,
    // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    // crossAxisCount: 1,
    // crossAxisSpacing: 20,
    // mainAxisSpacing: 20,
    // childAspectRatio: 100 / 70),
    // itemCount: 6,
    // itemBuilder: (context, index) {
    // return Container(
    // height: 90.h,
    // width: 70.w,
    // alignment: Alignment.center,
    // decoration: BoxDecoration(
    // color: Color(context.greenColor),
    // border: Border.all(color: Color(0xFFC8C8D3)),
    // borderRadius: BorderRadius.only(
    // topLeft: Radius.circular(5),
    // bottomRight: Radius.circular(5),
    // bottomLeft: Radius.circular(5))),
    // child: Image(
    // height: 70.h,
    // width: 50.w,
    // image: AssetImage("images/${_image[index]}.png"),
    // ),
    // );
    // }),
    // ),
    //
    // SizedBox(height: 20,),
    // row_main(text: "Favorit", rout: '/Favorit'),
    // list_last_seen(),
    //
    // SizedBox(height: 20,),
    // row_main(text: "You Might Like", rout: '/Favorit'),
    // ConstrainedBox(
    // constraints: BoxConstraints(maxHeight: 188.h, maxWidth: 150.w),
    // child: GridView.builder(
    // padding: EdgeInsets.symmetric(horizontal: 20),
    // scrollDirection: Axis.horizontal,
    // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    // crossAxisCount: 1,
    // crossAxisSpacing: 15,
    // mainAxisSpacing: 15,
    // childAspectRatio: 188 / 150),
    // itemCount: 5,
    // itemBuilder: (context, index) {
    // return card_item(text: _title2[index], image: "images/${_paperImage[index]}.png");
    //
    // }),
    // ),
    //
    //
    //
    // ],)
    // );
  }
  Widget imgeBulider(String image) => CachedNetworkImage(
  imageUrl: image,
  imageBuilder: (context, imageProvider) => Container(
  decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  image: DecorationImage(
  image: imageProvider,
  ),
  ),
  ),
  fit: BoxFit.contain,
  placeholder: (context, url) => const Center(
  child: CircularProgressIndicator(
    backgroundColor: Colors.yellowAccent,
  valueColor: AlwaysStoppedAnimation(Colors.grey),
  )));
}

class list_last_seen extends StatelessWidget {
  const list_last_seen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 150, maxWidth: 200),
      child: GridView.builder(
          scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 90 / 220),
          itemCount: 7,
          itemBuilder: (context, index) {
            return Container(
              width: 200.w,
              height: 100.h,
              margin: EdgeInsets.only(left: 15),
              padding:EdgeInsets.all(2),
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 2),
                        color: Colors.black45,
                        blurRadius: 5)
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(90),
                    bottomLeft: Radius.circular(90),
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(20),

                  ),),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 60,
                        backgroundColor: Colors.white,
                        child: Image(image: AssetImage("images/paper.png"),)

                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        context.text(
                            text: "Meat Luncher",
                            size: 18,
                            color: (context.greenColor),
                            wieght: FontWeight.w400),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            context.text(
                                text: "Member me",
                                size: 14,
                                color: (context.blackColor),
                                wieght: FontWeight.w300),
                            Container(
                              height: 8,
                              width: 36.w,
                              child: RatingBar.builder(
                                initialRating: 2,
                                minRating: 1,
                                itemSize: 10.0,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 3,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 0.5),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            ),
                          ],
                        ),
                        context.text(
                            text: "Discount code 10\$",
                            size: 12,
                            color: (context.blackColor),
                            wieght: FontWeight.w600),
                        context.text(
                            text: "400 point",
                            size: 14,
                            color: (context.yellowColor),
                            wieght: FontWeight.w500),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class row_main extends StatelessWidget {
  final String rout;

  final String text;

  const row_main({
    Key? key,
    required this.text,
    required this.rout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        context.text(
            text: text,
            size: 16,
            color: context.blackColor,
            wieght: FontWeight.w400),
        Spacer(),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, rout);
          },
          child: context.text(
              text: "See All",
              size: 15,
              color: (context.greenColor),
              wieght: FontWeight.w300),
        ),
      ],
    );
  }

}

class contaner extends StatelessWidget {
  final String imageName;
  final int color;
  final String nameItem;

  const contaner(
      {Key? key,
      required this.imageName,
      required this.color,
      required this.nameItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Color(color),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10))),
          child: Image(
            image: AssetImage(imageName),
          ),
        ),
        Text(context.text(text: nameItem, size: 14, color: (0xFF272459)))
      ],
    );
  }


}
