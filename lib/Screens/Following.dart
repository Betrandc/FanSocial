import 'package:flutter/material.dart';

class Following extends StatelessWidget {
  const Following({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double deviceheight =MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        //  crossAxisAlignment: CrossAxisAlignment.center,
        
        children:[

                 

                 Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SizedBox(
                    child: Row(
                      
                      children: [
                        Text("Following",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 27),),
                       
                      ],
                    ),
                  ),
                ),
                   
                   
                   
                    SizedBox(
                      height: deviceheight/5,
                    ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Center(
                      child: Image.asset("Assets/Images/add_follow.png",width: 50,color: Color.fromARGB(255, 104, 103, 103).withOpacity(0.4),),
                  ),
                    
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
                )
        ],
      ),
    );
  }
}