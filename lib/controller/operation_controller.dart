import 'package:sqflite/sqflite.dart';

import 'db_controller.dart';

abstract class OperationController<Model> {

  final Database database  =DbController().database;

  Future<int> creat(Model model);
  Future<bool> update(Model model);
  Future<int> delete(int index);
  Future<List<Model>> read();
  Future<Model?>show(int id);

 }