import 'package:flutter/material.dart';
import 'package:multi_coin/router/routes.dart';
import 'package:multi_coin/theme/theme.dart';
import 'package:provider/provider.dart';

class CerrenciesListApp extends StatelessWidget {
  const CerrenciesListApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        final themeProvider = ThemeProvider();
        themeProvider.loadTheme();
        return themeProvider;
      },
      builder: (context, _) {
        return Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return MaterialApp(
              title: 'Cerrencies List',
              themeMode: themeProvider.themeMode,
              theme: MyThemes.lightTheme,
              darkTheme: MyThemes.darkTheme,
              routes: routes,
            );
          },
        );
      },
    );
  }
}
