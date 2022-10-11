import 'package:flutter/material.dart';

class Following extends StatelessWidget {
  const Following({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double deviceheight =MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Align(
        alignment: Alignment.center,
        child: Column(
          //  crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.center,
          children:[
              Text("Follow your faves",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color:Colors.white),),
               Text("To get access to exclusive content,",style: TextStyle(color:Colors.white),),
                Text("deals, and more!",style: TextStyle(color:Colors.white),),
      
                Container(
                  margin:  EdgeInsets.only(top: deviceheight/9),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.pink,),
                  
                  child: MaterialButton(onPressed: (){},
                  child: const Text("Explore trending feeds",style: TextStyle(color: Colors.white),),
                  ),
                )
          ],
        ),
      ),
    );
  }
}