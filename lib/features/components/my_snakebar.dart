import 'package:flutter/material.dart';

mySnakeBar({
  required BuildContext context,
  required title,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        duration: const Duration(seconds: 5),
        behavior: SnackBarBehavior.floating,
        padding: const EdgeInsets.all(0),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(18))),
        content: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  alignment: AlignmentDirectional.bottomStart,
                  image: AssetImage('assets/images/bgElements.png'))),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Text(title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.white)),
            ),
          ),
        )),
  );
}
