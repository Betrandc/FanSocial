// import 'package:flutter/material.dart';


// class Login extends StatefulWidget {
//   const Login({Key? key}) : super(key: key);

//   @override
//   State<Login> createState() => _LoingState();
// }

// class _LoingState extends State<Login> {

// TextEditingController emailController = TextEditingController();
// TextEditingController passwordController =TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//       return SafeArea(child: Scaffold(
//         body: Column(
//           children: [
//           const Center(child: Text("Cameo"),) ,
//            credentials(context, emailController, false),
//            credentials(context, passwordController, true)
//           ],
//         ),
//       ));
//   }

//    Widget credentials(BuildContext context,TextEditingController controller,bool password){
//   return  Container(
//       margin: const EdgeInsets.only(left: 15,right: 15 ,bottom: 15),
//       child: TextFormField(
//         obscureText: password,
//         controller: controller,
//       decoration: InputDecoration(
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),

          
//           )
//       ),
//     ),);
//   }
// }

import 'package:flutter/material.dart';

class NavigationBarItems extends StatelessWidget {
  NavigationBarItems({
    Key? key,
    required this.lable,
    required this.icon,
    required this.index,
    this.isSelected = false,
    required this.onTap,
   
  }) : super(key: key);

  final String lable;
  final IconData icon;
  final int index;
  final bool isSelected;
  final ValueChanged<int> onTap;

 final TextEditingController _momoController = TextEditingController();

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
            Icon(
              icon,
              size: 20,
              color: isSelected ? Colors.blue : Colors.white,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              lable,
              style: TextStyle(
                fontSize: 10,
                color: isSelected ? Colors.blue :Colors.white,
                fontWeight: FontWeight.bold))])));
  }
}
