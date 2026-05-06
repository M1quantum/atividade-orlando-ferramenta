import 'package:flutter/material.dart';
import 'repositories/user_repository.dart';
import 'pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final UserRepository repository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(repository: repository), // 👈 começa no login
    );
  }
}