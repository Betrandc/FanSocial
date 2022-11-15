

import 'package:flutter/material.dart';
import 'package:untitled/Screens/Inbox/ChatPage.dart';
import 'package:untitled/Screens/Follow/Following.dart';
import 'package:untitled/Screens/Browse/ItemsPage.dart';
import 'package:untitled/Screens/Profile/Profile.dart';
import 'package:untitled/Screens/Browse/Search_items.dart';

import './Bottomnavigator.dart';


class UserDashboard extends StatelessWidget {
  UserDashboard({
    Key? key,
  }) : super(key: key);
bool _isInputTapped =false;

 void setIsInputTapped(value){
    _isInputTapped=value;
                             }

  List pages =  [
ItemsList(),
Inbox(),
Following(),
Profile(),


  ];
  // List pageTitle = const ["Browse", "Inbox", "Following","Profile"];

  final ValueNotifier<int> pageindex = ValueNotifier(0);
  final ValueNotifier<String> titlepage = ValueNotifier("Browse");

  void pagenameHandler(index) {
    // titlepage.value = pageTitle[index];
    pageindex.value = index;
  }



  @override
  Widget build(BuildContext context) {
    final double deviceheight =MediaQuery.of(context).size.height;
     final double devicewidth =MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: InkWell(
          onTap: (){},
          child: Column(
              
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
            children: [
              
           
          Column(
            children: [

                    // !_isInputTapped?
                  SafeArea(
                child: SizedBox(
                   height: deviceheight-(deviceheight/7),
                        width: devicewidth,
                  child: ValueListenableBuilder(
                    valueListenable: pageindex,
                    builder: (context, int value, _) {
                      return pages[value];
                    },
                  ),
                ),
              )
              // :ValueListenableBuilder(
              //       valueListenable: pageindex,
              //       builder: (context, int value, _) {
              //         return Search_Single_Item();
              //       },
              //     ),,
            ],
          ),
        
       
            
            ],
          ),
        ), 
        bottomNavigationBar:           BottomNavigation(
               
          onItemsSelected: (i) {
          pageindex.value = i;
          pagenameHandler(i);
          }),
      ),
    );
  }
}

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key, required this.onItemsSelected})
      : super(key: key);
  final ValueChanged<int> onItemsSelected;

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  var selectedIndex = 0;
bool _isfavouriteTap= false;

  void handleItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemsSelected(index);
  }
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Container(
        height: 72,
        child: Card(
          color: Color.fromARGB(255, 29, 28, 28),
          elevation: 0,
          margin: EdgeInsets.zero,
          child: Padding(
              padding: const EdgeInsets.only(left: 6, right: 6, top: 10),
              // color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  NavigationBarItems(
                    lable: "Browse",
                   icon: Icons.search_outlined,
                   icon2: Icons.search,
                    index: 0,
                    isSelected: (selectedIndex == 0),
                    onTap: handleItemSelected,
                   
                  ),
                  
                  NavigationBarItems(
                    lable: "inbox",
                   icon:Icons.inbox_outlined ,
                   icon2: Icons.inbox,
                    index: 1,
                    isSelected: (selectedIndex == 1),
                    onTap: handleItemSelected,
            
                  ),
                  NavigationBarItems(
                    lable: "following",
                    icon:Icons.favorite_outline ,
                    icon2: Icons.favorite,
                    index: 2,
                    isSelected: (selectedIndex == 2),
                    onTap: handleItemSelected,
                               
                  ),

                  NavigationBarItems(
                      lable: "profile",
                      icon: Icons.person,
                      icon2: Icons.person,
                      index: 3,
                      isSelected: (selectedIndex == 3),
                      onTap: handleItemSelected
                  )
                ],
              ),
            ),
        ),
      ),
    );
  }
}
