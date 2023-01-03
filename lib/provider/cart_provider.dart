import 'package:flutter/material.dart';
import '../controller/db_cart_controller.dart';
import '../models/cart.dart';
import '../models/process_response.dart';

class CartProvider extends ChangeNotifier {

  List<CartModel> cart = <CartModel>[];

  final DbCartController _dbCartController = DbCartController();
  double total = 0;
  double quantity = 0;

  Future<ProcessResponse> creat(CartModel cartModel) async {

   int index = cart.indexWhere((element){
     print("id => ${element.productName}");
     print("cartid => ${cartModel.productName}");
     return element.productName == cartModel.productName;
   });
   print("data ${index}");
    if(index == -1){
      int newRow = await _dbCartController.creat(cartModel);
      if (newRow != 0) {
        total += cartModel.total;
        quantity += 1;
        cartModel.id = newRow;
        cart.add(cartModel);
        notifyListeners();
      }
      return getResponse(newRow != 0);
    } else{
       int newCount = cart[index].count++ ;
       return  changQuantitiy(index , newCount);
    }

  }
  void read() async {
    cart = await _dbCartController.read();
    notifyListeners();
  }
  Future<ProcessResponse> changQuantitiy(int index, int count) async {
    bool isDelete = count == 0;
    CartModel cartModel = cart[index];
    bool? result;
     result = (isDelete ?
     await _dbCartController.delete(cartModel.id)
    : await _dbCartController.update(cartModel)) as bool?;


    if(result!){
    if(isDelete){
    cart.remove(index);
    }else{
    cartModel.count = count;
    cart[index] = cartModel;
    }
    notifyListeners();

    }
return getResponse(result);
  }
  Future<ProcessResponse> clear()async{
    await _dbCartController.clear();
    total = 0;
    notifyListeners();
    print (getResponse);
    print ("sucsess12345");
    return getResponse(true);
  }

  ProcessResponse getResponse(bool succsess) {
    return ProcessResponse(
        massage: succsess ? "Opration Succsessful " : "Failed",
        succsess: !succsess);
  }
  // Future<double> totalPrice() async {
  //   double total =await _dbCartController.total();
  //  return total;
  //
  //
  // }

  Future<ProcessResponse> delete(int index)async{
    await _dbCartController.delete(index);
    notifyListeners();
    print (getResponse);
    print ("sucsess delete");
    return getResponse(true);
  }


}