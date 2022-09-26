import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kanoon_dadgostari/models/lawyer/info_profile_model.dart';

import '../models/entity/infoProfileEntity.dart';
import '../utilites/app_logger.dart';

class LocalStorageService extends GetxService {
  static final _box = GetStorage();

  static const String firebaseKey = "FirebaseKey";
  static const String phoneNumberKey = "phoneNumberKey";
  static const String userKey = "UserKey";
  static const String profileKey = "ProfileKey";
  static const String cardsKey = "CardsKey";
  static const String lawyerKey = "LawyerKey";
  static const String homeKey = "homeKey";
  static const String isFirstTimeLaunchKey = "IsFirstTimeLaunch";
  static const String tenantKey = "TokenKey";
  static const String tokenKey = "TokenKey";
  static const String defaultTokenValue = "";
  static const String refreshTokenKey = "refreshTokenKey";
  static const String refreshTokenExpiryTimeKey = "refreshTokenExpiryTimeKey";
  static const String isPersianModeKey = "isPersianModeKey";
  static const String isDarkKey = "isDarkKey";
  static const String languageKey = "languageKey";

  static const String recentSearchKey = "recentSearchKey";
  static const String basketItemsKey = "BasketItemsKey";
  static const String bookmarksKey = "BookmarksKey";
  static const String categoriesKey = "categoriesKey";

  String get token {
    String a = _box.read(tokenKey) ?? defaultTokenValue;

    return a;
  }

  set token(String token) {
    // final APIProvider _api = Get.find();
    _box.write(tokenKey, token);
    // _api.updateHeaders();
  }

  String get refreshToken => _box.read(refreshTokenKey) ?? "";

  set refreshToken(String refreshToken) =>
      _box.write(refreshTokenKey, refreshToken);

  String get refreshTokenExpiryTime =>
      _box.read(refreshTokenExpiryTimeKey) ?? "";

  set refreshTokenExpiryTime(String refreshTokenExpiryTime) =>
      _box.write(refreshTokenExpiryTimeKey, refreshTokenExpiryTime);

  bool get isFirstTimeLaunch => _box.read(isFirstTimeLaunchKey) ?? true;

  set isFirstTimeLaunch(bool value) => _box.write(isFirstTimeLaunchKey, value);

  bool get isPersianMode => _box.read(isPersianModeKey) ?? false;

  set isPersianMode(bool value) => _box.write(isPersianModeKey, value);

  bool get isDark => _box.read(isDarkKey) ?? true;

  set isDark(bool value) => _box.write(isDarkKey, value);

  String get language =>
      _box.read<String>(languageKey) ?? Get.deviceLocale?.languageCode ?? "";

  set language(String key) => _box.write(languageKey, key);

  String get firebaseToken => _box.read<String>(firebaseKey) ?? "";

  set firebaseToken(String key) => _box.write(firebaseKey, key);

  String get phoneNumber => _box.read<String>(phoneNumberKey) ?? "";

  set phoneNumber(String key) => _box.write(phoneNumberKey, key);

  //
  set user(User user) {
    try {
      _box.write(userKey, user);
    } catch (e) {
      AppLogger.e('$e');
    }
  }

  User get user {
    var userJson = _box.read(userKey);
    if (userJson == null) {
      return User();
    }
    User userModel = User.fromJson(json.decode(userJson));
    return userModel;
  }

  Profile get profile {
    var userJson = _box.read(profileKey);
    if (userJson == null) {
      return Profile();
    }
    Profile profileModel = Profile.fromJson(json.decode(userJson));
    return profileModel;
  }

  // CardsItem get cards {
  //   var userJson = _box.read(cardsKey);
  //   if (userJson == null) {
  //     return CardsItem();
  //   }
  //   CardsItem cardsModel = CardsItem.fromJson(json.decode(userJson));
  //   return cardsModel;
  // }

  List<CardsItem> get cards {
    List<dynamic>? items = _box.read(cardsKey);
    if (items == null) {
      return [];
    }
    return List.from(items.map((e) => e));
  }

  //***********************************

  // set lawyer(Map<String, dynamic> lawyer) {
  //   try {
  //     _box.write(lawyerKey, lawyer);
  //   } catch (e) {
  //     AppLogger.e('$e');
  //   }
  // }
  LawyerData get lawyer {
    var userJson = _box.read(lawyerKey);
    if (userJson == null) {
      return LawyerData(
          user: user, profile: profile, cards: cards);
    }
    LawyerData lawyerData =
    LawyerData.fromJson(json.decode(userJson));
    return lawyerData;
  }

  setCard(Map<String, dynamic> _json) async {
    try {
      await _box.write(cardsKey, json.encode(_json));
    } catch (e) {
      debugPrint("$e");
    }
  }

