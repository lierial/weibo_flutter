import 'dart:math';

import 'package:flutter/material.dart';

class WebImage extends StatelessWidget {
  const WebImage({super.key, required this.path});
  final String path;


  @override
  Widget build(BuildContext context) {
    return Image.network(
      path,fit: BoxFit.cover,
      loadingBuilder: (context,child,event){
        if(event == null) return child;
        return const SizedBox(width: 20,height: 20,child: const CircularProgressIndicator(),);
      },
      errorBuilder: (context,child,event){
        return Container(color: Colors.grey,child: const Icon(Icons.broken_image_rounded),);
      },
    );
  }
}