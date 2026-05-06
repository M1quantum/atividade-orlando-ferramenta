import 'package:flutter_test/flutter_test.dart';
import 'package:cadastro_app/models/user.dart';
import 'package:cadastro_app/repositories/user_repository.dart';

void main() {
  group('UserRepository Test', () {
    test('Deve adicionar usuário', () {
      final repo = UserRepository();

      repo.addUser(User(email: 'teste@email.com', password: '123'));

      expect(repo.getAllUsers().length, 1);
    });

    test('Deve verificar se email existe', () {
      final repo = UserRepository();

      repo.addUser(User(email: 'teste@email.com', password: '123'));

      expect(repo.emailExists('teste@email.com'), true);
    });

    test('Não deve aceitar email duplicado', () {
      final repo = UserRepository();

      repo.addUser(User(email: 'teste@email.com', password: '123'));

      expect(repo.emailExists('teste@email.com'), true);
    });
  });
}