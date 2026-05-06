import 'package:flutter/material.dart';
import '../repositories/user_repository.dart';
import 'register_page.dart';
import 'users_page.dart';

class LoginPage extends StatefulWidget {
  final UserRepository repository;

  LoginPage({required this.repository});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String message = '';

  void login() {
    final success = widget.repository.login(
      emailController.text,
      passwordController.text,
    );

    if (success) {
      setState(() => message = 'Login realizado com sucesso');

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => UsersPage(repository: widget.repository),
        ),
      );
    } else {
      setState(() => message = 'Email ou senha inválidos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: login,
              child: Text('Entrar'),
            ),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        RegisterPage(repository: widget.repository),
                  ),
                );
              },
              child: Text('Não tem conta? Cadastre-se'),
            ),

            SizedBox(height: 20),
            Text(message),
          ],
        ),
      ),
    );
  }
}