import 'package:flutter/material.dart';

class FollowButton extends StatelessWidget {
  const FollowButton({super.key,required this.onPressed});
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20)
      ),
      child:InkWell(
        onTap: onPressed,
        child: const Padding(padding: EdgeInsets.fromLTRB(12, 6, 12, 6),child: Text("关注"),),
      ),
    );
  }
}