// 
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:untitled/Screens/Dashboard.dart';
import 'package:video_player/video_player.dart';
import 'Screens/Login.dart';
   bool _isRadioButtontapped=false;
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Cameo';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      debugShowCheckedModeBanner: false,
      title: _title,

      home: Scaffold(
       resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        // appBar: AppBar(
          
        //   elevation: 0,
        //   backgroundColor: Colors.transparent,
        //   title:const ))),

        body:  const MyWelcome(),
      ),
    );
  }
}



class MyWelcome extends StatefulWidget {
  const MyWelcome({Key? key}) : super(key: key);

  @override
  State<MyWelcome> createState() => _MyWelcomeState();
}



class _MyWelcomeState extends State<MyWelcome> {

 
 final  TextEditingController emailController = TextEditingController();
 final TextEditingController passwordController =TextEditingController();

  bool istimerText =false;
late  VideoPlayerController _controller;

delayFunction() async{
  await Future.delayed(Duration(milliseconds: 1000),(){
    setState(() {
      istimerText=true;
    });
  });
}
 

@override
  void initState() {
    
    _controller=VideoPlayerController.asset("Assets/Images/ade.mp4",
    )
    
    ..initialize().then((_){
  
      _controller.setLooping(true);
      setState(() {
        
      });

      _controller.addListener(() {
      setState(() {});
    });
    });
    delayFunction();
    super.initState();
  
  }

