import 'package:api_progect/controller/controller_helper.dart';
import 'package:api_progect/order/order_det.dart';
import 'package:api_progect/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}



class _OrderState extends State<Order> {





  void initState() {
    super.initState();
    Provider.of<CartProvider>(context, listen: false).read();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar :AppBar(
        title :Text("Order"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.phone_android),)
        ],
      ),
      body: Consumer<CartProvider>(
            builder: (context, CartProvider value, child) {
              return ListView.builder(
                itemCount: value.cart.length,
                    itemBuilder: (context , index){
                   return InkWell(

                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => OrderDetiles(
                        orderName: "#${value.cart[index].id}",
                        orderNumber:"#order${value.cart[index].id}",
                        date: getDate,
                        allItem: value.cart[index].productName)
                  ));
                },
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),

                    decoration: BoxDecoration(
                      color: Color(context.wihteColor),
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 2),
                            color: Colors.black45,
                            blurRadius: 5)
                      ],),
                    child: Column(
                      children: [
                        Row(children: [
                          Icon(Icons.emoji_food_beverage_sharp,
                            color: Color(context
                                .greenColor),),
                          context.text(text: "Food door",
                              size: 12,
                              color: context.greenColor)
                        ],),
                        Divider(height: 1,
                          color: Color(context.greyColor),
                          thickness: 2,),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            context.text(text: "Order: #order${value.cart[index].id}",
                                size: 14,
                                color: context.blackColor,
                                wieght: FontWeight.w400),
                            Spacer(),
                            context.text(text:"$getDate",
                                size: 14,
                                color: context.blackColor,
                                wieght: FontWeight.w200),


                          ],),
                        SizedBox(height: 10,),
                        Row(children: [
                          context.text(text: "State",
                              size: 12,
                              color: context.blackColor,
                              wieght: FontWeight.w400),
                          context.text(text: "Waite",
                              size: 14,
                              color: context.greenColor,
                              wieght: FontWeight.w200)
                        ],),
                        SizedBox(height: 10,),
                        Row(children: [
                          context.text(text: "${value.cart[index].productName}",
                              size: 14,
                              color: context.blackColor,
                              wieght: FontWeight.w400),
                        ],),
                        SizedBox(height: 10,),
                        Row(children: [
                          context.text(text: "payment Type",
                              size: 14,
                              color: context.blackColor,
                              wieght: FontWeight.w400),
                          context.text(text: "Bank",
                              size: 14,
                              color: context.greenColor,
                              wieght: FontWeight.w300),
                        ],),

                        Divider(height: 1,
                          color: Color(context.greyColor),
                          thickness: 2,),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: Row(
                              children: [
                                context.text(
                                    text: "total", size: 16, color: context
                                    .blackColor, wieght: FontWeight.w400),
                                Spacer(),
                                context.text(text: "${value.total}",
                                    size: 16,
                                    color: context.greenColor,
                                    wieght: FontWeight.w600),
                              ]
                          ),
                        )

                      ],
                    )),
              );

                    }
                );
            })
    );

  }
 String  get getDate{
   var date = new DateTime.now().toString();
   return date;
 }
}

