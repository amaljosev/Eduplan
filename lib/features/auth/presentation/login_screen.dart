import 'package:eduplan/core/constants/app_constraints.dart';
import 'package:eduplan/features/components/app_button.dart';
import 'package:eduplan/features/components/app_inputfield.dart';
import 'package:flutter/material.dart';

final _usernameCtrl = TextEditingController();
final _passwordCtrl = TextEditingController();

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          children: [
            Image.asset(
              'assets/images/teacher and student.png',
              height: 300,
              width: 300,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Eduplan",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            AppConstraints.smallH,
            Row(
              children: [
                Text(
                  "Let's Sign in",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
            AppConstraints.smallH,
            AppInputField(
                hint: 'Username',
                icon: Icons.person,
                controller: _usernameCtrl),
            AppConstraints.verySmallH,
            AppInputField(
                hint: 'Password', icon: Icons.key, controller: _passwordCtrl),
            AppConstraints.verySmallH,
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    title: 'Sign in',
                    onTap: () {},
                  ),
                ),
              ],
            ),
            TextButton(
                onPressed: () => Navigator.of(context).pushNamed('/register'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "New Teacher?",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const Text(
                      "Register",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