 @override
  void dispose() {
    _controller.pause();
      _controller.dispose();
     
    super.dispose();
  }
Widget fullScreenVideo({required Widget child, required double deviceheight,required double devicewidth}){
    
    return FittedBox(
      fit: BoxFit.cover,
      
      child: SizedBox(width:devicewidth,height: deviceheight,child: child),

    );  
}
bool volumeState =false;
  @override
  Widget build(BuildContext context) {
     final double deviceheight =MediaQuery.of(context).size.height;
     final double devicewidth =MediaQuery.of(context).size.width;
    return Container(
   
      child: Stack(

        children: [ 
         Positioned(
        
           child: SizedBox(
            width:devicewidth,
             height: deviceheight,
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: fullScreenVideo (
                child: VideoPlayer(_controller),deviceheight: devicewidth,devicewidth: devicewidth))),
         ),


              Positioned(
            top: deviceheight/12,
            left: devicewidth/3+50,

            child: const Center(child:  Text("Cameo",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)))),

          Container(margin: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
            
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                 Padding(
                   padding: const EdgeInsets.only(bottom:18.0),
                   child: Align(
                    
                    alignment: Alignment.bottomLeft,
                     child: FloatingActionButton(
                      backgroundColor: Color.fromARGB(255, 31, 30, 30).withOpacity(0.5),
                                 onPressed: (){
                      volumeState=!volumeState;
                      if(volumeState){
                        _controller.play();
                        _controller.setVolume(1.0);
                      }else{
                        _controller.setVolume(0.0);
                      }
                                 },
                                 child: !volumeState? Icon(Icons.volume_off):Icon(Icons.volume_up),
                               ),
                   ),
                 ),
               SizedBox(
               
                child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   signup_and_Login_Button(context,"Login"), signup_and_Login_Button(context,"Signup")
                ],),
               ),
            
            
              const  Padding(
                 padding: EdgeInsets.only(top:38.0,bottom: 18.0),
                 child: Center(
                  child: Text("VIP invite",style: TextStyle(fontSize: 15,color: Colors.white),),
                 ),
               )
            
              ],
            ),
          ),
        ],
      ),
    );
  }

   Widget signup_and_Login_Button(BuildContext context,String title){

    return Container(
        width: 120,
            decoration: BoxDecoration(
              
                color: Color.fromARGB(255, 132, 84, 209),
              borderRadius: BorderRadius.circular(25)
            ),
          
            child: MaterialButton(
              
              child:  Text(title,style: const TextStyle(color: Colors.white,),),

              //when each of the button is clicked, the bottom sheet showe appear

              onPressed: () {

                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                      
                      //THIS PART CONTAINS THE INFROMATION THAT IS TO BE DISPLAYED IN THE  BOTTOM SHEET 

                    return Container(
                    
                      color: Colors.black,
                      child: Center(
                      
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                        
                          children: <Widget>[
                              Align(
                                
                                alignment: Alignment.topRight,
                                child: IconButton( color:Colors.white,icon:  const Icon(Icons.close),

                                onPressed: () => Navigator.of(context).pop(),),
                              ),


                 const Padding(
                    padding:  EdgeInsets.all(18.0),
                    child:   Center(

                      child: Text("Log in with",

                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                      
                      ),),),
                  ),


                Container(
                  margin:const EdgeInsets.only(left: 5,right: 5),

                  decoration: BoxDecoration(
                        color: Colors.blueAccent,

                    borderRadius: BorderRadius.circular(10)),
                  width: double.infinity,
            
                  child: MaterialButton(
                    onPressed: (){},
                    child: const Text("Continue with Facebook",

                    style: TextStyle(color: Colors.white),),)),

                //THIS IS FOR SIGNING THROUGH USING EMAIL

                           InkWell(
                             onTap: () {
                            Navigator.of(context).pop();

                            showModalBottomSheet(
                              isScrollControlled: true,
                              shape:const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(22)
                                )
                              ),
                              context: context, builder: ((context) => showloginORSignupBottomSheet(context,title)));
                            },

                             child: const Padding(
                               padding:  EdgeInsets.all(28.0),

                               child: Center(
                                 child: Text("Continue with email",style: TextStyle(color:Colors.white),),
                               ),
                             ),
                           )   
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
  }



 Widget showloginORSignupBottomSheet(BuildContext context,String type){

   return DraggableScrollableSheet(
    initialChildSize: 1,

     builder: (_,controller)=> Container(

        color: Colors.black,

        child: ListView(
          controller: controller,

          children: [
            
              if(type=="Signup")
               const SizedBox(height: 70,)

,             if(type=="Login")
              Padding(
                padding: const EdgeInsets.only(top:8.0,right: 18.0),
                
                child: Align(
                                    
                 alignment: Alignment.topRight,

                child: IconButton( color:Colors.white,
                icon:  const Icon(Icons.close),

                onPressed: () => Navigator.of(context).pop(),),
                                  ),
              ),

             
          // THIS PART IS FOR LOGIN FORM


          type=="Login"?
          SizedBox(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

              const  Align(
                   alignment: Alignment.topLeft,
                  child:   Padding(
                    padding: EdgeInsets.only(left:18.0,bottom: 15),

                    child: Text("Cameo",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                  ),
                ),

               const  Align(
                   alignment: Alignment.topLeft,
                  child:   Padding(

                    padding: EdgeInsets.only(left:18.0,bottom: 50),
                    child: Text("Welcome Back",
                    
                    style: TextStyle(
                      color: Colors.white,
                      
                      fontSize: 25,fontWeight: FontWeight.bold),),
                  ),
                ),


              inputLoginOrSignupcredentials(context, emailController, false,"Email",true),

                 const Divider(height: 20,),

              inputLoginOrSignupcredentials(context, passwordController, true,"Password",true),

               const  Align(
                   alignment: Alignment.topLeft,

                  child:   Padding(
                    padding: EdgeInsets.only(left:18.0,bottom: 20,top: 10),
                    child: Text("Forgot Passsword?b ",
                    
                    style: TextStyle(color:Color.fromARGB(255, 17, 179, 190),fontSize: 15,),),
                  )),

            Container(

            margin:const  EdgeInsets.only(left: 20,top: 160,right: 20),
            width: double.infinity,

            decoration: BoxDecoration(
              color:Colors.pink,
              borderRadius: BorderRadius.circular(15)),
            
            child: MaterialButton(onPressed: (){},child: const Text("Next",style: TextStyle(color: Colors.white)))),

           const  Padding(
               padding:  EdgeInsets.only(top:22.0,left: 18),
               
               child: Text("By signing up you agree to Cameo's",
               
               style: TextStyle(color:Color.fromARGB(255, 104, 103, 103),fontSize: 15)),

             ),

              Padding(
                padding: const EdgeInsets.only(left:18.0),
                child: Row(children: const [

            Text("terms of service",   style: TextStyle(color:Color.fromARGB(255, 17, 179, 190),fontSize: 15,),),

            Text("  including",     style: TextStyle(color:Color.fromARGB(255, 104, 103, 103),fontSize: 15,),),

            Text(" additional terms,",  style: TextStyle(color:Color.fromARGB(255, 17, 179, 190)),),

             Text("  and",  style: TextStyle(color:Color.fromARGB(255, 104, 103, 103),fontSize: 15,),),

                ],),
              ),

            const Padding(
               padding:  EdgeInsets.only(left:18.0),
               child:  Text("privacy policy",style: TextStyle(color:Color.fromARGB(255, 17, 179, 190))),
                 )
               ]),
               )
          
          : SizedBox(
            
            child: Column(children: [
                 const  Align(
                   alignment: Alignment.topLeft,
                  child:   Padding(
                    padding: EdgeInsets.only(left:18.0,bottom: 20),
                    child: Text("Cameo",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                  ),
                ),
                 
               

            
              //THID IS THE ANIMATION TEXT THAT APPEARS IN THE SIGNUP 
              //BOTTOM SHEET WHEN EVER THE SIGN UP BUTTON IS CLICKED

            istimerText?

               const  Align(
                   alignment: Alignment.topLeft,
                   
                  child:   Padding(
                    padding: EdgeInsets.only(left:18.0,bottom: 20),
                    child: Text("Right this way.",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                  ),
                )
                
                :const  Align(
                   alignment: Alignment.topLeft,

                  child:   Padding(
                    padding: EdgeInsets.only(left:18.0,bottom: 20),

                    child: Text("Right fans.",style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),),
                  ),
                ),


                   const Center(
                      child: CircleAvatar(
                        radius: 30,
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.add),
                                ),
                    ),

                   const  Center(child:Padding(

                     padding: EdgeInsets.all(8.0),
                     child: Padding(

                       padding: EdgeInsets.only(bottom:27.0),
                       child: Text("add profile pic",
                       style: TextStyle(color:Color.fromARGB(255, 14, 228, 243)),),
                     ),
                   )),


              inputLoginOrSignupcredentials(context, emailController, false,"Full Name",false),
             inputLoginOrSignupcredentials(context, passwordController, true,"Username",false),
              inputLoginOrSignupcredentials(context, passwordController, true,"Email",false),

               const Divider(height: 5,),



             SizedBox(
              child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,

                children: [
                 Text("Email me exclusive offers and discounts",
                 style:TextStyle(color:!_isRadioButtontapped? Color.fromARGB(255, 7, 227, 243):Colors.pink)),
                
                
                 GestureDetector(
                 
                   child: Container(
                    height: 22,
                    width: 22,

                    child:_isRadioButtontapped? Center(child: Icon(Icons.check,size: 15,)):null,

                    decoration: BoxDecoration(
                      color:!_isRadioButtontapped? Colors.black:Colors.pink,

                      borderRadius: BorderRadius.circular(29),
                      border: Border.all(color:!_isRadioButtontapped? Color.fromARGB(255, 7, 227, 243):Colors.pink,width: 2)
                      ),
                   ),

                    onTap: (){
                    setState(() {

                      _isRadioButtontapped= !_isRadioButtontapped;

                    });
                   
                  },
                 ),
              ],),
            ),

            const Divider(height: 5,),
               
            Container(
            margin:const  EdgeInsets.only(left: 20,top: 10,right: 20),
            width: double.infinity,

            decoration: BoxDecoration(
              color:Colors.pink,
              borderRadius: BorderRadius.circular(15)),
            
            child: MaterialButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> UserDashboard()));

            },child: const Text("Next",style: TextStyle(color: Colors.white),),)),
             
              
            ]),
          )
          ],
        ),
      ),
   );
  }

 


   Widget inputLoginOrSignupcredentials(BuildContext context,TextEditingController controller,bool password,String lable,bool islogin){

  return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        
          Padding(
            padding: islogin? const EdgeInsets.only(left:18.0):const EdgeInsets.only(left: 18.0,top: 18.0),
            child: Text(lable,style:const TextStyle(color: Colors.white),),
          ),

         
          Container(

      height: 58,
      margin: const EdgeInsets.only(left: 15,right: 15 ,bottom: 15,top:5),

      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),

        border: Border.all(
          color: islogin? const Color.fromARGB(255, 104, 103, 103).withOpacity(0.6):Colors.white,
        )
      ),
            child: TextFormField(
              
              obscureText: password,
              controller: controller,
              decoration: InputDecoration(
               focusColor: Colors.white,
            
             
              border: OutlineInputBorder(
               
                borderRadius: BorderRadius.circular(12),

                
                )
            ),
    ),
          ),
        ],
      );
  }
}
