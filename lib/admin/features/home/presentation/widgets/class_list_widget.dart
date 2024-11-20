import 'package:flutter/material.dart';

class ClassListWidget extends StatelessWidget {
  const ClassListWidget({
    super.key,
    required this.className,
    required this.division,
    required this.index,
  });
  final String? className;
  final String? division;
  final String index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
      child: ListTile(
        tileColor: Theme.of(context).colorScheme.secondary,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          child: Text(index),
        ),
        title: Text('${className ?? ''}-${division ?? ''}'),
      ),
    );
  }
}
