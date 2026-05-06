import 'package:flutter/material.dart';
import '../models/user.dart';
import '../repositories/user_repository.dart';

class RegisterPage extends StatefulWidget {
  final UserRepository repository;

  RegisterPage({required this.repository});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String message = '';

  void register() {
    final email = emailController.text;
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      setState(() => message = 'Preencha todos os campos');
      return;
    }

    if (widget.repository.emailExists(email)) {
      setState(() => message = 'Email já cadastrado');
      return;
    }

    widget.repository.addUser(
      User(email: email, password: password),
    );

    setState(() => message = 'Cadastro realizado com sucesso');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro')),
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
              onPressed: register,
              child: Text('Cadastrar'),
            ),

            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Voltar para login'),
            ),

            SizedBox(height: 20),
            Text(message),
          ],
        ),
      ),
    );
  }
}