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
