
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


class Search_Single_Item extends StatelessWidget {
  const Search_Single_Item({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder:(context, index) => SizedBox(
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage("Assets/Images/patient.jpg"),
            ),

            Column(
              children: [
                Center(
                  child: Text("Jean Marie"),
                ),
                 Center(
                  child: Text("programmer"),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}