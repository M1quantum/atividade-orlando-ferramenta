import 'package:flutter/material.dart';
import '../repositories/user_repository.dart';

class UsersPage extends StatelessWidget {
  final UserRepository repository;

  UsersPage({required this.repository});

  @override
  Widget build(BuildContext context) {
    final users = repository.getAllUsers();

    return Scaffold(
      appBar: AppBar(title: Text('Usuários cadastrados')),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(users[index].email),
          );
        },
      ),
    );
  }
}