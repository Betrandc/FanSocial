import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: Text(""),
        backgroundColor: Colors.black,
        title: Center(child: Text("Change Password",style: TextStyle(fontSize: 15),)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(padding: EdgeInsets.only(left:20.0,top: 15),
              child: Text("New password",style: TextStyle(color:Colors.white)),
              ),
            ),
            Container(
              height: 60,
              margin: EdgeInsets.only(left:20, right: 20, bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color:Color.fromARGB(255, 104, 103, 103),
                  
                )
              ),
              child: TextFormField(
               decoration: InputDecoration(
                 contentPadding: EdgeInsets.only(left: 20),
                 border: InputBorder.none,
                hintText: "New password",
                hintStyle: TextStyle(color:Colors.white)),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(padding: EdgeInsets.only(left:20.0,top: 15),
              child: Text("Retype new password",style: TextStyle(color:Colors.white),),
              ),
            ),
             Container(
              height: 60,
              margin: EdgeInsets.symmetric(horizontal:20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color:Color.fromARGB(255, 104, 103, 103),
                  
                )
              ),
              child: TextFormField(
                cursorColor: Colors.green,
                showCursor: false,
                
               decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 20),
                
                border: InputBorder.none,
                hintText: "Retype new password",

                hintStyle: TextStyle(color:Colors.white)),
              ),
            ),
            
                
            ],
          ),

          Container(
            margin:EdgeInsets.only(bottom: 20,left: 20,right: 20),
            height: 55,
            width: double.infinity,
           
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
             color: Color.fromARGB(255, 221, 5, 77),
            
            ),
            child: MaterialButton(onPressed: (){},
            child: Text("Save",style: TextStyle(color: Colors.white),),
            ),
          )
        ],
      ),
    );
  }
}