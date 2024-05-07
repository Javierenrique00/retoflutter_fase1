import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/modules/home_screen/home_screen_view.dart';

import 'presentation/navigation/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'El mercado fresco !',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: appRoutes,
    );
  }
}

