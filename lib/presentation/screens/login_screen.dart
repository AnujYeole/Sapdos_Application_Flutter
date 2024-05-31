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
    var screenWidth = _mediaquery.size.width;
    // var screenHeight = _mediaquery.size.height;
    var adaptivePadding = screenWidth * 0.12;
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      //appBar: AppBar(title: Text("Welcome Back")),
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Row(
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
              child: Container(
                width: _mediaquery.size.width * 0.5 < 500
                    ? 500
                    : _mediaquery.size.width * 0.5,
                //padding: EdgeInsets.all(adaptivePadding),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft:
                        Radius.circular(20.0), // Adjust the values as needed
                    bottomLeft:
                        Radius.circular(20.0), // Adjust the values as needed
                  ),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: SizedBox(
                      width: 340,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "SAPDOS",
                            style: TextStyle(
                                fontSize: 34, // Adjust the font size as needed
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          const Text(
                            "Welcome Back",
                            style: TextStyle(
                                fontSize: 24, // Adjust the font size as needed
                                color: AppColors.primaryColor),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Enter existing account's details",
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(height: 25),
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
                              suffixIcon: IconButton(
                                icon: Icon(
                                  authProvider.isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed:
                                    authProvider.togglePasswordVisibility,
                              ),
                            ),
                            obscureText: !authProvider.isPasswordVisible,
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
                          SizedBox(height: _mediaquery.size.height * 0.08),
                          SizedBox(
                            width: _mediaquery.size.width * 0.3,
                            height: _mediaquery.size.height * 0.05,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: AppColors.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  authProvider.login(context);
                                }
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: _mediaquery.size.height * 0.05,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/signup');
                            },
                            child: const Text(
                              "Not on Sapdos? Sign-up",
                              style: TextStyle(color: AppColors.primaryColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
