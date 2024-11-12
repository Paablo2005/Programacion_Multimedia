import 'package:flutter/material.dart';
import 'package:t1_act1_pabloamores/routes/app_routes.dart';
import 'package:t1_act1_pabloamores/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawer Navigation App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[200],
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black87, fontSize: 16),
          bodyMedium: TextStyle(color: Colors.black54, fontSize: 14),
          titleLarge: TextStyle(
              color: Colors.blueAccent,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        appBarTheme: const AppBarTheme(
          color: Colors.blueAccent,
          elevation: 4,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
