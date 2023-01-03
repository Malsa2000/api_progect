class CartModel {


  static const  tableName = 'cart';
  late double total;
  late double price;
  late int count;
  late int id = -1;
  late String productName;
  late String date;
  late String image ;


  CartModel();

  //read Data From DataBase
  CartModel.fromMap(Map<String, dynamic> rowMap) {
    this.price = rowMap['price'];
    this.total = rowMap['total'];
    this.count = rowMap['count'];
    this.id = rowMap['id'];
    this.productName = rowMap['name'];
    this.date = rowMap['date'];
    this.image = rowMap['image'];


  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> rowMap = <String, dynamic>{};
    rowMap['price'] = this.price;
    rowMap['total'] = this.total;
    rowMap['count'] = this.count;
    rowMap['name'] =this.productName;
    rowMap['date'] =    this.date;
    rowMap['image'] = this.image;


    return rowMap;
  }
}
