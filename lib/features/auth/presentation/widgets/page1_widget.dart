import 'package:eduplan/core/constants/app_constraints.dart';
import 'package:eduplan/features/components/app_button.dart';
import 'package:eduplan/features/components/app_inputfield.dart';
import 'package:flutter/material.dart';

final GlobalKey<FormState> _formKeyPage1 = GlobalKey<FormState>();

class Page1 extends StatelessWidget {
  const Page1({
    super.key,
    required this.controller,
    required this.nameCtl,
    required this.userNameCtrl,
  });
  final PageController controller;
  final TextEditingController nameCtl;
  final TextEditingController userNameCtrl;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKeyPage1,
        child: Column(
          children: [
            Image.asset('assets/images/teacher_registration_2.jpg'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "To personalize your experience, please provide your name and set a good username",
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  AppConstraints.smallH,
                  AppInputField(
                      hint: 'Full Name',
                      icon: Icons.person,
                      controller: nameCtl),
                  AppConstraints.verySmallH,
                  AppInputField(
                      hint: 'Username',
                      icon: Icons.person_2_outlined,
                      controller: userNameCtrl),
                  AppConstraints.verySmallH,
                  Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          title: 'Continue',
                          onTap: () {
                            if (_formKeyPage1.currentState!.validate()) {
                              controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
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
