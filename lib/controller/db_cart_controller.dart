
import '../models/cart.dart';
import 'operation_controller.dart';

class DbCartController extends OperationController<CartModel>{

  @override
  Future<int> creat(CartModel model) async{
 int row =  await database.insert(CartModel.tableName, model.toMap() );
    return row;
  }

  @override
  Future<int> delete(int index)async {
       int rowDelet = await database.delete(CartModel.tableName , where: 'id =?' ,whereArgs: [index]);
       return rowDelet;
  }

  @override
  Future<List<CartModel>> read() async{
    List<Map<String ,dynamic>> rowMap =  await database.query(CartModel.tableName);
         return rowMap.map((rowMap) => CartModel.fromMap(rowMap)).toList();
  }

  @override
  Future<CartModel?> show(int id) {
    // TODO: implement show
    // TODO: implement show
    throw UnimplementedError();
  }

  @override
  Future<bool> update(CartModel model) async {
   int rowMap = await database.update(CartModel.tableName, model.toMap()
       ,where: 'id =? ' ,whereArgs: [model.id]);
   return rowMap ==1;
  }

  Future<void> clear ()async{
    await database.delete(CartModel.tableName);
  }
 }