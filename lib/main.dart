import 'package:currcon/app/data/services/currency_rate_service.dart';
import 'package:currcon/app/router.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final apiClient = RestClient(Dio());

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Currency Converter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
