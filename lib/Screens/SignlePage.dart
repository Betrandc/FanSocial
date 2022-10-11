

import 'package:flutter/material.dart';


class SpecificPerson extends StatefulWidget {
  const SpecificPerson({Key? key}) : super(key: key);

  @override
  State<SpecificPerson> createState() => _SpecificPersonState();
}

class _SpecificPersonState extends State<SpecificPerson> {

bool displayLength=false;

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
         backgroundColor: Colors.black, 
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 27, 27, 27), 
        
        actions:const [
          Padding(
            padding:  EdgeInsets.only(top:22.0,right: 17),
            child: Text("Follow"),
          ),
          Padding(
            padding:  EdgeInsets.only(right:18.0),
            child: Icon(Icons.upload),
          ),
        ]),
        body: SizedBox(
          child: SingleChildScrollView(
            child: Column(
                  children: [
                  horizontalScrollableItems(),

                  SizedBox(
                    width: devicewidth,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: devicewidth-(devicewidth/4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Jeam Marie",style: TextStyle(color: Colors.white),),
                                Text("I am a software engineer,quality and value are my goals.",style: TextStyle(color: Colors.white,overflow: TextOverflow.ellipsis),)

                              ],
                            ),
                          ),
                          // FloatingActionButton(
                          
                          //   onPressed: (){},child: Image.asset("Assets/Images/patient.jpg",fit: BoxFit.cover,),)
                        const  CircleAvatar(
                           
                            radius: 20,
                          backgroundImage: AssetImage("Assets/Images/patient.jpg"),
                         )
                        ],
                      ),
                    ),
                  ),
                 
                Container(
                  margin: const EdgeInsets.only(left: 12,top: 12,bottom: 12),
                  child: const  Align(
                    alignment: Alignment.centerLeft,
                     child:  Card(
                      color: Color.fromARGB(255, 29, 28, 28), 
                       child: Padding(
                         padding: EdgeInsets.all(10.0),
                         child: Text("24hr delivery",style: TextStyle(color: Colors.white),),
                       ),
                     ),
                   ),
                ),


                  Container(
                    margin: EdgeInsets.only(left: 10,right: 10),
                    // width: devicewidth-40,
                    child: Card(
                      //  color:Color.fromARGB(255, 51, 50, 50),
                      color: Color.fromARGB(255, 29, 28, 28), 
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                              SizedBox(
                                height: deviceheight/14,
                                width: devicewidth-(devicewidth/3+80),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:const [
                                      Text("Reviews(60)",style: TextStyle(color:Color.fromARGB(255, 104, 103, 103),)),
                                      Text("5.0",style: TextStyle(color: Colors.white),)
                                  ],
                                ),
                              ),

                              Container(
                                width: 1,
                                height: 30,
                               color:Color.fromARGB(255, 104, 103, 103),
                              ),
                               SizedBox(
                                 height: deviceheight/14,
                                 width: devicewidth-(devicewidth/3+80),
                                 child: Column(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                  children:const [
                                      Text("Reviews(60)",style: TextStyle(color:Color.fromARGB(255, 104, 103, 103),)),
                                      Text("5.0",style: TextStyle(color: Colors.white),)
                                  ],
                                  ),
                               ),
                      ],),
                    ),
                  ),


                  cardListItemsTitle("Review", "see all 25"),
                  reviewList(),
                 const Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left:18.0),
                      child: Text("Similar Categpries",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                    )),
                 displayTwoItemsInHorizontalFormat("Actors", 100.0, "Commedian", 125),
                    displayTwoItemsInHorizontalFormat("Comedy", 100.0, "Featured", 95),
                       displayTwoItemsInHorizontalFormat("Stand Up", 100.0, "TV", 62),
                          displayTwoItemsInHorizontalFormat("Promotional", 120.0, "Black voices", 125),
                       if(!displayLength)  InkWell(
                        onTap: (){
                          setState(() {
                            displayLength=!displayLength;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("see more",style: TextStyle(color: Colors.blue),),
                        )),
                      if(displayLength) Column(
                          children: [
                             displayTwoItemsInHorizontalFormat("Fan Club Sugestions", 170.0, "Roast", 90),
                          displayTwoItemsInHorizontalFormat("Clapback at Dad", 150.0, "Dad's favs", 125),
                    displayTwoItemsInHorizontalFormat("Celabrations", 130.0, "Make dad laugh", 145),
                       Padding(
                         padding: const EdgeInsets.only(left:8.0),
                         child: Align(
                          alignment: Alignment.bottomLeft,
                          child: singleSearch("Male them laugh", 150)),
                       ),
                          displayTwoItemsInHorizontalFormat("24 hours delivery", 150.0, "Business", 125),
                          ],
                         ),

                          if(displayLength)  InkWell(
                        onTap: (){
                          setState(() {
                            displayLength=!displayLength;
                          });
                        },
                        child:const Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("see short",style: TextStyle(color: Colors.blue),),
                        )),
                         
                  ],
                  ),
          )),
       
        bottomNavigationBar: Container(
           color: Color.fromARGB(255, 29, 28, 28), 
          height: deviceheight/8,
          width: devicewidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                      Container(
                         margin:const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                            color: Color.fromARGB(255, 238, 43, 108),
                       
                          boxShadow:const  [
                           BoxShadow(
                            blurRadius: 7.0
                          )
                        ]),
                          width: devicewidth-(devicewidth/3+20),
                        child: MaterialButton(onPressed: (){},child: Text("Book Now '\$'209.9",style:TextStyle(color: Colors.white)),),
                      )
                      ,
                       Container(
                       
                           decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color.fromARGB(255, 36, 35, 35), 
                          boxShadow:const  [
                           BoxShadow(
                            blurRadius: 7.0
                          )
                        ]),
                        width: devicewidth/3-20,
                        child: MaterialButton(onPressed: (){},child: Row(
                          children: [
                            Icon(Icons.chat,color: Colors.white,),
                            Text("chat",style:TextStyle(color: Colors.white)),
                          ],
                        ),),
                      )
                      
                ],
              ),

             const Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Learn More",style: TextStyle(color: Colors.white),),
              ),

              
            ],
          ),
        )
      ),
    );
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

 Widget horizontalScrollableItems(){
        return SizedBox(
          height: 250,

          child: ListView.builder(
            itemCount: 7,
            
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) => Container(child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                margin: const EdgeInsets.only(left: 12,top: 10),
                child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset("Assets/Images/p3.jpg",width: 190,height: 250,fit: BoxFit.fill,)),
              ),),))),
        );
  }

 Widget reviewList(){
   return ListView.builder(
     shrinkWrap: true,
     itemCount: 2,
     itemBuilder: (context,index)=>Container(
        margin:const EdgeInsets.only(left: 20,right: 20,bottom: 10),
   decoration: BoxDecoration(
     color: Color.fromARGB(255, 29, 28, 28),
     borderRadius: BorderRadius.all(Radius.circular(10))
   ),
       child: Card(
         color: Color.fromARGB(255, 29, 28, 28),
         // clipBehavior: BorderRadius.circular(radius),
         child: Column(
           children: [
             Row(
               children: [
                 FloatingActionButton(onPressed: (){},child: Text("A"),),
                 Padding(
                   padding: const EdgeInsets.only(left:8.0,bottom: 8),
                   child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("Jean Marie",style: TextStyle(color: Colors.white),),
                       Text("1 day ago",style: TextStyle(color: Colors.white),)
                     ],
                   ),
                 )
               ],
             ),
             Row(
               children: const [
                 Icon(Icons.star,color: Colors.yellow,size: 30,),
                 Icon(Icons.star,color: Colors.yellow,size: 30,),
                 Icon(Icons.star,color: Colors.yellow,size: 30,),
                 Icon(Icons.star,color: Colors.yellow,size: 30,),
                 Icon(Icons.star,color: Colors.yellow,size: 30,),
                 Text("5.0",style: TextStyle(color: Colors.white),)
               ],
             ),

             Text("""This person so kind an patient no matter how my questions may be his still the to answer them for me
""",style: TextStyle(color: Colors.white),)
           ],
         ),
       ),
     ));
  }

Widget singleSearch(String occupation,double width){
  return Container(
    height: 40,
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      border: Border.all(
      color:Color.fromARGB(255, 104, 103, 103),
    )),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left:8.0),
          child: Icon(Icons.search,color: Colors.white),
        ),
        Text(occupation ,style: TextStyle(color: Colors.white),)
      ],
    ),
  );
}

Widget displayTwoItemsInHorizontalFormat(String occupation,double width,String occupation2,double width2){ 
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        singleSearch(occupation, width),
        SizedBox(
          width: 19,
        ),
        singleSearch(occupation2, width2),
      ],
    ),
  );
}

}

