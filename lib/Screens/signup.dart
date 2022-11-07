// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/Screens/Dashboard.dart';
import 'package:untitled/main.dart';
class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {


 final  TextEditingController emailController = TextEditingController();
 final TextEditingController passwordController =TextEditingController();
  final TextEditingController fullnameController =TextEditingController();
  bool _isRadioButtontapped=false;

  @override
  Widget build(BuildContext context) {
        final double deviceheight =MediaQuery.of(context).size.height;
     final double devicewidth =MediaQuery.of(context).size.width;
    return  SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: SizedBox(
          height: deviceheight,
          child: Column(
          
      
                children: [
                  
      //               if(type=="Signup")
      //                const SizedBox(height: 70,)
      
      // ,             if(type=="Login")
                    Padding(
                      padding: const EdgeInsets.only(top:8.0,right: 18.0),
                      
                      child: Align(
                                          
                       alignment: Alignment.topRight,
      
                      child: IconButton( color:Colors.white,
                      icon:  const Icon(Icons.close),
      
                      onPressed: () =>Get.to(MyWelcome())),
                                        ),
                    ),
      
                   
                // THIS PART IS FOR LOGIN FORM
      
      
                // type=="Login"?
               
                
                 SizedBox(
                  
                  child: Column(children: [
                       const  Align(
                         alignment: Alignment.topLeft,
                        child:   Padding(
                          padding: EdgeInsets.only(left:18.0,bottom: 10),
                          child: Text("FanSocial",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                        ),
                      ),
                       
                     
      
                  
                    //THID IS THE ANIMATION TEXT THAT APPEARS IN THE SIGNUP 
                    //BOTTOM SHEET WHEN EVER THE SIGN UP BUTTON IS CLICKED
                       
      
                         Padding(
                           padding: const EdgeInsets.only(left:18.0,bottom: 2),
                           child: Align(
                            alignment: Alignment.topLeft,
                            child: Text("Right this way",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold))),
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
      
      
                    inputSignupcredentials(context, fullnameController, false,"Full Name",false),
                    inputSignupcredentials(context, passwordController, true,"Username",false),
                    inputSignupcredentials(context, emailController, true,"Email",false),
      
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
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> UserDashboard()));
                      Get.to(UserDashboard());
      
                  },child: const Text("Next",style: TextStyle(color: Colors.white),),)),
                   
                    
                  ]),
                )
                ],
              ),
        ),
      ),
    );
  }

  Widget inputSignupcredentials(BuildContext context,TextEditingController controller,bool password,String lable,bool islogin){

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