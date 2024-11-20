import 'package:eduplan/core/constants/app_constraints.dart';
import 'package:eduplan/features/components/app_button.dart';
import 'package:eduplan/features/components/app_inputfield.dart';
import 'package:flutter/material.dart';

final GlobalKey<FormState> _formKeyPage2 = GlobalKey<FormState>();

class Page2 extends StatelessWidget {
  const Page2({
    super.key,
    required this.controller,
    required this.contactCtrl,
    required this.passwordCtrl,
  });
  final PageController controller;
  final TextEditingController contactCtrl;
  final TextEditingController passwordCtrl;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKeyPage2,
        child: Column(
          children: [
            Image.asset('assets/images/teacher_registration_3.jpg'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "Please provide your contact information to stay connect with students and create a secure password to protect your account.",
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  AppConstraints.smallH,
                  AppInputField(
                      hint: 'Contact',
                      icon: Icons.call,
                      controller: contactCtrl),
                  AppConstraints.verySmallH,
                  AppInputField(
                      hint: 'Password',
                      icon: Icons.key,
                      controller: passwordCtrl),
                  AppConstraints.verySmallH,
                  Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          title: 'Continue',
                          onTap: () async {
                            if (_formKeyPage2.currentState!.validate()) {
                              await Future.delayed(
                                      const Duration(milliseconds: 100))
                                  .then(
                                    (value) => Future.delayed(
                                            const Duration(milliseconds: 100))
                                        .then(
                                      (value) => FocusManager
                                          .instance.primaryFocus
                                          ?.unfocus(),
                                    ),
                                  )
                                  .then(
                                    (value) => controller.nextPage(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.easeIn),
                                  );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
