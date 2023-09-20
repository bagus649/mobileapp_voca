// ignore_for_file: prefer_const_declarations, unused_field

import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService extends GetxService {
  static late SharedPreferences _preferences;

  static final _keyToken = 'token';
  static final _keyProfileMe = 'profileMe';
  static final _keyOnboarding = 'onBoarding';
  static final _keylistGameAccount = 'gameAccount';
  static final _keyFCMToken = 'FCMToken';
  static final _keyIsDark = 'isDark';
  static final _keyTitle = 'title';
  static final _keySubTitle = 'subtitle';
  static final _keyFooter = 'footer';

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
    return _preferences;
  }

  static Future clear() async {
    _preferences.remove(_keyToken);
    _preferences.remove(_keyOnboarding);
    _preferences.remove(_keyProfileMe);
    _preferences.remove(_keyFCMToken);
    _preferences.remove(_keyIsDark);
  }

  static Future setToken(String token) async {
    await _preferences.setString(_keyToken, token);
  }

  static String? getToken() {
    final data = _preferences.getString(_keyToken);

    if (data != null) return data;
    return null;
  }

  static Future setIsOpenedOnboarding(bool token) async {
    await _preferences.setBool(_keyOnboarding, token);
  }

  static bool? getIsOpenedOnboarding() {
    final data = _preferences.getBool(_keyOnboarding);

    if (data != null) return data;
    return null;
  }

  static Future setProfileMe(Map data) async {
    String dataEncode = jsonEncode(data);
    await _preferences.setString(_keyProfileMe, dataEncode);
  }

  // static ProfileMe? getProfileMe() {
  //   final data = _preferences.getString(_keyProfileMe);
  //   if (data != null) return ProfileMe.fromJson(jsonDecode(data));
  //   return null;
  // }

  // static Future setListGameAccount(List<String> data) async {
  //   await _preferences.setStringList(_keylistGameAccount, data);
  // }

  // static List<GameAccount>? getListGameAccount() {
  //   List<GameAccount> dataListGame = [];
  //   var data = _preferences.getStringList(_keylistGameAccount);
  //   if (data != null) {
  //     data.forEach((dataa) {
  //       dataListGame.add(
  //         GameAccount.fromJson(
  //           jsonDecode(dataa),
  //         ),
  //       );
  //     });
  //   }
  //   return dataListGame;
  // }

  static Future setFCMToken(String token) async {
    await _preferences.setString(_keyFCMToken, token);
  }

  static String? getFCMToken() {
    final data = _preferences.getString(_keyFCMToken);

    if (data != null) return data;
    return null;
  }

  static Future setIsDark(bool isDark) async {
    await _preferences.setBool(_keyIsDark, isDark);
  }

  static bool getIsDark() {
    final data = _preferences.getBool(_keyIsDark);

    if (data != null) {
      return data;
    } else {
      return Get.isPlatformDarkMode;
    }
  }

  static Future setTitle(String title) async {
    await _preferences.setString(_keyTitle, title);
  }

  static String getTitle() {
    final data = _preferences.getString(_keyTitle);

    if (data != null) return data;
    return "GAMESTORE INDONESIA";
  }

  static Future setSubTitle(String subtitle) async {
    await _preferences.setString(_keySubTitle, subtitle);
  }

  static String getSubTitle() {
    final data = _preferences.getString(_keySubTitle);

    if (data != null) return data;
    return "www.gamestoreindonesia.com";
  }

  static Future setFooter(String footer) async {
    await _preferences.setString(_keyFooter, footer);
  }

  static String getFooter() {
    final data = _preferences.getString(_keyFooter);

    if (data != null) return data;
    return "TERIMAKASIH SUDAH TOP UP DI GAMESTORE INDONESIA";
  }
}
