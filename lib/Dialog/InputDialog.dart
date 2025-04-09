import 'package:flutter/material.dart';

class InputDialog extends StatelessWidget {
  InputDialog({super.key});
  final TextEditingController tec = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("输入"),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      content: TextField(controller: tec),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context,{"content":tec.text});
        }, child: const Text("sure"))
      ],
    );
  }
}