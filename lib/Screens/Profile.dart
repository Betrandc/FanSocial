import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Screens/Dashboard.dart';
import 'package:untitled/Screens/ItemsPage.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  
  bool _showBottomIndicator= false;
  @override
  Widget build(BuildContext context) {
    final double devicewidth =MediaQuery.of(context).size.width;
    return SafeArea(
          child: Scaffold(
           backgroundColor: Colors.black,

            body: SingleChildScrollView(
              
              child: Column(
                 mainAxisAlignment:MainAxisAlignment.start,
              children: [
            
            
            
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:const [
                            Text("Profile",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 27),),
                            Icon(Icons.settings,color: Colors.white,),
                          ],
                        ),
                      ),
                    ),
            
                    
            
                      VerticalScrollingItems(devicewidth),
                             
            
                      ]),
            ),
                  ),
);}




  Widget VerticalScrollingItems( devicewidth){
      return SingleChildScrollView(
        
                    child: Column(
                      children:  [
                         Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: Color.fromARGB(255, 104, 103, 103).withOpacity(0.7),
                            )
                          ),
                           child: CircleAvatar(
                            backgroundColor: Colors.black,
                            
                        radius: 40,
                            child: Image.asset("Assets/Images/fansocialreal.png",width: 40,),
                        ),
                         ),

                      const Padding(
                         padding: const EdgeInsets.only(top:8.0),
                         child: const Text("Jeam Marie",style: TextStyle(color: Colors.white),),
                       ),
                       const Text("@jean",style: TextStyle(color: Colors.white),),

                               Align(
                                 alignment: Alignment.center,
                                 child: Container(
                                   margin: EdgeInsets.only(top: devicewidth/5,bottom: 15),
                                                   child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                     Container(
                                                      width: 35,
                                                      height: 35,
                                                       decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(12),
                                                        border: Border.all(color:Color.fromARGB(255, 104, 103, 103)),
                                                        ),
                                                       child: Padding(
                                                         padding: const EdgeInsets.all(6.0),
                                                         child: Image.asset("Assets/Images/users.png",color: Colors.white, ),
                                                       ),
                                                     ),
                               
                               
                                                   Container(
                                                      margin: EdgeInsets.only(left:12),
                                                      width: devicewidth-(devicewidth/5),
                                                     decoration: BoxDecoration(
                                                      color:Color(0xFF8036e1),
                                                       borderRadius: BorderRadius.circular(19)),
                                                     child: MaterialButton(onPressed: (){},
                                                     child:const Text(
                                                       "Edit Profile",
                                                     style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.white),),),
                                                   )
                                                   ]),
                                                 ),
                               ),



                      InkWell(
                        onTap: (){
                           navigationFunction(context,UserDashboard());
                        },
                        child: yourVideoOrders()),

                      Container(
                        width: devicewidth,
                        height: 1,
                        color: Color.fromARGB(255, 104, 103, 103),
                      ),



                        Padding(
                          padding: const EdgeInsets.only(left:18.0,right: 18.0,bottom: 10,top: 25),
                          child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                    
                         GestureDetector(
                          behavior:
                             HitTestBehavior.opaque,
                          onTap: (){
                             setState(() {
                                _showBottomIndicator=false;
                             });
                          },
                          child:  Text("Public",style: TextStyle(
                            color:!_showBottomIndicator? Colors.white:Color.fromARGB(255, 104, 103, 103),
                            fontWeight: FontWeight.bold),)),

                         GestureDetector(
                          behavior:
                               HitTestBehavior.opaque,
                          onTap: (){
                           setState(() {
                              _showBottomIndicator=!_showBottomIndicator;
                           });
                          },
                           child: Padding(
                             padding: const EdgeInsets.only(left:18.0),
                             child: Row(
                              children:[
                                Icon(Icons.lock_outline,color:_showBottomIndicator? Colors.white:Color.fromARGB(255, 104, 103, 103),),
                                 Text("Private",style: TextStyle(color:_showBottomIndicator? Colors.white:const Color.fromARGB(255, 104, 103, 103),fontWeight: FontWeight.bold)),
                         
                              ],
                             ),
                           ),
                         ),

                          ])),
                        ),


                            !_showBottomIndicator?  Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                                    width: devicewidth/2,
                                                    height: 1,
                                                    color: Color.fromARGB(255, 104, 103, 103),
                                                  ),
                            ):Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                                    width: devicewidth/2,
                                                    height: 1,
                                                    color: Color.fromARGB(255, 104, 103, 103),
                                                  ),
                            ),




                    !_showBottomIndicator?   
                     SizedBox(
                          width: devicewidth,
                          height: 90,
                          child: Card(
                             color: Color.fromARGB(255, 36, 35, 35), 
                            child: Column(
                              children:const [
                                Padding(
                                  padding: EdgeInsets.only(top:8.0),
                                  child: Center(
                                    child: Text(
                                      "Your public Videos"
                                       ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                 Padding(
                                   padding: EdgeInsets.only(left:18.0),
                                   child: Text(
                                    "These videos are public for  everyone to see on your profile."
                                ,style: TextStyle(color: Colors.white),),
                                 ),
                              ],
                              
                            ),
                          ),
                        ): SizedBox(
                          width: devicewidth,
                          height: 90,
                          child: Card(
                             color: Color.fromARGB(255, 36, 35, 35), 
                            child: Column(
                              children:const [
                                Padding(
                                  padding: EdgeInsets.only(top:8.0),
                                  child: Center(
                                    child: Text(
                                      "Your private Videos"
                                       ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                 Text(
                                  "These videos are private and can only be seen by you."
                                ,style: TextStyle(color: Colors.white),),
                              ],
                              
                            ),
                          )),
                        
                          InkWell(
                            onTap: (){
                                navigationFunction(context,UserDashboard());
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: SizedBox(
                                  width: devicewidth/2,
                                  height: 190,
                                  child: Card(
                                    shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(9)),
                                     color: Color.fromARGB(255, 36, 35, 35), 
                                    child: Icon(Icons.add,color: Colors.white,size: 30,),
                                  ),
                                ),
                              ),
                            ),
                          )

                      ],
                    ),
                  );
  }
  
 Widget yourVideoOrders() {
    return   Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Container(
                       
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                          child:Row(
                            children:  [
                              Image.asset("Assets/Images/videoplay.png",width: 20,color: Colors.white ,),
                              Padding(
                                padding: EdgeInsets.only(left:8.0),
                                child: Text("Your Orders",style: TextStyle(color: Colors.white),),
                              )
                            ],
                          )),
                    const Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,),
                          ])),
                        );
  }

  navigationFunction(BuildContext context, Widget PageName) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => PageName));
  }

}