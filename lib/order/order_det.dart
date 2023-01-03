import 'package:api_progect/controller/controller_helper.dart';
import 'package:api_progect/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../widget/contaner_white.dart';

class OrderDetiles extends StatefulWidget {

  late String orderNumber , orderName;
  late String date , allItem;

   OrderDetiles({Key? key ,required this.orderName ,required this.orderNumber
    ,required this.date ,required this.allItem}) : super(key: key);

  @override
  State<OrderDetiles> createState() => _OrderDetilesState();
}

class _OrderDetilesState extends State<OrderDetiles> {

  @override
  void initState() {
    super.initState();
    Provider.of<CartProvider>(context, listen: false).read();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(context.wihteColor),
      appBar: AppBar(
      ),
      body: ListView(
        children: [
        Container(
          padding: EdgeInsets.only(left: 10 ,bottom: 20),
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 2),
                color: Colors.black45,
                blurRadius: 5)
          ],
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)),
            color: Color(context.greenColor),

        ),
         child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              context.text(
                  text: "Order Detiles",
                  size: 30,
                  color: context.wihteColor,
                  wieght: FontWeight.w400),
              context.text(
                  text: "FoodDooR",
                  size: 28,
                  color: context.yellowColor,
                  wieght: FontWeight.w400),


            ],),),

          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
               mainAxisSize: MainAxisSize.max,
               children: [
                 SizedBox(height: 30,),
                 Row(children: [
                   Icon(Icons.check ,color:Color( context.greenColor),size: 16,),
                   context.text(text: "Order Number :", size: 20, color: context.greenColor ,wieght: FontWeight.w500)
                   ,SizedBox(width: 10,),
                   context.text(text: "${widget.orderNumber}", size: 16, color: context.blackColor ,wieght: FontWeight.w400)
                 ],),
                 SizedBox(height: 13),
                 Row(children: [
                   Icon(Icons.check ,color:Color( context.greenColor),size: 16,),
                   context.text(text: "Oreder Name :", size: 20, color: context.greenColor ,wieght: FontWeight.w500)
                   ,SizedBox(width: 10,),
                   context.text(text: "${widget.orderName}", size: 16, color: context.blackColor ,wieght: FontWeight.w400)
                 ],),
                 SizedBox(height: 13,),
                 Row(children: [
                   Icon(Icons.check ,color:Color( context.greenColor),size: 16,),
                   context.text(text: "Oreder Date :", size: 20, color: context.greenColor ,wieght: FontWeight.w500)
                   ,SizedBox(width: 2,),
                   context.text(text:  "${widget.date}", size: 16, color: context.blackColor ,wieght: FontWeight.w400)
                 ],),
                 SizedBox(height: 13,),

                 Row(children: [
                   Icon(Icons.check ,color:Color( context.greenColor),size: 16,),
                   context.text(text: "State :", size: 20, color: context.greenColor ,wieght: FontWeight.w400),
                   SizedBox(width: 10,),
                   context.text(text: "Waite", size: 16, color: context.yellowColor ,wieght: FontWeight.w400)
                 ],),
                 SizedBox(height: 13,),
                 Row(children: [
                   Icon(Icons.check ,color:Color( context.greenColor),size: 16,),
                   context.text(text: "Orders Producs :", size: 20, color: context.greenColor ,wieght: FontWeight.w500),
                 ],),
                 SizedBox(height: 13,),
                 Container(
                   height: 200.h,
                   margin: EdgeInsets.symmetric(horizontal: 20),
                   padding: EdgeInsets.only(left: 20),
                   child: Consumer<CartProvider>(

            builder: (context, CartProvider value, child) {
              return ListView.builder(
                  itemCount: value.cart.length,
                 itemBuilder: (context ,index){
             return Padding(
               padding: EdgeInsets.all(5),
               child: Row(
           children: [
               Icon(Icons.circle ,color:Color( context.greenColor),size: 12,),
               context.text(text: value.cart[index].productName, size: 17, color: context.blackColor
                ,wieght: FontWeight.w300)
                ,SizedBox(width: 10,),
               context.text(text: "${value.cart[index].count} KG",
                size: 16, color: context.greenColor ,wieght: FontWeight.w400)

        ],),
             );
      });
    }
                   )),
               ],
             ),
          ) ,

        ],
      ),
    );
  }
}