  setLawyer(Map<String, dynamic> _json) async {
    try {
      await _box.write(lawyerKey, json.encode(_json));
    } catch (e) {
      debugPrint("$e");
    }
  }

  //***********************************

  bool isLogin() {
    if (token != LocalStorageService.defaultTokenValue) {
      return true;
    }
    return false;
  }

  setUser(Map<String, dynamic> _json) async {
    try {
      await _box.write(userKey, json.encode(_json));
    } catch (e) {
      debugPrint("$e");
    }
  }

  // List<CategoryModel> get categories {
  //   var json = _box.read(categoriesKey);
  //   if (json == null) {
  //     return [];
  //   }
  //   List<CategoryModel> items = CategoryModel.fromJsonList(json as List);
  //   return items;
  // }

  setCategories(List json) {
    _box.write(categoriesKey, json);
  }

  List<String> get recentSearch {
    List<dynamic>? items = _box.read(recentSearchKey);
    if (items == null) {
      return [];
    }
    return List.from(items.map((e) => e));
  }

  setRecentSearch(List<String> items) {
    _box.write(recentSearchKey, items);
  }

  //*********************

  // List<List<ProductSectionModel>> get getHome {
  //   var json = _box.read(homeKey);
  //
  //   List data = json as List; //List<List<dynamic>>
  //
  //   List<List<ProductSectionModel>> _out = [];
  //
  //   for (int i = 0; i < data.length; i++) {
  //     try {
  //       List<ProductSectionModel> result =
  //           ProductSectionModel.fromJsonList(data[i] as List);
  //       _out.add(result);
  //     } catch (e) {
  //       AppLogger.e('$e');
  //     }
  //   }
  //
  //   return _out;
  // }

  setHome(List json) {
    _box.write(homeKey, json);
  }

  Future clearPref() async {
    var a = _box.erase();

    // var b = _box.remove(UserKey);
    var futures = <Future>[a];
    await Future.wait(futures);
  }

  Future logOut() async {
    //todo final this func
    // var a = _box.remove(firebaseKey);
    // var b = _box.remove(userKey);
    // var b = _box.remove(tokenKey);
    // var c = _box.remove(refreshTokenKey);
    // var d = _box.remove(refreshTokenExpiryTimeKey);
    // var e = _box.remove(recentSearchKey);
    // var futures = <Future>[a, b, c, d, e];
    // await Future.wait(futures);

    // user = User();
    token = defaultTokenValue;
    _box.remove(userKey);
    _box.remove(lawyerKey);
    isFirstTimeLaunch = !isFirstTimeLaunch;
  }

  Map<String, String> get headers {
    Map<String, String> headers = {
      'apiLevel': "1",
      //todo amin alizadeh
      'appVersion': "1.0.0",
      //todo amin alizadeh
      'platform': "1.0.0",
      //todo amin alizadeh
      'tenant': 'root',
      'Authorization':
          // token = 'Bearer 24|gP8MOKb7zAVMBqWeqf1akr2md20mIdP1l5Uum88I'
          // 24|gP8MOKb7zAVMBqWeqf1akr2md20mIdP1l5Uum88I
          token == defaultTokenValue ? defaultTokenValue : 'Bearer $token'
      // defaultTokenValue ? defaultTokenValue :
      // 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjY4YTVjODhlLTY3OTEtNGVjNy05MDI3LTFiYzk3M2UwOTM0NiIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL21vYmlsZXBob25lIjoiMDkwMzI5OTIwNjkiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvc3VybmFtZSI6IiIsImlwQWRkcmVzcyI6IjUuMTI2LjIzNy4yMTMiLCJ0ZW5hbnQiOiJyb290IiwiaW1hZ2VfdXJsIjoiIiwiZXhwIjoxNjUxNjU5OTE5fQ.SKhNKBbd1Sb9f83RT5E7-FOczNBdZrb1mA2Ikv9oiYg',//todo
      // 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjYzMjQ4YjYyLWQzNGItNGUxYy04YzQzLWVlOTE4YzVkNzliYyIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL2VtYWlsYWRkcmVzcyI6ImFkbWluQHJvb3QuY29tIiwiZnVsbE5hbWUiOiJyb290IEFkbWluIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6InJvb3QiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9zdXJuYW1lIjoiQWRtaW4iLCJpcEFkZHJlc3MiOiIxNzguMTc1LjEzNC4xMjQiLCJ0ZW5hbnQiOiJyb290IiwiaW1hZ2VfdXJsIjoiIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbW9iaWxlcGhvbmUiOiIiLCJleHAiOjE2NDk1MDAxODl9.Ba9fgVN85FNhr09MG0sHOYaqne5L9qU-ISmET-Wsb8g' //todo
    };

    return headers;
  }
}
