import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/datasource/local/local_product_datasource_impl.dart';
import 'data/repository/product_repository_impl.dart';
import 'domain/viewmodels/app_viewmodel.dart';
import 'presentation/navigation/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AppViewModel(
            repository: ProductRepositoryImpl(
                datasource: LocalProductDatasourceImpl())),
      child: const AppGlobalState(),
      );
  }
}

class AppGlobalState extends StatelessWidget {
  const AppGlobalState({
    super.key,
  });

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

