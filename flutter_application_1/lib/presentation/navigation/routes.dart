import 'package:flutter/material.dart';

import '../modules/detail_screen/detail_screen.dart';
import '../modules/form_screen/form_screen.dart';
import '../modules/home_screen/home_screen.dart';
import './navigation.dart';



Map<String, Widget Function(BuildContext)> get appRoutes {
        return {
          Navigation.homeScreen : (context) =>  const HomeScreen(),
          Navigation.detailScreen :(context) => const DetailScreen(),
          Navigation.formScreen :(context) => const FormScreen(),
        };
      }