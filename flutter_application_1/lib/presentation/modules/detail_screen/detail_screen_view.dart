import 'package:flutter/material.dart';

import '../../navigation/navigation.dart';

class DetailScreenView extends StatelessWidget {
  const DetailScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
        children: [Text('Detail Screen'),
        TextButton(onPressed: ()=>Navigator.of(context).pushNamed(Navigation.formScreen), child: Text('Goto Form (Edition)')) ],
      ),
    );
  }
}