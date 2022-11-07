import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class VIPVisit extends StatelessWidget {
  const VIPVisit({super.key});

  @override
  Widget build(BuildContext context) {
    // final devicewidth = MediaQuery.of(context).size.width;
    bool _isInputTapped =false;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
    
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top:18.0, left: 17),
                    child: Text("Enter your invite code",style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white)),
                  )),
                    InkWell(
                      onTap: (){
                        
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: _isInputTapped?Colors.white:Color.fromARGB(255, 104, 103, 103),
                          )
                        ),
                        // width: devicewidth - 20,
                        child: TextField(
                          decoration: InputDecoration(
                            
                            border: InputBorder.none
                          ),
                        ),
                      ),
                    ),
                 Row(
                   children: [
                     Padding(
                       padding: const EdgeInsets.only( left: 17),
                       child: Text("Don't have an invite code?",style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                     ),
                     TextButton(onPressed: (){}, child: Text("Apply for one",style: TextStyle(color: Colors.white, decoration: TextDecoration.underline,
                     decorationStyle: TextDecorationStyle.solid ,
                     decorationColor: Colors.white),))
                   ],
                 ),

              ],
            ),
    
    
    
    
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                      Row(
                     children: [
                       Text("By signing up, you agree to FanSocial's ",style:TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 104, 103, 103),)),
                       TextButton(onPressed: (){}, child: Text("terms of service",style: TextStyle(fontSize: 12,color: Color.fromARGB(255, 104, 103, 103),
                       decorationStyle: TextDecorationStyle.solid ,
                       decorationColor: Color.fromARGB(255, 104, 103, 103),),))
                     ],
                   ),
                   Row(
                     children: [
                       Text("including ",style:TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 104, 103, 103))),
                       TextButton(onPressed: (){}, child: Text("additional terms,",style: TextStyle(fontSize: 12,color: Color.fromARGB(255, 104, 103, 103),
                       decorationStyle: TextDecorationStyle.solid ,
                       decorationColor: Colors.white),)),

                        Text("additional  ",style:TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 104, 103, 103),)),
                        TextButton(onPressed: (){}, child: Text("private policy,",style: TextStyle(fontSize: 12,color: Color.fromARGB(255, 104, 103, 103),
                       decorationStyle: TextDecorationStyle.solid ,
                       decorationColor: Colors.white),)),
                     ],
                   ),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),
                    color: Color(0xFF8036e1)
                    
                    
                    ),
                    child: MaterialButton(onPressed: (){},
                    child: Text("Continue",style: TextStyle(color: Colors.white),),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}