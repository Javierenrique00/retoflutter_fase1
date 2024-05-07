import 'package:flutter/material.dart';

import '../modules/detail_screen/detail_screen_view.dart';
import '../modules/form_screen/form_screen_view.dart';
import '../modules/home_screen/home_screen_view.dart';
import './navigation.dart';



Map<String, Widget Function(BuildContext)> get appRoutes {
        return {
          Navigation.homeScreen : (context) =>  const HomeScreenView(),
          Navigation.detailScreen :(context) => const DetailScreenView(),
          Navigation.formScreen :(context) => const FormScreenView(),
        };
      }