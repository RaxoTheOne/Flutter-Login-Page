import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../../domain/use_cases/login_use_case.dart';
import '../../domain/entities/user.dart';

class LoginWidget extends StatelessWidget {
  final LoginUseCase loginUseCase;

  LoginWidget({required this.loginUseCase});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FadeInUp(
          duration: Duration(milliseconds: 1800),
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color.fromRGBO(143, 148, 251, 1)),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(143, 148, 251, .2),
                  blurRadius: 20.0,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Color.fromRGBO(143, 148, 251, 1)),
                    ),
                  ),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email or Phone number",
                      hintStyle: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 30),
        FadeInUp(
          duration: Duration(milliseconds: 1900),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(143, 148, 251, 1),
                  Color.fromRGBO(143, 148, 251, .6),
                ],
              ),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent, // Transparent background
                shadowColor: Colors.transparent, // No shadow
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Match container's border radius
                ),
              ),
              onPressed: () async {
                User user = await loginUseCase(
                  _emailController.text,
                  _passwordController.text,
                );
                print('User authenticated: ${user.email}');
              },
              child: Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Color.fromRGBO(143, 148, 251, 1), // Purple text color
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 70),
        FadeInUp(
          duration: Duration(milliseconds: 2000),
          child: Text(
            "Forgot Password?",
            style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
          ),
        ),
      ],
    );
  }
}