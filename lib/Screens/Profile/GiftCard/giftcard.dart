import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/state_manager.dart';

class GiftCard extends StatelessWidget {
  const GiftCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
         backgroundColor: Colors.black,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_new_outlined),onPressed: (){},),
        title: Center(
          child: Text("Buy a FanSocial Gift Card"),
        ),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                   height: 30,
                   margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                       color:Color.fromARGB(255, 104, 103, 103),
                    ),
                    child: MaterialButton(
                      onPressed: (){},
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back_ios_new_outlined),
                          Text("Back")
                        ],
                      ),
                    ),
                  ),
                  Container(
                      height: 30,
                   margin: EdgeInsets.only(right: 10),
                       decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.white
                        ),
                      borderRadius: BorderRadius.circular(25),
                       
                    ),
                    child: MaterialButton(onPressed: (){},
                    child: Text("Redeem a card",style: TextStyle(color: Colors.white),),),
                  )
                ],
              ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left:18.0,top: 10),
                child: Text(
                  """Give the gift of
FanSocial.""",style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.bold)),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left:18.0),
                child: Text("Buy a gift card.",
                style: TextStyle(color: Colors.cyan,fontSize: 28,fontWeight: FontWeight.bold)),
              ),
            ),
            Container(
              color:Color.fromARGB(255, 37, 36, 36),
              margin: EdgeInsets.only(top: 100),
              height: 260,
              width: double.infinity,
              child: Stack(children: [
                Positioned(
                  bottom: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Customize your gift card"
                        ,style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.white),),
                      ),
                      //  Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Text("
                      //   "
                      //   ,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
                      // ),
                       Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("""
A FanSocial gift card is the most truly
personalized gift. The recipient will be able to
choose from our selection of over 10k talent
on our platform!"""
                        ,style: TextStyle(fontSize: 15,color: Colors.white38),),
                      ),
                      
                    ],
                  ),
                ),
               
      
              ]),
            ),
            Divider(height: 20,),
           Row(
            // mainAxisAlignment: MainAxisAlignment.,
            children: [
               SizedBox(width: 20,),
               rectangularButton(lable:25,istrue:false),
               SizedBox(width: 10,),
            rectangularButton(lable:75,istrue:false),
             SizedBox(width: 10,),
            rectangularButton(lable:500,istrue:false),
            ],
           ),
           Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(top: 20,left: 20),
              child: rectangularButton(lable:"custom",istrue:true))),

            inputFunction(lable: "Recipient name", hint:"Jean Marie",maxInputLength: false ),
            inputFunction(lable: "Recipient email", hint:"Jean@marie.com",maxInputLength: false ),
            inputFunction(lable: "Gift message",
             hint:"""
I can never keep track of which celebes
you're following these days soo. enjoy
this fun gift for you to get a prosonalized
shoutout from you favorite!
""",maxInputLength: true ),
            inputFunction(lable: "Your name", hint:"Jean@marie.com",maxInputLength: false ),
           
            inputFunction(lable: "Your email", hint:"Jean@marie.com",maxInputLength: false ),
             inputFunction(lable: "Send Date", hint:"11-11-2022",maxInputLength: false ),
           Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 20,right: 20),
            decoration: BoxDecoration(
              color: Color(0xFF8036e1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: MaterialButton(onPressed: (){},child: Text("Continue to payment",
            style:TextStyle(color:Colors.white,fontWeight: FontWeight.bold)),),
           ),
           dropDownFunction()

           
          ],
        ),
      ),
    );
  }

  Widget rectangularButton(  {lable, istrue}){
    return  Container(
                    height: 50,
                    width:istrue? 100:70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1,
                        color: Colors.white38.withOpacity(0.3),
                        
                      ),
                      
                    ),
                    child: Center(child: Text("${lable}XAF",style: TextStyle(color: Colors.white,fontSize: 14),)),
                  );
  }


  Widget inputFunction({lable,hint,  maxInputLength }){
    
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom:14.0,top: 14.0),
              child: Text(lable,style: TextStyle(color: Colors.white),),
            )),
          Container(
            height: maxInputLength?200:50,
            decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1,
                          color: Colors.white38.withOpacity(0.3),
                          
                        ),
                        
                      ),
            child: TextFormField(
              cursorColor: Colors.white,
              cursorHeight: 20,
              cursorWidth: 1,
            
              // maxLength: maxInputLength?null:null ,
              maxLines: maxInputLength?20:null ,
              decoration: InputDecoration(
                suffixIcon:lable=="Send Date"? IconButton(icon: Icon(Icons.close,color: Colors.white,),onPressed: (){},):null,
                fillColor: Colors.white,
                isCollapsed: true,
                contentPadding:EdgeInsets.only(left: 20,top: 10,bottom: 10) ,
                hintText: hint,
                hintStyle: TextStyle(
                  
                  color:Colors.white38.withOpacity(0.3),
                   ),
                border: InputBorder.none
              ),
            ),
          ),
        ],
      ),
    );
  }

Widget dropDownFunction(){
  final Item=["How do I redeem a gift card?","this is the item"];
  return Container(
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: 20),
    child: DropdownButton(
      
      items: Item.map((String value) =>
    DropdownMenuItem(
    
      child: Text(value),value:value,) ).toList(),
      value: "How do I redeem a gift card?",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
      onChanged: (value) {
      value=value;
    },),
  );
}

}