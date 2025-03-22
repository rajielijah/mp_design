import 'package:flutter/material.dart';
import 'package:mp_design/feature/homepage/presentation/screens/root_page.dart';
import 'core/theme/app_theme.dart';


void main() {
  runApp(RealEstateApp());
}

class RealEstateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real Estate App',
      theme: AppTheme.themeData,
      home: const RootPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
