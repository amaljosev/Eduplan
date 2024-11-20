import 'package:flutter/material.dart';

class AppInputField extends StatelessWidget {
  const AppInputField({
    super.key,
    required this.hint,
    required this.icon,
    required this.controller,
    this.onTap,
    this.isReadOnly = false,
  });
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final void Function()? onTap;
  final bool isReadOnly;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(height: 1.0),
      controller: controller,
      maxLines: null,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.tertiary),
          prefixIcon: Icon(
            icon,
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.primary),
              borderRadius: const BorderRadius.all(Radius.circular(12))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(style: BorderStyle.none),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          filled: true,
          fillColor: Theme.of(context).colorScheme.secondary),
      validator: (value) => controller.text.isEmpty || controller.text == ''
          ? 'Please fill $hint'
          : hint == 'Password' && controller.text.length < 8
              ? 'Mininum 8 letters required'
              : hint == 'Contact' &&
                      !RegExp(r'^[0-9]+$').hasMatch(controller.text)
                  ? 'Only numbers are allowed'
                  : hint == 'Full Name' &&
                          !RegExp(r'^[a-zA-Z\s]+$').hasMatch(controller.text)
                      ? 'Name can only contain alphabets and spaces'
                      : null,
      onTap: onTap,
      readOnly: isReadOnly,
    );
  }
}
