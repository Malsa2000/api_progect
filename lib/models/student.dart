
import 'city.dart';

class User {
    late int id;
    late String name;
    String? email;
    late String mobile;
    late String gender;
    late bool active;
    late bool verified;
    late String cityId;
    late String storeId;
    String? fcmToken;
    late String token;
    late String tokenType;
    late String refreshToken;
    late String password;
    late City city;

// late City   city;
// late Store   store;

    User();

    User.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        name = json['name'];
        email = json['email'];
        mobile = json['mobile'];
        // password = json['password'];
        gender = json['gender'];
        active = json['active'];
        verified = json['verified'];
        cityId = json['city_id'];
        storeId = json['store_id'];
        fcmToken = json['fcm_token'];
        token = json['token'];
        tokenType = json['token_type'];
        refreshToken = json['refresh_token'];
        city = City.fromJson(json['city']);

        // city = json['city'] = null    new City.fromJson(json['city']) : null;
        // store = json['store'] != null    new Store.fromJson(json['store']) : null;
    }
}