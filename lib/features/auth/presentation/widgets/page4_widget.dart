import 'package:eduplan/core/constants/app_constraints.dart';
import 'package:eduplan/features/components/app_button.dart';
import 'package:flutter/material.dart';

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Image.asset('assets/images/teacher_registration_1.png'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                AppConstraints.mHeight,
                Text(
                  "Registration Successful!",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
                AppConstraints.smallH,
                Text(
                  "Thank you for registering. Your account is pending approval from the principal. You will be able to log in once your registration is confirmed. Please check back later or contact the administration for updates.",
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                AppConstraints.mHeight,
                Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        title: 'Login',
                        onTap: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
