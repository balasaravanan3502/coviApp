import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './provider/Cases.dart';
import './provider/VaccineCenter.dart';
import './screens/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: VaccineCenter(),
        ),
        ChangeNotifierProvider.value(
          value: Cases(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'SF Pro Text'),
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
