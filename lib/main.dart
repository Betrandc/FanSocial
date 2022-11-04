// 
import 'dart:async';
// import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/Screens/Dashboard.dart';
import 'package:untitled/Screens/Vipviste.dart';
import 'package:untitled/Screens/signup.dart';
import 'package:video_player/video_player.dart';
import 'Screens/Invite_vip.dart';
import 'Screens/Login.dart';
   
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Cameo';

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(

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
  //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (Context)=>MyWelcome()));
  Get.off(MyWelcome());
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



class _MyWelcomeState extends State<MyWelcome>  {

 
 final  TextEditingController emailController = TextEditingController();
 final TextEditingController passwordController =TextEditingController();
  final TextEditingController fullnameController =TextEditingController();

  bool _isLoginButtonClicked=false;
  bool _isSignupButtonClicked =false;
  bool isplaying =true;
late  VideoPlayerController _controller;

@override
  void initState() {
  
_controller=VideoPlayerController.asset("Assets/Images/ade.mp4",
    )
    
    ..initialize().then((_){
       if(!isplaying){
         _controller.play();
        _controller.setVolume(0.0);
      _controller.    setLooping(true);
      
       }
    
      _controller.addListener(() {
      setState(() {});
    });
    });
    // delayFunction();
    super.initState();
  
  }


  
Widget fullScreenVideo({required Widget child, required double deviceheight,required double devicewidth}){
    
    
    return FittedBox(
      fit: BoxFit.cover,
      
      child: SizedBox(width:devicewidth,height: deviceheight,child: child),

    );  
}
bool volumeState =false;
bool _isRadioButtontapped=false;
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
            child: isplaying? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: fullScreenVideo (
                child: VideoPlayer(_controller),deviceheight: devicewidth,devicewidth: devicewidth)):Text(""))
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
                                     setState(() {
                                       volumeState=!volumeState;
                                     });
                                 },
                       child: volumeState? 
                       Image.asset("Assets/Images/volume_up.png",width: 20,color: Colors.white,)
                       :Image.asset("Assets/Images/volume_down.png",width: 20,color: Colors.white,),
                               ),
                   ),
                 ),
               SizedBox(
               
                child: Row(
                mainAxisSize: MainAxisSize.max,
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   Login_Button(), signupButton()
                ],),
               ),
            
            
              const  Padding(
                 padding: EdgeInsets.only(top:50.0,bottom: 28.0),
                 child: Center(
                  child: Text("Talent sign up",
                  style: TextStyle(fontSize: 15,
                  color: 
                  Colors.white,
                  decoration: TextDecoration.underline,
                  decorationStyle:TextDecorationStyle.solid,
                  decorationColor: Colors.white),),
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
    // WidgetsBinding.instance.removeObserver(this);
  }




   Widget Login_Button(){

    return Container(
        width: 130,
            decoration: BoxDecoration(
              
                color: !_isLoginButtonClicked?Color(0xFF8036e1):Color(0xFF8036e1).withOpacity(0.3),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color:_isLoginButtonClicked?Color(0xFF8036e1):Colors.transparent,
              )
            ),
          
            child: MaterialButton(
              
              child:  Text("Log in",style: const TextStyle(color: Colors.white,fontWeight:FontWeight.bold),),

              //when each of the button is clicked, the bottom sheet showe appear

              onPressed: () {
                setState(() {
                  _isLoginButtonClicked=!_isLoginButtonClicked;

                    Future.delayed(Duration(seconds: 1),(){
                          setState(() {
                            _isLoginButtonClicked=false;
                          });
                      });
                });
                 Future.delayed(Duration(microseconds: 3000),(){
                   bottomSheetFuntion( "Log in");
                 });
                // Get.to(Login());
              }
            ),
          );
  }


Widget signupButton(){

    return Container(
        width: 130,
            decoration: BoxDecoration(
              
                color: !_isSignupButtonClicked?Color(0xFF8036e1):Color(0xFF8036e1).withOpacity(0.3),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color:_isSignupButtonClicked?Color(0xFF8036e1):Colors.transparent,
              )
            ),
          
            child: MaterialButton(
              
              child:  Text("Sign up",style: const TextStyle(color: Colors.white,fontWeight:FontWeight.bold),),

              //when each of the button is clicked, the bottom sheet showe appear

              onPressed: () {
                setState(() {
                  _isSignupButtonClicked=!_isSignupButtonClicked;
               
                });


                Future.delayed(Duration(seconds: 1),(){
      setState(() {
          _isSignupButtonClicked=!_isSignupButtonClicked;
      });
                      });
               
               Future.delayed(Duration(
                microseconds: 3000
               ),(){
                 bottomSheetFuntion( "Sign up");
               });

            
              
             // Get.to(Signup());
              }
            ),
          );
  }
  
   bottomSheetFuntion( String title){
      Get.bottomSheet(
                Container(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: EdgeInsets.only(right: 20,top: 12),
                         decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                           color:Color.fromARGB(255, 104, 103, 103).withOpacity(0.5) ,
                         ),
                          
                          child: IconButton(icon: Icon(Icons.close,size: 25, color: Colors.white,),onPressed: (){
                            Get.back();
                          },),
                        ),
                      ),
                      Center(child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("${title} with",style: TextStyle(color: Colors.white,fontSize: 15)),
                      ),),
                          Container(

                            width: double.infinity,
                            color: Colors.blue,
                            child: MaterialButton(onPressed: (){},child: Text("Continue With Facebook",
                            style: TextStyle(color: Colors.white,fontSize: 15),),),
                          ),

                          Center(
                            child: TextButton(child: Text("Continue with email"),onPressed: (){
                            title=="Log in"?Get.to(Login()):Get.to(Signup());
                            },),
                          ),
                          if(title=="Sign up")
                          Center(
                            child: TextButton(child: Text("VIP visit"),onPressed: (){
                              Get.to(VIPVisit());
                            },),
                          )
                    ],
                  ),
                ),
                 backgroundColor: Colors.black,
           );
  }
}
