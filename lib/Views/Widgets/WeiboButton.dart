import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeiboButton extends StatelessWidget {
  const WeiboButton({super.key,required this.onPressed,required this.label,required this.icon, this.color});
  final Function() onPressed;
  final String label;
  final IconData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(icon,size: 15,color: color,),
          Text("  $label",style: TextStyle(color: color),)
        ],
      ),
    );
  }

}