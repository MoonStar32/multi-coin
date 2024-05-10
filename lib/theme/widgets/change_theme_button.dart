import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  const ChangeThemeButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Switch(
          value: themeProvider.isDarkMode,
          onChanged: (value) {
            themeProvider.toggleTheme(value);
          },
        );
      },
    );
  }
}
