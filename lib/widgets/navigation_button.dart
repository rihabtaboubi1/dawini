import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  NavigationButton({required this.title, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(icon),
      label: Text(title),
      onPressed: onPressed,
    );
  }
}
