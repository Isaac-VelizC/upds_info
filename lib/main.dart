import 'package:flutter/material.dart';
import 'package:upds_info/themes/colors.dart';
import 'package:upds_info/welcome.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UPDS PLATAFORMA',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: blanco),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}
