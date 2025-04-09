import 'package:flutter/material.dart';

class ComButton extends StatelessWidget {
  const ComButton({super.key, required this.label, required this.onPressed, this.color});
  final String label;
  final GestureTapCallback onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: 280,
      height: 40,
      color: color??Colors.blueAccent,
      disabledColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      child: Text(label,style: const TextStyle(color: Colors.white)),
    );
  }
}