import 'package:flutter/material.dart';
import 'package:untitled/Screens/SignlePage.dart';

class ItemsList extends StatefulWidget {
  const ItemsList({Key? key}) : super(key: key);

  @override
  State<ItemsList> createState() => _ItemsListState();
}

class _ItemsListState extends State<ItemsList> {
  @override
  Widget build(BuildContext context) {
    final double deviceheight=MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
          
              body: SizedBox(
                height: deviceheight,
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.max,
                  children: [
                         Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SizedBox(
                    child: Row(
                  
                      children:const [
                        Text("Browse",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 27),),
                     
                      ],
                    ),
                  ),
                ),
                    Card(
                      color: Colors.black,
                      child: Container(
                        margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                  color:Color.fromARGB(255, 104, 103, 103).withOpacity(0.4) 
                
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                    
                    prefixIcon: IconButton(icon: Icon(Icons.search,color: Colors.white,),onPressed: (){},),
                    border: InputBorder.none,
                    
                    ),)
                ) ,
                    ),
                  cardListItemsTitle("Comedian", "seeall"),
                 horizontalSCrollingOfItems("Assets/Images/p3.jpg"),

                  cardListItemsTitle("Comedian", "seeall"),
                 horizontalSCrollingOfItems("Assets/Images/p3.jpg"),

                  cardListItemsTitle("Comedian", "seeall"),
                 horizontalSCrollingOfItems("Assets/Images/p3.jpg"),


                  cardListItemsTitle("Comedian", "seeall"),
                 horizontalSCrollingOfItems("Assets/Images/p3.jpg"),

                  cardListItemsTitle("Comedian", "seeall"),
                 horizontalSCrollingOfItems("Assets/Images/p3.jpg"),

                  cardListItemsTitle("Comedian", "seeall"),
                 horizontalSCrollingOfItems("Assets/Images/p3.jpg"),

                  cardListItemsTitle("Comedian", "seeall"),
                 horizontalSCrollingOfItems("Assets/Images/p3.jpg"),

                  cardListItemsTitle("Comedian", "seeall"),
                 horizontalSCrollingOfItems("Assets/Images/p3.jpg"),

                  cardListItemsTitle("Comedian", "seeall"),
                 horizontalSCrollingOfItems("Assets/Images/p3.jpg"),
                 

                  cardListItemsTitle("Comedian", "seeall"),
                 horizontalSCrollingOfItems("Assets/Images/p3.jpg"),

                  cardListItemsTitle("Comedian", "seeall"),
                 horizontalSCrollingOfItems("Assets/Images/p3.jpg"),

                  cardListItemsTitle("Comedian", "seeall"),
                 horizontalSCrollingOfItems("Assets/Images/p3.jpg"),


                  cardListItemsTitle("Comedian", "seeall"),
                 horizontalSCrollingOfItems("Assets/Images/p3.jpg"),

                  cardListItemsTitle("Comedian", "seeall"),
                 horizontalSCrollingOfItems("Assets/Images/p3.jpg"),

                  cardListItemsTitle("Comedian", "seeall"),
                 horizontalSCrollingOfItems("Assets/Images/p3.jpg"),

                  cardListItemsTitle("Comedian", "seeall"),
                 horizontalSCrollingOfItems("Assets/Images/p3.jpg"),

                  cardListItemsTitle("Comedian", "seeall"),
                 horizontalSCrollingOfItems("Assets/Images/p3.jpg"),

                  cardListItemsTitle("Comedian", "seeall"),
                 horizontalSCrollingOfItems("Assets/Images/p3.jpg"),
                 
                  ],
                ),
              ),
      ),
    );
  }

  navigationFunction(BuildContext context, Widget PageName) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => PageName));
  }

 Widget cardListItemsTitle( String type,String seeall){
    return Padding(
      padding: const EdgeInsets.only(top:18.0,left: 18,right: 18,bottom: 22.0),
      child: SizedBox(
        height: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text(type,style:const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          Text(seeall,style:const TextStyle(color: Colors.blue,fontWeight: FontWeight.bold))
        ],),
      ),
    );
  }
  Widget cardListItems(String name,occupation, int amount, String img){ 
    return ConstrainedBox(
      constraints: BoxConstraints(),
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
          GestureDetector(
            onTap: (){
         navigationFunction(context, SpecificPerson());
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(img,width: 200,height: 200,fit: BoxFit.fill,)),
          ),
          Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: Text(name,style: TextStyle(color: Colors.white),),
          ),
          Text(occupation,style: const TextStyle(color: Colors.white),),
          Text("${amount.toString()} XAF",style:const TextStyle(color: Colors.white),)
        ],),
      ),
    );
  }



 Widget horizontalSCrollingOfItems(String img){
    return SizedBox(
      height: 270,
      // width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => cardListItems("Jean Marie","Programmer",1200, img)),
    );
  }
  
 Widget VerticalScrollingItemList(deviceheight) {
    return  Container(
      height: deviceheight,
      child:Column(
        children: [
          
          horizontalSCrollingOfItems("Assets/Images/p3.jpg"),
        ],
      )
    );

  }
}