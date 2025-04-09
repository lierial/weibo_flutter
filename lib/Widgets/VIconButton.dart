import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VIconButton extends StatelessWidget {
  const VIconButton({super.key, required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        children: [
          FaIcon(icon,size: 16),
          Text(label)
        ],
      ),
    );
  }
}