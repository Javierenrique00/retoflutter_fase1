import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'infraestructure/api/local/local_api_impl.dart';
import 'infraestructure/gateway/store_gateway_impl.dart';
import 'domain/viewmodel/app_viewmodel.dart';
import 'ui/navigation/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AppViewModel(
            repository: StoreGatewayImpl(
                datasource: LocalApiImpl())),
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

