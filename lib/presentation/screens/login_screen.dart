import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:form_validator/form_validator.dart';
import 'package:sapdos_app/core/constants/colors.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var _mediaquery = MediaQuery.of(context);
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      //appBar: AppBar(title: Text("Welcome Back")),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: _mediaquery.size.width * 0.5,
            decoration: const BoxDecoration(
                color: AppColors.backgroundColor,
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/doctor.png',
                    ),
                    fit: BoxFit.contain)),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Welcome Back",
                      style: TextStyle(
                          fontSize: 34, // Adjust the font size as needed
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: authProvider.emailController,
                      decoration: InputDecoration(
                        hintText: "Email address or phone number",
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: ValidationBuilder().email().build(),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: authProvider.passwordController,
                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: const Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      obscureText: true,
                      validator: ValidationBuilder().minLength(6).build(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: authProvider.rememberMe,
                              onChanged: authProvider.setRememberMe,
                            ),
                            Text("Remember me"),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            // Forgot password functionality
                          },
                          child: Text("Forgot Password?"),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          authProvider.login(context);
                        }
                      },
                      child: Text("Login"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: Text("Not on Sapdos? Sign-up"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
