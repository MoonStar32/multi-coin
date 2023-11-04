import 'package:flutter/material.dart';
import 'package:multi_coin/router/routes.dart';
import 'package:multi_coin/theme/theme.dart';

class CerrenciesListApp extends StatelessWidget {
  const CerrenciesListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cerrencies List',
      theme: darkTheme,
      routes: routes,
    );
  }
}
