// import 'package:get_storage/get_storage.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/get_user_model.dart';
import '../constants/colors.dart';

class StorageService {
  // static const String _userDataKey = 'user_data';

  // static Future<void> saveUserData(String key, GetUsersModel userData) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString(key, json.encode(userData.toJson()));
  // }

  static Future<void> saveUserData(
      BuildContext context, String key, Map<String, dynamic> userData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userDataJson = jsonEncode(userData);
    await prefs.setString(key, userDataJson);
    debugPrint('Data is Saved');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        content: const Text(
          'Data saved Locally',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }

  static Future<GetUsersModel?> getUserData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final userDataString = prefs.getString(key);
    return userDataString != null
        ? GetUsersModel.fromJson(jsonDecode(userDataString))
        : null;
  }

  Future<void> saveUserDataToPrefs(GetUsersModel userData) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('userData', json.encode(userData.toJson()));
  }
}

// class AppLocalStorage {
//   static final AppLocalStorage _instance = AppLocalStorage._internal();

//   factory AppLocalStorage() {
//     return _instance;
//   }

//   AppLocalStorage._internal();

//   final _storage = GetStorage();

//   // Generic method to save data
//   Future<void> saveData<T>(String key, T value) async {
//     await _storage.write(key, value);
//   }

//   // Generic method to read data
//   T? readData<T>(String key) {
//     return _storage.read<T>(key);
//   }

//   // Generic method to remove data
//   Future<void> removeData(String key) async {
//     await _storage.remove(key);
//   }

//   // Clear all data in storage
//   Future<void> clearAll() async {
//     await _storage.erase();
//   }
// }


/// *** *** *** *** *** Example *** *** *** *** *** ///

// LocalStorage localStorage = LocalStorage();
//
// // Save data
// localStorage.saveData('username', 'JohnDoe');
//
// // Read data
// String? username = localStorage.readData<String>('username');
// print('Username: $username'); // Output: Username: JohnDoe
//
// // Remove data
// localStorage.removeData('username');
//
// // Clear all data
// localStorage.clearAll();

