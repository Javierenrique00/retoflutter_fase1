import 'package:flutter/material.dart';

import '../../navigation/navigation.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [Text('Home Screen'),
        TextButton(onPressed: ()=>Navigator.of(context).pushNamed(Navigation.detailScreen), child: Text('Goto detail')) ],
      ),
    );
  }
}
