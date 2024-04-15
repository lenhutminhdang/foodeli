import 'package:flutter/material.dart';

class AppDrawerTile extends StatelessWidget {
  final String text;
  final IconData? icon;
  final void Function()? onTap;

  const AppDrawerTile({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 64),
      child: ListTile(
        title: Text(
          text,
          style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 18
          ),
        ),
        leading: Icon(icon, color: Colors.grey.shade400),
        onTap: onTap,
      ),
    );
  }
}