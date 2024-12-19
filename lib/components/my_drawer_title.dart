import 'package:flutter/material.dart';
class MyDrawerTitle extends StatelessWidget {

  final String text;
  final IconData? icon;
  final void Function()? onTap;
  const MyDrawerTitle({
    super.key,
    required this.icon,
    required this.onTap,
    required this.text
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: ListTile(
          title: Text(
            text,
            style: const TextStyle(color: Colors.grey),
          ),
          leading: Icon(
            icon,
            color: Colors.grey,),
          onTap: onTap,
      ),
    );
  }
}