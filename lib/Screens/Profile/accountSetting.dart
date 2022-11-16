import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:untitled/Screens/Profile/GiftCard/giftcard.dart';
import 'package:untitled/main.dart';


import 'ChangePassword.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
        onPressed:(){
          Get.back();
        },
        icon:Icon(Icons.arrow_back_ios_outlined,size: 17,)),
          title: Center(child: Text("Account Settings",style: TextStyle(fontWeight: FontWeight.normal),)),
      ),
      backgroundColor: Colors.black,
      body: ListView(
        children: [
            individualItems(Icons.card_giftcard, "Gift cards",GiftCard()),
            individualItems(Icons.videocam_outlined, "All Orders",ChangePassword()),
            individualItems(Icons.notifications_outlined, "Notifications",ChangePassword()),
            individualItems(Icons.camera_alt_outlined, "Video setting",ChangePassword()),
            individualItems(Icons.email_outlined, "Change email",ChangePassword()),
            individualItems(Icons.lock_outline, "Change password",ChangePassword()),
           individualItems(Icons.privacy_tip_outlined, "Security and privacy",ChangePassword()),
            individualItems(Icons.star_border_outlined, "Got an invite code?",ChangePassword()),
            individualItems(Icons.book_outlined, "Terms of service",ChangePassword()),
            individualItems(Icons.accessibility_new_outlined, "Accessibility",ChangePassword()),
            individualItems(Icons.question_mark_rounded, "FAQs",ChangePassword()),
            individualItems(Icons.logout_outlined, "Log Out",MyWelcome()),


            Padding(

              padding: const EdgeInsets.symmetric( vertical:40.0),
              child: Center(
                child: Text("133.3.0",style: TextStyle(color: Colors.white),),
              ),
            )
           
        ],
      ),
    );
  }

  Widget individualItems(IconData icon, String text, Widget page){
      return  InkWell(
        onTap:(){
          Get.to(page);
        },
        child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 104, 103, 103).withOpacity(0.4),
                  )
                ),
                child: ListTile(
                  
                  leading: Icon(icon,color: Colors.white,),
                  title: Text(text,style: TextStyle(color: Colors.white),),
                  trailing: Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,size: 17,),
                  
                ),
              ),
      );
  }

}