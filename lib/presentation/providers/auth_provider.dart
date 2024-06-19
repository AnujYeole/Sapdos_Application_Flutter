// lib/presentation/providers/auth_provider.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'doctor_provider.dart';

class AuthProvider with ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool _rememberMe = false;

  bool get rememberMe => _rememberMe;
  bool _isPasswordVisible = false;

  bool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void setRememberMe(bool? value) {
    _rememberMe = value ?? false;
    notifyListeners();
  }

  String? getName() {
    for (int i = 0; i < _users.length; i++) {
      if (_users[i]['email'] == emailController.text.toString()) {
        return _users[i]['name'];
      }
    }
    return "User";
  }

  final List<Map<String, String>> _users = [
    {
      "email": "anujyeole23@gmail.com",
      "name": "Anuj Yeole",
      "phoneNumber": "7066998969",
      "password": "password123"
    },
    {
      "email": "jane.smith@example.com",
      "name": "Anuj Yeole",
      "phoneNumber": "+1987654321",
      "password": "securePass456"
    },
    {
      "email": "alice.jones@example.com",
      "name": "Anuj Yeole",
      "phoneNumber": "+1122334455",
      "password": "mySecret789"
    },
    {
      "email": "bob.brown@example.com",
      "name": "Anuj Yeole",
      "phoneNumber": "+1223344556",
      "password": "qwerty1234"
    },
    {
      "email": "carol.white@example.com",
      "name": "Anuj Yeole",
      "phoneNumber": "+1333444555",
      "password": "passwordABC"
    }
  ];
  void login(BuildContext context) {
    final email = emailController.text;
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter both email and password")),
      );
      return;
    }

    final user = _users.firstWhere(
      (user) =>
          (user['email'] == email || user['phoneNumber'] == email) &&
          user['password'] == password,
      orElse: () => {"email": "", "phoneNumber": "", "password": ""},
    );

    if (user["email"]!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid credentials")),
      );
    } else {
      Provider.of<DoctorProvider>(context, listen: false)
          .setDoctorName(user["email"]!);
      Navigator.pushReplacementNamed(context, '/doctor');
    }
  }

  void signup(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/doctor');
  }
}
