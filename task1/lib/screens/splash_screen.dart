import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/get_users_provider.dart';
import 'error_screen.dart';
import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () async {
        final userProvider = Provider.of<GetUsersProvider>(
          context,
          listen: false,
        );
        await userProvider.fetchAllUsers(context);
        // await userProvider.fetchUserData(context);

        // Navigate accordingly
        if (userProvider.errorMessage == 'null' ||
            userProvider.getAllUsers == null ||
            userProvider.getAllUsers!.isEmpty ||
            userProvider.getAllUsers == []) {
          // User ID exists, navigate to home screen or any authenticated screen

          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => ErrorScreen()));
        } else {
          // User ID doesn't exist, navigate to intro screen or login screen
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomeScreen()));
        }
      },
    );

    return Scaffold(
      body: Center(child: Image.asset('assets/logo.jpeg')),
    );
  }
}
