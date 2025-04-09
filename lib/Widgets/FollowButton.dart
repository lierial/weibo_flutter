import 'package:flutter/material.dart';

class FollowButton extends StatelessWidget {
  const FollowButton({super.key,required this.onPressed, required this.isFollowed});
  final Function() onPressed;
  final bool isFollowed;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20)
      ),
      child:InkWell(
        onTap: onPressed,
        child: Padding(padding:const EdgeInsets.fromLTRB(12, 6, 12, 6),child: Text(isFollowed?"已关注":"  关注  "),),
      ),
    );
  }
}