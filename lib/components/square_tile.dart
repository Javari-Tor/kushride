import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final Widget child;
  final void Function()? onTap;

  const SquareTile({
    super.key,
    required this.child,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool darkTheme = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color:Colors.grey),
          borderRadius: BorderRadius.circular(16),
          color: darkTheme? Colors.amber.shade400: Colors.grey.shade200,
        ),
        child: child,
      ),
    );
  }
}
