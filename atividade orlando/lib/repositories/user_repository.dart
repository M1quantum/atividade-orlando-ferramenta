import '../models/user.dart';

class UserRepository {
  final List<User> _users = [];

  void addUser(User user) {
    _users.add(user);
  }

  List<User> getAllUsers() {
    return _users;
  }

  bool emailExists(String email) {
    return _users.any((user) => user.email == email);
  }

  bool login(String email, String password) {
  return _users.any(
    (user) => user.email == email && user.password == password,
  );
}
}