// 
import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/Screens/Dashboard.dart';
import 'package:video_player/video_player.dart';
import 'Screens/Invite_vip.dart';
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

        body:  SplashScreen(),
      ),
    );
  }
}
 
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 
  
delayFunction() async{
  await Future.delayed(Duration(milliseconds: 9000),(){
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (Context)=>MyWelcome()));
  });
}

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    delayFunction();
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text("FanSocial",
        style: TextStyle(
          fontFamily: "Gliscor Gothic Regular",
        color: Colors.white,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.none,
        fontSize: 30
        )
      ),
    )));
  }
}


class MyWelcome extends StatefulWidget {
  const MyWelcome({Key? key}) : super(key: key);

  @override
  State<MyWelcome> createState() => _MyWelcomeState();
}



class _MyWelcomeState extends State<MyWelcome> with WidgetsBindingObserver {

 
 final  TextEditingController emailController = TextEditingController();
 final TextEditingController passwordController =TextEditingController();
  final TextEditingController fullnameController =TextEditingController();

  bool isplaying =true;
late  VideoPlayerController _controller;

// delayFunction() async{
//   await Future.delayed(Duration(milliseconds: 9000),(){
//     setState(() {
//       istimerText=true;
//     });
//   });
// }
 

@override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
_controller=VideoPlayerController.asset("Assets/Images/ade.mp4",
    )
    
    ..initialize().then((_){
       if(isplaying){
         _controller.play();
        _controller.setVolume(0.0);
      _controller.    setLooping(true);
      
       }
      // setState(() {
        
      // });

      _controller.addListener(() {
      setState(() {});
    });
    });
    // delayFunction();
    super.initState();
  
  }


@override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);

    if(state== AppLifecycleState.paused){
      _controller.pause();

      isplaying=false;
      print(" THIS IS NOW THE PAUSE STATE OF THE APPLICATION");
    }
   else if(state==AppLifecycleState.resumed){
      isplaying=true;
      _controller.play();
      print(" this is  the resume state fo the application");
    }
    else if(state==AppLifecycleState.detached){
      _controller.pause();

      isplaying=false;
      print("this is the detached state fo the application");
    }
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
            top: 25,
            left: devicewidth/3+7,
            // right:devicewidth/3+50 ,

            child: Center(child: Text("FanSocial",
            style: TextStyle(
              fontFamily: "Gliscor Gothic Regular",
              color: Colors.white,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
              fontSize: 35
              )))),

          Container(
            
            margin: const EdgeInsets.symmetric(horizontal: 30),
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
                                     _controller.setVolume(1);
                                 },
                                 child: volumeState? Image.asset("Assets/Images/volume_up.png",width: 20,color: Colors.white,):Image.asset("Assets/Images/volume_down.png",width: 20,color: Colors.white,),
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
                  child: Text("Talent sign up",
                  style: TextStyle(fontSize: 15,
                  color: Colors.white,decoration: TextDecoration.underline),),
                 ),
               )])),
        ],
      ),
    );
  }

 @override
  void dispose() {
    _controller.pause();
      _controller.dispose();
     
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }
   Widget signup_and_Login_Button(BuildContext context,String title){

    return Container(
        width: 120,
            decoration: BoxDecoration(
              
                color: Color(0xFF8036e1),
              borderRadius: BorderRadius.circular(25)
            ),
          
            child: MaterialButton(
              
              child:  Text(title,style: const TextStyle(color: Colors.white,),),

              //when each of the button is clicked, the bottom sheet showe appear

              onPressed: () {
                    
                    _controller.setVolume(0.0);
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
                              isDismissible: true,
                              enableDrag: false,
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
                           ),

                           // THI S IF FRO THE VIP TEXT ON THE BOTTOM SHEET FOR SIGN UP FUNCTION
                           

                           InkWell(
                            onTap:(){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>INVITe_VIP()));
                            },

                              child:Text("VIP INVITE")
                           ),
                     
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

                    child: Text("FanSocial",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
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
              color:Color(0xFFb20257),
              borderRadius: BorderRadius.circular(15)),
            
            child: MaterialButton(onPressed: (){},child: const Text("Next",style: TextStyle(color: Colors.white)))),

           const  Padding(
               padding:  EdgeInsets.only(top:22.0,left: 18),
               
               child: Text("By signing up you agree to FanSocial's",
               
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
                    child: Text("FanSocial",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                  ),
                ),
                 
               

            
              //THID IS THE ANIMATION TEXT THAT APPEARS IN THE SIGNUP 
              //BOTTOM SHEET WHEN EVER THE SIGN UP BUTTON IS CLICKED
                  Align(
                    alignment: Alignment.topLeft,
                    child: AnimatedTextKit(
                                animatedTexts: [
                                 
                                 RotateAnimatedText(
                       """The best fan 
                    experience on earth""",
                    textStyle: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
                                 

                                 
                                ],
                                
                                totalRepeatCount: 2,
                                pause: const Duration(milliseconds: 1000),
                                displayFullTextOnTap: false,
                                stopPauseOnTap: false,
                              ),
                  ),

                   Text("Right this way",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
                                      
                 

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


              inputLoginOrSignupcredentials(context, fullnameController, false,"Full Name",false),
              inputLoginOrSignupcredentials(context, passwordController, true,"Username",false),
              inputLoginOrSignupcredentials(context, emailController, true,"Email",false),

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
        color: Color.fromARGB(255, 104, 103, 103)
      )

        // border: Border.all(
        //   color: islogin? const Color.fromARGB(255, 104, 103, 103).withOpacity(0.6):Colors.white,
        // )
      ),
            child: TextFormField(
              
              obscureText: password,
              controller: controller,
              decoration: InputDecoration(
               fillColor: Colors.white,
            
             
              border:  InputBorder.none,
            ),
    ),
          ),
        ],
      );
  }
}
