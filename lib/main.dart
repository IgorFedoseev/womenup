import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/home_page.dart';
import 'view_model/view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    const title = 'WOMAN UP';
    return MaterialApp(
      title: title,
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.white,
          secondary: const Color.fromRGBO(51, 28, 32, 1.0),
          brightness: Brightness.dark,
        ),
      ),
      home: Provider(
        create: (_) => ViewModel(),
        child: const HomePage(title: title),
      ),
    );
  }
}
