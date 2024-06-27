import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/image_provider.dart';
import 'screen/home_screen.dart';
import 'utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PickImageProvider()),
      ],
      child: MaterialApp(
        themeMode: ThemeMode.light,
        theme: CustomAppTheme.lightTheme,
        darkTheme: CustomAppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}
