

import 'package:flutter/material.dart';
import 'package:untitled/Screens/ChatPage.dart';
import 'package:untitled/Screens/Following.dart';
import 'package:untitled/Screens/ItemsPage.dart';
import 'package:untitled/Screens/Profile.dart';

import './Bottomnavigator.dart';

class UserDashboard extends StatelessWidget {
  UserDashboard({
    Key? key,
  }) : super(key: key);

  List pages = const [
ItemsList(),
Inbox(),
Following(),
Profile()

  ];
  // List pageTitle = const ["Browse", "Inbox", "Following","Profile"];

  final ValueNotifier<int> pageindex = ValueNotifier(0);
  final ValueNotifier<String> titlepage = ValueNotifier("Browse");

  void pagenameHandler(index) {
    // titlepage.value = pageTitle[index];
    pageindex.value = index;
  }

  navigationFunction(BuildContext context, Widget PageName) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => PageName));
  }

  @override
  Widget build(BuildContext context) {
    final double deviceheight =MediaQuery.of(context).size.height;
     final double devicewidth =MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: SizedBox(
          height: deviceheight,
          width: devicewidth,
          child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       mainAxisSize: MainAxisSize.max,
            children: [
              
           
              SafeArea(
                child: SizedBox(
                   height: deviceheight-(deviceheight/8),
                        width: devicewidth,
                  child: ValueListenableBuilder(
                    valueListenable: pageindex,
                    builder: (context, int value, _) {
                      return pages[value];
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigation(
          
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
    return Card(
      color: Color.fromARGB(255, 29, 28, 28),  
      elevation: 0,
      margin: EdgeInsets.zero,
      child: SafeArea(
          top: false,
          bottom: true,
          child: Padding(
            padding: const EdgeInsets.only(left: 6, right: 6, top: 10),
            // color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavigationBarItems(
                  lable: "Browse",
                 img: "Assets/Images/onsearch.png",
                 img2:"Assets/Images/onbrowse.png" ,
                  index: 0,
                  isSelected: (selectedIndex == 0),
                  onTap: handleItemSelected,
                 
                ),
                
                NavigationBarItems(
                  lable: "inbox",
                 img: "Assets/Images/message.png",
                 img2:"Assets/Images/onmessage.png",
                  index: 1,
                  isSelected: (selectedIndex == 1),
                  onTap: handleItemSelected,
          
                ),
                NavigationBarItems(
                  lable: "following",
                  img:"Assets/Images/favorite2.png",
                  img2: "Assets/Images/onlike.png",
                  index: 2,
                  isSelected: (selectedIndex == 2),
                  onTap: handleItemSelected,
                             
                ),

                NavigationBarItems(
                    lable: "profile",
                    img: "Assets/Images/fansocialreal.png",
                    img2: "Assets/Images/fansocialreal.png",
                    index: 3,
                    isSelected: (selectedIndex == 3),
                    onTap: handleItemSelected
                )
              ],
            ),
          )),
    );
  }
}
