import '../models/student.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum prefKey{login ,languges ,mobile ,name ,
  password , id ,loggedIn ,fullName ,gender ,token ,cityId}
class SharedPrefController{


  SharedPrefController._();

  late SharedPreferences _sharedPreferences;
  static SharedPrefController? _instance ;

  factory SharedPrefController() {
    return _instance ??= SharedPrefController._();
  }


  Future<void> inittalShared() async{
    _sharedPreferences =await SharedPreferences.getInstance();
  }


  void save({required User student})async{
  await  _sharedPreferences.setBool(prefKey.loggedIn.name, true);
  await  _sharedPreferences.setInt(prefKey.id.name ,student.id);
  await  _sharedPreferences.setString(prefKey.fullName.name ,student.name.toString());
  await  _sharedPreferences.setString(prefKey.mobile.name ,student.mobile.toString());
  await  _sharedPreferences.setString(prefKey.gender.name ,student.gender.toString());
  // await  _sharedPreferences.setInt(prefKey.cityId.name ,student.cityId.toString());
  await  _sharedPreferences.setString(prefKey.token.name ,'Bearer ${student.token}' );
  }

  Future<bool> changLanguges({required String langCode})async{
    return await _sharedPreferences.setString(prefKey.languges.name , langCode);
  }
  T? getValueForKey<T>( String key){
    if(_sharedPreferences.containsKey(key)){
      return _sharedPreferences.get(key) as T;
    }
    return null;
  }
void clear()async{
_sharedPreferences.clear();
}
}