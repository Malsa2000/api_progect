import 'dart:convert';
import 'dart:io';
import 'package:api_progect/models/city.dart';
import 'package:api_progect/controller/shared_pref_controlledr.dart';
import 'package:api_progect/models/sub_catogres.dart';
import '../apiSetting/api_setting.dart';
import '../models/categories.dart';
import 'package:http/http.dart' as http;
import '../models/catogres_details.dart';
import '../models/home_last_item.dart';




class CatogresApiController{
  static  String token = SharedPrefController().getValueForKey<String>(prefKey.token.name)!;

  static Map<String, String> getTokenHeaders() {
    Map<String, String> headers = new Map();
    headers['Authorization'] = token;
    headers['content-type'] = 'application/json';
    return headers;
  }


  Future<List<Categories>> getCatogtrs() async{
  Uri uri = Uri.parse(ApiSetting.catogres);
  var response =await http.get(uri , headers: {
   HttpHeaders.authorizationHeader :token,
    HttpHeaders.acceptHeader: 'application/json',
  }
  );
  print("Response code malsa ${response.statusCode}");
  if(response.statusCode == 200 ){
  var jason = jsonDecode(response.body);
  var dataJeson = jason['list'] as List;
  print(jason['message']);
  return dataJeson.map((dataJeson) => Categories.fromJson(dataJeson)).toList();

  }
  return [];
  }


  Future<List<subCatogres>> getSubCatogres(int id) async{
    Uri uri = Uri.parse("${ApiSetting.catogres}/$id");
    var response =await http.get(uri , headers: {
      HttpHeaders.authorizationHeader :token,
      HttpHeaders.acceptHeader: 'application/json',
    }
    );
    print("Response code malsa ${response.statusCode}");
    if(response.statusCode == 200 ){
      var jason = jsonDecode(response.body);
      var dataJeson = jason['list'] as List;
      print(jason['message']);
      return dataJeson.map((dataJeson) => subCatogres.fromJson(dataJeson)).toList();

    }
    return [];
  }

  Future<List<CatogresDetalis>> getCatoresDetails(int id) async{
    Uri uri = Uri.parse("${ApiSetting.detailsSubCatogres}/$id");
    var response =await http.get(uri , headers: {
      HttpHeaders.authorizationHeader :token,
      HttpHeaders.acceptHeader: 'application/json',
    }
    );
    print("Response code malsa ${response.statusCode}");
    if(response.statusCode == 200 ){
      var jason = jsonDecode(response.body);
      var dataJeson = jason['list'] as List;
      print(jason['message']);
      return dataJeson.map((dataJeson) => CatogresDetalis.fromJson(dataJeson)).toList();
    }
    return [];
  }

  Future<List<HomeLastItem>> homeLastItem() async{
    Uri uri = Uri.parse("${ApiSetting.homeLast}");
    var response =await http.get(uri , headers: {
      HttpHeaders.authorizationHeader :token,
      HttpHeaders.acceptHeader: 'application/json',});
    print("Response code malsa ${response.statusCode}");
    if(response.statusCode == 200 ){
      var jason = jsonDecode(response.body);
      var dataJeson = jason['data']['latest_products'] as List;
      print(jason['message']);
      return dataJeson.map((dataJeson) => HomeLastItem.fromJson(dataJeson)).toList();
    }
    return [];
  }


  Future cart(int id) async{
    Uri uri = Uri.parse("${ApiSetting.detailsSubCatogres}/$id");
    var response =await http.get(uri , headers: {
      HttpHeaders.authorizationHeader :token,
      HttpHeaders.acceptHeader: 'application/json',});
    print("Response code malsa ${response.statusCode}");
    if(response.statusCode == 200 ){
      var jason = jsonDecode(response.body);
      var dataJeson = jason['data'];
      print(jason['message']);
      return dataJeson.map((dataJeson) => CatogresDetalis.fromJson(dataJeson));
    }
    return [];
  }


  Future<List<City>> getCity() async{
    Uri uri = Uri.parse(ApiSetting.cities);
    var response =await http.get(uri ,
        headers: {HttpHeaders.acceptHeader: 'application/json',
    }


    );
    if(response.statusCode == 200 ){
      print(response.statusCode);
      var jason = jsonDecode(response.body);
      var dataJeson = jason['list'] as List;
      print(jason['message']);
    return dataJeson.map((dataJeson) => City.fromJson(dataJeson)).toList();
    }
    return [];
  }
  }
