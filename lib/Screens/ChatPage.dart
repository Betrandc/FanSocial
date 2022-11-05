import 'package:flutter/material.dart';
import './Dashboard.dart';

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
      height:deviceheight ,
      // width: devicewidth,
      child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
        children: [
                 Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Inbox",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 27),),
                      Stack(
                          children: [
                            Icon(Icons.notifications_outlined,color: Colors.white, size: 18,),
                            Positioned(
                              top: -7,
                              left: 4,
                              child: Card(
                              color: Color(0xFFb20257),
                              child: SizedBox(
                                height: 13,
                                width: 13,
                                child:Center(child: Text("120",style: TextStyle(fontSize: 7,color: Colors.white),)) ),
                            ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),


            Card(
               color: Color.fromARGB(255, 36, 35, 35), 
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    const Padding(
                       padding:  EdgeInsets.all(8.0),
                       child:  Text("Chat with favorite celebrities",style: TextStyle(     color: Colors.white, ),),
                     ),
                    const  Text("just click on profile to chate or ",style: TextStyle( color: Color.fromARGB(255, 100, 99, 99), ),),
                     const Text("find more people",style: TextStyle(     color: Color.fromARGB(255, 100, 99, 99), ),),
                      InkWell(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder:(context)=>UserDashboard()));
              },
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
            )
        ],
      ),
    ),);
  }
}