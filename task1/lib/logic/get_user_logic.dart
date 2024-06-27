import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/get_user_model.dart';
import '../utils/constants/api_constants.dart';

class GetUserLogic {
  Future<List<GetUsersModel>> fetchAllUsers(
      BuildContext context) async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false, // prevents dismissal on tap outside
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(), // Or any other loader widget
          );
        },
      );
      final response = await http.get(Uri.parse(baseUrl));
      Navigator.of(context).pop();
      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);
        debugPrint('users fetched : GetUserLogic');

        // Print out the response body for debugging
        debugPrint('Response Body: $responseData');

        // Map each item in the responseData list to GetUsersModel
        List<GetUsersModel> users =
            responseData.map((json) => GetUsersModel.fromJson(json)).toList();

        // Print out the parsed users for debugging
        debugPrint('Parsed users: $users');

        return users;

        // return json.decode(response.body);
      } else if (response.statusCode == 404) {
        // Handle 404 error (No users found)
        debugPrint('users not fetched : GetUserLogic : ${response.statusCode}');
        return [];
        // return json.decode(response.body);
      } else // Handle other HTTP status codes
        throw Exception('Failed to load order data: ${response.statusCode}');
    } catch (e) {
      debugPrint("Exception occured while retriving order data : $e");
      return [];
      // return json.decode(response.body);
    }
  }

  Future<Map<String, dynamic>> fetchUserData(BuildContext context) async {
    // try {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      debugPrint('User Data fetched : GetUserLogic');
      return json.decode(response.body);
    } else {
      debugPrint(
          'User Data not fetched : GetUserLogic : ${response.statusCode}');
      throw Exception('Failed to load user data');
    }
    // } catch (e) {
    //   debugPrint("Exception occured while retriving user data : $e");
    // }
  }
}
