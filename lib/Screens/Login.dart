
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/Screens/Dashboard.dart';
import 'package:untitled/main.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool isinputTapped=false;  
 final  TextEditingController emailController = TextEditingController();
 final TextEditingController passwordController =TextEditingController();
  @override
  Widget build(BuildContext context) {

     final double deviceheight =MediaQuery.of(context).size.height;
     final double devicewidth =MediaQuery.of(context).size.width;
    return SafeArea(

      child: Scaffold(
        resizeToAvoidBottomInset: false,
         backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
              leading: Text(""),
          actions: [
                  Align(
                       alignment: Alignment.topRight,
                      child:   Padding(
                        padding: EdgeInsets.only(left:18.0,bottom: 15,right: 15),
    
                        child: IconButton(onPressed: (){
                          Get.to(MyWelcome());
                        }, icon: Icon(Icons.close)))
                      ),
                    
        ]),
        body:SizedBox(
          height: deviceheight,
         
          child: Column(
             mainAxisAlignment:MainAxisAlignment.end,
            children: [
    
                    SizedBox(
                        // height: deviceheight/,
                        child:SingleChildScrollView( 
                          child: Column(
                            children: [
                                 
                                        const  Align(
                           alignment: Alignment.topLeft,
                          child:   Padding(
                            padding: EdgeInsets.only(left:18.0,bottom: 15),
                        
                            child: Text("FanSocial",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                          ),
                                          ),
                                      
                                 const Align(
                           alignment: Alignment.topLeft,
                          child:   Padding(
                        
                            padding: EdgeInsets.only(left:18.0,bottom: 50),
                            child: Text("Welcome Back",
                            
                            style: TextStyle(
                              color: Colors.white,
                              
                              fontSize: 25,fontWeight: FontWeight.bold),),
                          ),
                                          ),
                        
                                          inputLogincredentials(context, emailController, false,"Email",true),
                        
                                           const Divider(height: 20,),
                        
                                        inputLogincredentials(context, passwordController, true,"Password",true),
                        
                        
                                           const  Align(
                           alignment: Alignment.topLeft,
                        
                          child:   Padding(
                            padding: EdgeInsets.only(left:18.0,bottom: 20,top: 10),
                            child: Text("Forgot Passsword ",
                            
                            style: TextStyle(color:Color.fromARGB(255, 17, 179, 190),fontSize: 15,),),
                          )),
                            ],
                          ),
                        ),
                      ),
    
    
                         Container(
    
                margin:const  EdgeInsets.only(left: 20,top: 160,right: 20),
                width: double.infinity,
    
                decoration: BoxDecoration(
                  color:Color(0xFFb20257),
                  borderRadius: BorderRadius.circular(15)),
                
                child: MaterialButton(
                  
                  onPressed: (){
                    Get.to(UserDashboard());
                  },
                  child: const Text("Next",style: TextStyle(color: Colors.white)))),
    
               const  Padding(
                   padding:  EdgeInsets.only(top:22.0,left: 18),
                   
                   child: Text("By signing up you agree to FanSocial's",
                   
                   style: TextStyle(color:Color.fromARGB(255, 104, 103, 103),fontSize: 12)),
    
                 ),
    
                  Padding(
                    padding: const EdgeInsets.only(left:35.0),
                    child: Row(children: const [
    
                Text("terms of service",   style: TextStyle(color:Color.fromARGB(255, 17, 179, 190),fontSize: 12,),),
    
                Text("  including",     style: TextStyle(color:Color.fromARGB(255, 104, 103, 103),fontSize: 12,),),
    
                Text(" additional terms,",  style: TextStyle(color:Color.fromARGB(255, 17, 179, 190)),),
    
                 Text("  and",  style: TextStyle(color:Color.fromARGB(255, 104, 103, 103),fontSize: 12,),),
    
                    ],),
                  ),
    
                const Padding(
                   padding:  EdgeInsets.only(left:18.0),
                   child:  Text("privacy policy",style: TextStyle(color:Color.fromARGB(255, 17, 179, 190),fontSize: 12)),
                     ),
    
              
            ],
          ),
        )
      ),
    );
  }

  Widget inputLogincredentials(BuildContext context,TextEditingController controller,bool password,String lable,bool islogin){

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
            child: Padding(
              padding: const EdgeInsets.only(left:18.0),
              child: TextFormField(
                cursorColor:Color.fromARGB(255, 17, 179, 190) ,
                
                onTap: (){
                      setState(() {
                        isinputTapped=true;
                        print("INPUT BOX TAPPED THIS IS TO CHECK THE INPUT FIELD");
                      });
                },

                onEditingComplete: (){
                    print("THIS IS LEAVING THE INPUT FILEIIIIKDKDNKND");
                },
                obscureText: password,
                controller: controller,
                decoration: InputDecoration(
                 fillColor: Colors.white,
              
               hintText: "",focusColor: Colors.blue,
                border:  InputBorder.none,
              ),
    ),
            ),
          ),
        ],
      );
  }
}