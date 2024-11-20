import 'package:eduplan/features/auth/presentation/widgets/page1_widget.dart';
import 'package:eduplan/features/auth/presentation/widgets/page2_widget.dart';
import 'package:eduplan/features/auth/presentation/widgets/page3_widget.dart';
import 'package:eduplan/features/auth/presentation/widgets/page4_widget.dart';
import 'package:flutter/material.dart';

class ScreenTeacherRegister extends StatefulWidget {
  const ScreenTeacherRegister({super.key});

  @override
  State<ScreenTeacherRegister> createState() => _ScreenTeacherRegisterState();
}

class _ScreenTeacherRegisterState extends State<ScreenTeacherRegister> {
  final pageCtrl = PageController();
  final nameCtrl = TextEditingController();

  final usernameCtrl = TextEditingController();
  final contactCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    nameCtrl.dispose();
    usernameCtrl.dispose();
    contactCtrl.dispose();
    passwordCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      controller: pageCtrl,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Page1(
            controller: pageCtrl,
            nameCtl: nameCtrl,
            userNameCtrl: usernameCtrl),
        Page2(
            controller: pageCtrl,
            contactCtrl: contactCtrl,
            passwordCtrl: passwordCtrl),
        Page3(
            controller: pageCtrl,
            nameCtrl: nameCtrl,
            usernameCtrl: usernameCtrl,
            contactCtrl: contactCtrl,
            passwordCtrl: passwordCtrl),
        const Page4()
      ],
    ));
  }
}
