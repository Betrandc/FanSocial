import 'package:flutter/material.dart';

class Inbox extends StatelessWidget {
  const Inbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceheight =MediaQuery.of(context).size.height;
    // final devicewidth =MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:Colors.black,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      height:deviceheight/7 ,
      // width: devicewidth,
      child: Card(
             color: Color.fromARGB(255, 36, 35, 35), 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: const Text("Chat with favorite celebrities",style: TextStyle(     color: Colors.white, ),),
           ),
          const  Text("just click on profile to chate or ",style: TextStyle(     color: Color.fromARGB(255, 68, 68, 68), ),),
           const Text("find more people",style: TextStyle(     color: Color.fromARGB(255, 65, 64, 64), ),),
            InkWell(
              onTap: (){},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const[
                  Text("Start chatting",style: TextStyle(color: Colors.pink),),
                  Icon(Icons.start,color: Colors.pink,)
                ],
              ),
            )
          ],
        ),
      ),
    ),);
  }
}