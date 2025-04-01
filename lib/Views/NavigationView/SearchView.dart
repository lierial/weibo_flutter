import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 38,
        title: SizedBox(height: 35,child: TextField(
          cursorWidth: 1.0,
          maxLines: 1,
          controller: controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 10),
            isDense: true,
            suffix: TextButton(onPressed: (){}, child: const Text("搜索")),
            border: OutlineInputBorder(

              borderRadius: BorderRadius.circular(20)
            )
        ),
      ),),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height:300,child: Padding(
            padding:const EdgeInsets.all(19),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 8.0),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Text("今日的热搜数 TOP${index+1}");
              },),
          ),)
        ],
      ),
    );
  }
}