import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../logic/get_user_logic.dart';
import '../model/get_user_model.dart';

class GetUsersProvider with ChangeNotifier {
  List<GetUsersModel>? _getAllUsers = [];
  GetUsersModel? _userData;
  String _errorMessage = '';

  GetUsersModel? get userData => _userData;
  String get errorMessage => _errorMessage;
  List<GetUsersModel>? get getAllUsers => _getAllUsers;
  GetUserLogic users = GetUserLogic();

  Future<void> fetchAllUsers(BuildContext context) async {
    try {
      final List<GetUsersModel> data = await users.fetchAllUsers(context);
      _getAllUsers = data;
      if (_getAllUsers == null || _getAllUsers == []) {
        _errorMessage = 'null';
      }
      notifyListeners();

      // final  data = await users.fetchAllUsers(context);
      //   _getAllUsers =
      //       data.map((json) => GetUsersModel.fromJson(json)).toList();

      debugPrint(
          'Users data(length) in UsersProvider : ${_getAllUsers?.length}');

      _errorMessage = '';
      debugPrint('UsersProvider used');
      notifyListeners();
    } catch (error) {
      _errorMessage = 'Error: $error';
      debugPrint('UsersProvider error $_errorMessage');
    } finally {
      notifyListeners();
    }
  }

  Future<void> fetchUserData(BuildContext context) async {
    try {
      final data = await users.fetchUserData(context);
      _userData = GetUsersModel.fromJson(data);

      debugPrint('user data in UserProvider : ${_userData?.name}');

      _errorMessage = '';
      debugPrint('UserProvider used');
      notifyListeners();
    } catch (error) {
      _errorMessage = 'Error: $error';
      debugPrint('UserProvider error $error');
    } finally {
      notifyListeners();
    }
  }
}
