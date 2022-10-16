import 'package:flutter/material.dart';

class NavigationBarItems extends StatelessWidget {
  NavigationBarItems({
    Key? key,
    required this.lable,
     required this.img,
     required this.img2,
    required this.index,
    this.isSelected = false,
    required this.onTap,
   
   
  }) : super(key: key);

  final String lable;
  
  final int index;
  final bool isSelected;
  final ValueChanged<int> onTap;
  String img;
  String img2;



  @override
  Widget build(BuildContext context) {
    final devicewidth = MediaQuery.of(context).size.width;
    return GestureDetector(
       //this function able that even an empty space
      //were the icon is located is taped, the eventhandler should work
      // the child takes the entire space even if nothing is rendered.
      behavior:
          HitTestBehavior.opaque,
      onTap: () {
  
           onTap(index);
      
      },
      child: SizedBox(
        height: 50,
        width: devicewidth / 6,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
              
            

            lable=="profile"?
           Container(
            decoration: BoxDecoration(
              
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
              width: 2,
            color:isSelected ?Colors.white:Color.fromARGB(255, 104, 103, 103) ,
            )),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset(img,width: 15 ),
            )):
            
            Stack(children:[ 
               
               Image.asset(!isSelected?img:img2,width: 30,color:!isSelected?  Color.fromARGB(255, 104, 103, 103): Colors.white,),
              if(lable=="inbox")  
                 Padding(
                   padding: const EdgeInsets.only(left:18.0,bottom:7),
                   child: Card(
                    shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(3)),
                     color: Color(0xFFb20257),
                     child: SizedBox(
                       height: 12,
                       width: 12,
                       child: Center(child: Text("",style: TextStyle(fontSize: 5,color: Colors.white),)),
                     ),
                   ),
                 ),
                ]),

            const SizedBox(
              height: 6,
            ),
            Text(
              lable,
              style: TextStyle(
                fontSize: 10,
                 color:isSelected ?Colors.white:Color.fromARGB(255, 104, 103, 103) ,
                fontWeight: FontWeight.bold))])));
 
 
  }

//  Widget tappedIconChanged(String lable,){
//   Widget Icons;
//         switch (lable) {
//           case "search":
//           Icons=Image.asset("Assets/Images/search.png",width: 30,color: !isSelected?Color.fromARGB(255, 104, 103, 103):Colors.white,);
            
//             break;
//           // default:
//         }
//   return Icons;

// }
}
