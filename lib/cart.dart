import 'package:api_progect/controller/controller_helper.dart';
import 'package:api_progect/controller/db_cart_controller.dart';
import 'package:api_progect/order/add_order.dart';
import 'package:api_progect/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'controller/catodres_api_controller.dart';
import 'models/cart.dart';
import 'models/catogres_details.dart';

class Cart extends StatefulWidget {
  Cart({Key? key}) : super(key: key);



  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int value = 0;
  late String name;
  late int qantity = 0;
  late double price = 0.0;
  late double total = 0.0 ;
  int count = 0 ;
  List<CartModel> cart = <CartModel>[];
  void initState() {
    super.initState();
    Provider.of<CartProvider>(context, listen: false).read();
    // Provider.of<CartProvider>(context ,listen: false).totalPrice();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart"), actions: [
        IconButton(onPressed: (){
          Provider.of<CartProvider>(context ,listen: false).clear();
        }, icon: Icon(Icons.delete))
      ],),
      body: Consumer<CartProvider>(
        builder: (context, CartProvider value, child) {
          print("value.total");
         // count = value.cart[0].count;
          return Column(
            children: [
              Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.all(13),
                  itemCount:value.cart.length,
              itemBuilder: (context ,index){
                   if(value.cart.length == 0){
                  return   Center(child: context.text(
                         text: "Cart is Empty", size: 20,
                         color: context.blackColor));
                   }
                   else{
                return Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    padding: EdgeInsets.symmetric(vertical: 8 ,horizontal: 8),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 2),
                            color: Colors.black45,
                            blurRadius: 5)
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color(context.wihteColor),
                    ),

                    child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                      backgroundImage:NetworkImage(value.cart[index].image) ,
                      backgroundColor: Colors.white,
                      radius: 45,),
                      SizedBox(width: 10,),
                      Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                context.text(text: "${value.cart[index].productName}", size: 18, color: context.blackColor ),
                SizedBox(height : 7.h),
                context.text(text: "price : ${value.cart[index].price} \$", size: 15, color: context.yellowColor ,wieght: FontWeight.w400),
                SizedBox(height : 3.h),
                context.text(text: "count : ${count}", size: 15, color: context.greenColor  ,wieght: FontWeight.w500),
                        SizedBox(height : 3.h),
                        context.text(text: "${value.cart[index].date}", size: 12,
                            color: context.blackColor ,wieght: FontWeight.w200),

              ],),
                      Spacer(),
                      Column(
                        children: [
                        ElevatedButton(onPressed: (){
                        setState((){
                          count = count + 1;
                          print (count);
                        });
                      }, child: Icon(Icons.add , color:Colors.white ,) , style: ElevatedButton.styleFrom(
                        primary: Color(context.greenColor) ,minimumSize: Size(25.w , 22.h)
                      ),),
                        ElevatedButton(onPressed: (){
                          setState((){
                            if(count >= 0){
                              count = count -1;
                              print (count);
                            }
                          });

                        }, child: Icon(Icons.text_decrease_rounded , color:Colors.white ,) , style: ElevatedButton.styleFrom(
                            primary: Color(context.greenColor) ,minimumSize: Size(25.w , 22.h)
                        ),),
                      ],),
                      SizedBox(width: 15,)
               ],),
                  );}
              })),

              Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                context.text(text: "total price :", size: 16, color: context.greenColor),
                    SizedBox(width : 10.h),
                    context.text(text:"${value.cart.length==0  ?value.total :value.total}", size: 20, color: context.blackColor),

              ]),

              Row(children: [
                SizedBox(width : 10.h),
                Expanded(child:
                  ElevatedButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Order(),));

                }, child: Text("Mack Order") ,
                    style: ElevatedButton.styleFrom(
                    primary: Color(context.greenColor)
                  ),
                  ),
                ),
                SizedBox(width : 10.h),
                ElevatedButton(onPressed: (){
                  Provider.of<CartProvider>(context ,listen: false).clear();
                  value.cart.length = 0;
                }, child: Text("Clear") , style: ElevatedButton.styleFrom(
                    primary: Color(context.greenColor)
                ),),
                SizedBox(width : 10.h),

              ],),
              SizedBox(height : 10.h),

            ],
          );


  }),

    );
  }
  
  double allTotal(List total , BuildContext context){
    double total1 =   total.reduce((value, element) => value + element);
   print(total1);
    return total1;
  }
}

