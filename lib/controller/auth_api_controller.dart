import 'dart:convert';
import 'dart:io';
import 'package:api_progect/models/process_response.dart';
import 'package:api_progect/controller/shared_pref_controlledr.dart';
import 'package:http/http.dart' as http;
import '../apiSetting/api_setting.dart';
import '../models/student.dart';


class AuthApiController {

  Future<ProcessResponse> singUp(User user) async {
    Uri uri = Uri.parse(ApiSetting.register);
    var response = await http.post(uri, body:
         {
           'name': user.name,
        'mobile': user.mobile,
        'password': user.password,
        'gender': user.gender,
        'city_id': user.cityId,
        'STORE_API_KEY':
        ApiSetting.storeApiKey,
    }
       );
    if (response.statusCode == 201 || response.statusCode == 400) {
      var jeson = jsonDecode(response.body);
      return ProcessResponse(
          massage: jeson["message"], succsess: jeson["status"]);
    }
    return ProcessResponse(massage: "error", succsess: false);
  }


  void _setHeaders() =>{
    'Content-Type' : 'application/x-www-form-urlencoded',
    'Accept':'*/*'
  };


  Future<ProcessResponse> login(
      {required String mobile, required String password}) async {
    Uri uri = Uri.parse(ApiSetting.login);


    var response = await http.post(
        uri, body: {'mobile': mobile, 'password': password});

    if (response.statusCode == 200 || response.statusCode == 400) {
      print(response.statusCode);
      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        User user = User.fromJson(json['data']);
        SharedPrefController().save(student: user);
        print(response.statusCode);
      }
      return ProcessResponse(
          massage: json['message'], succsess: json['status']);
    }
    return ProcessResponse(massage: "error", succsess: false);
  }






  Future<ProcessResponse> regester({
    required String mobile,
    required String password ,
    required String name,
    required String gender,
    required int city}) async {
    Uri uri = Uri.parse(ApiSetting.register);
    var response = await http.post(uri, body: {
      'name': name,
      'mobile':mobile,
      'password': password,
      'gender': gender,
      'city_id': city,
      'STORE_API_KEY':
      ApiSetting.storeApiKey,

    }

    );

    if (response.statusCode == 201 || response.statusCode == 400) {
      var jeson = jsonDecode(response.body);
      return ProcessResponse(
          massage: jeson["message"], succsess: jeson["status"]);
    }
    return ProcessResponse(massage: "error", succsess: false);
  }

  Future<ProcessResponse> loggOut() async {
    String token = SharedPrefController().getValueForKey<String>(
        prefKey.token.name)!;
    Uri uri = Uri.parse(ApiSetting.logout);
    var response = await http.get(
        uri, headers: {HttpHeaders.authorizationHeader: token,
      HttpHeaders.acceptHeader: 'application/json'});

    if (response.statusCode == 200 || response.statusCode == 401) {
      SharedPrefController().clear();
      return ProcessResponse(massage: "logged Succsefly", succsess: true);
    }
    return ProcessResponse(massage: "error", succsess: false);
  }

}