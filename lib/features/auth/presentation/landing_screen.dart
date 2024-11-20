import 'package:eduplan/features/components/app_button.dart';
import 'package:flutter/material.dart';

class ScreenLanding extends StatelessWidget {
  const ScreenLanding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Image.asset(
            'assets/images/Eduplan-Logo.png',
            fit: BoxFit.contain,
            filterQuality: FilterQuality.high,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        title: 'Teacher',
                        onTap: () => Navigator.of(context).pushNamed(
                          '/login',
                          arguments: {'teacher': true},
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        title: 'Student',
                        onTap: () => Navigator.of(context).pushNamed(
                          '/login',
                          arguments: {'teacher': false},
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
