import 'package:api_progect/controller/controller_helper.dart';
import 'package:api_progect/models/cart.dart';
import 'package:api_progect/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../Widget/cart_item.dart';
import 'package:http/http.dart' as http;

import 'cart.dart';
import 'controller/catodres_api_controller.dart';
import 'models/catogres_details.dart';

class Item extends StatefulWidget {
  Item({Key? key, required this.id}) : super(key: key);
  int id;

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  int _index = 0;
  int _number = 1;
  double _rate_vlaue = 0;


  late String name;
  late String qantity;
  late  String price;
  late  String image;

  void initState() {
    super.initState();
    Provider.of<CartProvider>(context, listen: false).read();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(context.wihteColor),
        title: context.text(
            text: "Product Details", size: 18, color: context.blackColor),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(context.greenColor),
          onPressed: () {
           Navigator.pushNamed(context, '/cart');
          },
          child: Icon(Icons.shopping_cart)),

      body: FutureBuilder<List<CatogresDetalis>>(
          future: CatogresApiController().getCatoresDetails(widget.id),
          builder: (context, AsyncSnapshot snapShot) {
            if (snapShot.hasError) {
              return Center(child: Text("No Data"));
            }

            if (snapShot.hasData) {
              return ListView.builder(
                  itemCount: snapShot.data!.length,
                  itemBuilder: (context, index) {
                    name =  snapShot.data![index].nameEn;
                    price =  snapShot.data![index].price;
                    print( snapShot.data![index].price);
                    qantity =  snapShot.data![index].quantity;
                    image =   snapShot.data![index].imageUrl;
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/Favorit');
                                },
                                icon: Icon(Icons.favorite,
                                    size: 24,
                                    color: Color(
                                      context.greenColor,
                                    ))),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                          height: 210.h,
                          decoration: BoxDecoration(
                            color: Color(context.wihteColor),
                            borderRadius: BorderRadius.circular(20.r),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 2),
                                  color: Colors.black45,
                                  blurRadius: 5)
                            ],
                          ),
                          child: Image(
                            alignment: Alignment.center,
                            image: NetworkImage(snapShot.data![index].imageUrl),
                            height: 210.h,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          height: 100.h,
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            color: Color(context.wihteColor),
                            borderRadius: BorderRadius.circular(20.r),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 2),
                                  color: Colors.black45,
                                  blurRadius: 5)
                            ],
                          ),
                          child: Row(
                            children: [
                              context.text(
                                  text: name,
                                  size: 18,
                                  color: context.greenColor,
                                  wieght: FontWeight.w500),
                              Spacer(),
                              context.text(
                                  text: "${snapShot.data![index].price} \$",
                                  size: 15,
                                  color: context.blackColor,
                                  wieght: FontWeight.w300),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          height: 100.h,
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(context.wihteColor),
                            borderRadius: BorderRadius.circular(20.r),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 2),
                                  color: Colors.black45,
                                  blurRadius: 5)
                            ],
                          ),
                          child: context.text(
                              text: snapShot.data![index].infoEn,
                              size: 15,
                              color: context.blackColor,
                              wieght: FontWeight.w300),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            height: 100.h,
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color(context.wihteColor),
                              borderRadius: BorderRadius.circular(20.r),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 2),
                                    color: Colors.black45,
                                    blurRadius: 5)
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                context.text(
                                    text: "Rate product :",
                                    size: 14,
                                    color: context.blackColor,
                                    wieght: FontWeight.w300),
                                Row(children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 5),
                                    height: 20,
                                    child: RatingBar.builder(
                                      initialRating: 2,
                                      minRating: 1,
                                      itemSize: 20.0,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 0.1),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (double rating) {
                                        setState(() => _rate_vlaue = rating);
                                      },
                                    ),
                                  ),
                                  Spacer(),
                                  context.text(
                                      text: _rate_vlaue.toString(),
                                      size: 16,
                                      color: context.blackColor,
                                      wieght: FontWeight.w500),
                                ]),
                              ],
                            )),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          height: 130.h,
                          decoration: BoxDecoration(
                            color: Color(context.wihteColor),
                            borderRadius: BorderRadius.circular(20.r),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 2),
                                  color: Colors.black45,
                                  blurRadius: 5)
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              context.text(
                                  text: "Chooes Weight",
                                  size: 14,
                                  color: context.blackColor,
                                  wieght: FontWeight.w300),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      _index = 0;
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: _index == 0
                                            ? Color(0xFF00AD8F)
                                            : Color(0xFFF8F9FA),
                                        minimumSize: Size(80.w, 50.h)),
                                    child: context.text(
                                        text: snapShot.data![index].quantity,
                                        size: 15,
                                        color: context.blackColor,
                                        wieght: FontWeight.w500),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      _index = 1;
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: _index == 1
                                            ? Color(0xFF00AD8F)
                                            : Color(0xFFF8F9FA),
                                        minimumSize: Size(80.w, 50.h)),
                                    child: context.text(
                                        text: "19K",
                                        size: 15,
                                        color: context.blackColor,
                                        wieght: FontWeight.w500),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      _index = 2;
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: _index == 2
                                            ? Color(0xFF00AD8F)
                                            : Color(0xFFF8F9FA),
                                        minimumSize: Size(80.w, 50.h)),
                                    child: context.text(
                                        text: "30K",
                                        size: 15,
                                        color: context.blackColor,
                                        wieght: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          height: 130.h,
                          decoration: BoxDecoration(
                            color: Color(context.wihteColor),
                            borderRadius: BorderRadius.circular(20.r),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 2),
                                  color: Colors.black45,
                                  blurRadius: 5)
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              context.text(
                                  text: "Chooes Quantity",
                                  size: 14,
                                  color: context.blackColor,
                                  wieght: FontWeight.w300),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() => _number++);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: Color(context.greenColor),
                                        minimumSize: Size(100.w, 50.h)),
                                    child: context.text(
                                        text: "+",
                                        size: 14,
                                        color: context.blackColor,
                                        wieght: FontWeight.w700),
                                  ),
                                  context.text(
                                      text: _number.toString(),
                                      size: 14,
                                      color: context.blackColor,
                                      wieght: FontWeight.w700),
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() => _number--);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: Color(context.greenColor),
                                        minimumSize: Size(100.w, 50.h)),
                                    child: context.text(
                                        text: "-",
                                        size: 14,
                                        color: context.blackColor,
                                        wieght: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Consumer<CartProvider>(
                            builder: (context, CartProvider value, child) {
                              return ElevatedButton(onPressed: () {

                                Provider.of<CartProvider>(context, listen: false)
                                    .creat(getCart());
                                context.snackBar(massage: "add Item to cart");
                              }, child: context.text(text: "add to Cart", size: 18, color: context.wihteColor)
                                , style: ElevatedButton.styleFrom(
                                    primary: Color(context.greenColor) ,minimumSize: Size(320.w, 40.h)
                                ),);
                            }),

                        SizedBox(height: 20,),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.symmetric(
                              horizontal: 5, vertical: 10),
                          child: context.text(
                              text: "See More item",
                              size: 16,
                              color: context.blackColor,
                              wieght: FontWeight.w400),
                        ),
                        ConstrainedBox(
                            constraints:
                                BoxConstraints(maxHeight: 165, maxWidth: 300),
                            child: GridView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                      childAspectRatio: 120 / 100,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10),
                              itemBuilder: (BuildContext context, int index) {
                                return card_item(
                                    text: "fish", image: "${image}");
                              },
                            )),
                      ],
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );

            }
          }),
    );
  }

  CartModel getCart() {
    int count = 1 ;

    CartModel cartModel = CartModel();
    cartModel.productName = name;
    cartModel.price = double.parse(price);
    cartModel.total  =  (double.parse(price) * _number);
    cartModel.count  = _number == 0?  _number =1 : _number;
    cartModel.date = "$getDate";
    cartModel.image = "$image";

    //count = 1;
    return cartModel;
  }
String  get getDate{
  var date = new DateTime.now().toString();
  return date;
}
}
