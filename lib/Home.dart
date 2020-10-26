import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:designcompetition/details.dart';
import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {

  HomePage();

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _buildTop(){
    return  Container(
            height:MediaQuery.of(context).size.height/2.1 ,
            child: Stack(
              children:<Widget>[
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      image: DecorationImage(
                        image:NetworkImage(
                          'https://i.pinimg.com/564x/44/a0/a6/44a0a6e7db02ce2ba993b09989161d14.jpg'
                          
                         ),
                         fit: BoxFit.cover
                      ),
                      color:Colors.red[100]
                    ),
                    height:MediaQuery.of(context).size.height/5,

                  ),
                ),
                Positioned(
                  left:0,
                  top:48,
                  right: 38,
                  child:Container(
                    height:64,
                    child:Row(
                      children: <Widget>[
                        IconButton(
                          icon:Icon(Icons.arrow_back_ios,color: Colors.white,),onPressed: () {},
                        ),
                        Spacer(),
                        Text("School competitions",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24
                        ),),
                        Spacer()
                      ],

                    )
                  )
                ),
                Positioned(
                  top:MediaQuery.of(context).size.height/6.5,
                  bottom:0,
                  left:16,
                  right:16,
                  child:Card(
                    elevation:4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  child:Container(
                    padding: EdgeInsets.only(top:24,left:16,right:16,bottom:8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24)
                    ),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height:64,
                          width:64,
                          decoration:BoxDecoration(
                            shape:BoxShape.circle,
                            border:Border.all(color:Colors.red[400],
                            width: 2)

                          ),
                          child: Center(
                            child:Icon(Icons.school,
                            size:38,
                            color:Colors.green
                            ),
                          ),

                        ),
                        SizedBox(height: 12,),
                        Text("Competitions and Challenges",style: TextStyle(
                          fontSize: 18,
                          fontWeight:FontWeight.bold,
                          color: Colors.indigo[300]

                        ),),
                        SizedBox(height: 12,),

                       Row(
                         children: <Widget>[
                           Icon(Icons.beenhere,color:Colors.red[200],),
                           Text("Competition is a rude yet effective motivation")
                         ],
                       ),
                     
                      ],
                    ) ,

                  )
                )
                
                )
              ]
            ),
            );
  }
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.blueGrey[50],
    
    body:SingleChildScrollView(
      child:Column(
        children:<Widget>[
	   _buildTop(),
          Container(
           padding: EdgeInsets.only(top:16),
           height:MediaQuery.of(context).size.height / 2, 
           child:StreamBuilder<QuerySnapshot> (
           stream: Firestore.instance.collection("competitions").snapshots(),
           builder: (BuildContext context ,AsyncSnapshot<QuerySnapshot> querySnapshot){
          if(querySnapshot.hasError)
            return Text("some Error");
          if(querySnapshot.connectionState == ConnectionState.waiting)
            return CircularProgressIndicator();
            
           else{
             final list =querySnapshot.data.documents;
              return ListView.builder(
             itemCount: list.length,
             padding: EdgeInsets.zero,
             shrinkWrap: true,
             itemBuilder: (context,index){
               return Stack(
                     children: <Widget>[
                Container(
                 padding: EdgeInsets.only(left:16,right:8),
                 margin:EdgeInsets.only(left: 24,right: 24,bottom: 16),
                 height:MediaQuery.of(context).size.height /2.3,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(16),
                   color:Colors.white,
                 ),
               
               
                child: Column(
                  children:<Widget>[
                    Expanded(
                       flex:2,
                       child: Row(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: <Widget>[
                           Container(
                             height:38,
                             width: 38,
                             decoration: BoxDecoration(
                               shape: BoxShape.circle,
                               border:Border.all(color: Colors.red[200],
                               width: 2
                               )
                             ),
                              child: Center(
                                child: Icon(Icons.school,color:Colors.green[200]),
                              ),
                           ),
                         SizedBox(width: 8,),
                         Column(
                           mainAxisAlignment: MainAxisAlignment.center,

                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: <Widget>[
                             Text(list[index]["title"],
                             style: TextStyle(
                               color: Colors.indigo[300],
                               fontWeight: FontWeight.bold
                             ),
                             ),
                             Text("1 hour ago",
                              style: TextStyle(
                               color: Colors.indigo[300],
                               fontWeight: FontWeight.bold,
                               fontSize: 12
                             ),
                             )
                           ],
                         ),
                         Spacer(),
                         Icon(Icons.more_vert,size: 34,)

                         ],
                       )
                    ),
                    Expanded(
                       flex:5,
                       child: Container(
                         
                         child: new InkWell(
                            onTap: (){
                               Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) => details(news:list[index]),
                              ));
                            }),
                         decoration:BoxDecoration(
                           borderRadius: BorderRadius.circular(16),
                           image:DecorationImage(
                             image:NetworkImage("https://images.unsplash.com/photo-1585980243496-fe29a36bd382?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=818&q=80"),
                             fit:BoxFit.cover,
                              )
                              
                         )
                       ),
                    ),
                    Expanded(
                       flex:2,
                       child:Padding(
                        padding:const EdgeInsets.only(top:16) ,
                      
                       child:Text(list[index]["description"],
                       style: TextStyle(
                         fontSize: 10,
                         color:Colors.indigo[300],
                         letterSpacing: 1.2
                       ),
                        ),
                       ),
                    )
                  ]
                ),
             
               ),
                Container(
                 height:MediaQuery.of(context).size.height /2.5,
               ),
              
             ]
                 
                 
               );
              
            // padding: EdgeInsets.zero;
             //shrinkWrap: true;
         
             
           });


             
         

             



          }


        }

      )
      
        
          )
        ]
    ),
    
    )
  );
  }
}




/*

 child:Column(
        children:<Widget>[
         Container(
           padding: EdgeInsets.only(top:16),
           height:MediaQuery.of(context).size.height / 2, 
           child: ListView.builder(
             itemCount: list.length,
             itemBuilder: (context,index){
             padding: EdgeInsets.zero;
             shrinkWrap: true;
             children: <Widget>[
               Container(
                 padding: EdgeInsets.only(left:16,right:8),
                 margin:EdgeInsets.only(left: 24,right: 24,bottom: 16),
                 height:MediaQuery.of(context).size.height /2.3,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(16),
                   color:Colors.white,
                 ),
                child: Column(
                  children:<Widget>[
                    Expanded(
                       flex:2,
                       child: Row(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: <Widget>[
                           Container(
                             height:38,
                             width: 38,
                             decoration: BoxDecoration(
                               shape: BoxShape.circle,
                               border:Border.all(color: Colors.red[200],
                               width: 2
                               )
                             ),
                              child: Center(
                                child: Icon(Icons.school,color:Colors.green[200]),
                              ),
                           ),
                         SizedBox(width: 8,),
                         Column(
                           mainAxisAlignment: MainAxisAlignment.center,

                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: <Widget>[
                             Text(list[index]["school"],
                             style: TextStyle(
                               color: Colors.indigo[300],
                               fontWeight: FontWeight.bold
                             ),
                             ),
                             Text("1 hour ago",
                              style: TextStyle(
                               color: Colors.indigo[300],
                               fontWeight: FontWeight.bold,
                               fontSize: 12
                             ),
                             )
                           ],
                         ),
                         Spacer(),
                         Icon(Icons.more_vert,size: 34,)

                         ],
                       ),
                    ),
                    Expanded(
                       flex:5,
                       child: Container(
                         decoration:BoxDecoration(
                           borderRadius: BorderRadius.circular(16),
                           image:DecorationImage(
                             image:NetworkImage("https://images.unsplash.com/photo-1585980243496-fe29a36bd382?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=818&q=80"),
                             fit:BoxFit.cover,
                              )
                              
                         )
                       ),
                    ),
                    Expanded(
                       flex:2,
                       child:Padding(
                        padding:const EdgeInsets.only(top:16) ,
                      
                       child:Text(list[index]["description"],
                       style: TextStyle(
                         fontSize: 10,
                         color:Colors.indigo[300],
                         letterSpacing: 1.2
                       ),
                        ),
                       ),
                    )
                  ]
                ),
             
               ),
                Container(
                 height:MediaQuery.of(context).size.height /2.5,
               ),
             ];
             
           })
           
         )


        ]

      );
*/



















































































// import 'package:flutter/material.dart';



// class HomePage extends StatefulWidget {

//   HomePage();

//   @override
//   _HomePageState createState() => new _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   Widget _buildTop(){
//     return  Container(
//             height:MediaQuery.of(context).size.height/2.1 ,
//             child: Stack(
//               children:<Widget>[
//                 Positioned(
//                   left: 0,
//                   right: 0,
//                   top: 0,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(24),
//                       image: DecorationImage(
//                         image:NetworkImage(
//                           'https://i.pinimg.com/564x/44/a0/a6/44a0a6e7db02ce2ba993b09989161d14.jpg'
                          
//                          ),
//                          fit: BoxFit.cover
//                       ),
//                       color:Colors.red[100]
//                     ),
//                     height:MediaQuery.of(context).size.height/5,

//                   ),
//                 ),
//                 Positioned(
//                   left:0,
//                   top:48,
//                   right: 38,
//                   child:Container(
//                     height:64,
//                     child:Row(
//                       children: <Widget>[
//                         IconButton(
//                           icon:Icon(Icons.arrow_back_ios,color: Colors.white,),onPressed: () {},
//                         ),
//                         Spacer(),
//                         Text("School competitions",style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 24
//                         ),),
//                         Spacer()
//                       ],

//                     )
//                   )
//                 ),
//                 Positioned(
//                   top:MediaQuery.of(context).size.height/6.5,
//                   bottom:0,
//                   left:16,
//                   right:16,
//                   child:Card(
//                     elevation:4,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(24),
//                     ),
//                   child:Container(
//                     padding: EdgeInsets.only(top:24,left:16,right:16,bottom:8),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(24)
//                     ),
//                     child:Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: <Widget>[
//                         Container(
//                           height:64,
//                           width:64,
//                           decoration:BoxDecoration(
//                             shape:BoxShape.circle,
//                             border:Border.all(color:Colors.red[400],
//                             width: 2)

//                           ),
//                           child: Center(
//                             child:Icon(Icons.school,
//                             size:38,
//                             color:Colors.green
//                             ),
//                           ),

//                         ),
//                         SizedBox(height: 12,),
//                         Text("Competitions and Challenges",style: TextStyle(
//                           fontSize: 18,
//                           fontWeight:FontWeight.bold,
//                           color: Colors.indigo[300]

//                         ),),
//                         SizedBox(height: 12,),

//                        Row(
//                          children: <Widget>[
//                            Icon(Icons.beenhere,color:Colors.red[200],),
//                            Text("Competition is a rude yet effective motivation")
//                          ],
//                        ),
                     
//                       ],
//                     ) ,

//                   )
//                 )
                
//                 )
//               ]
//             ),
//             );
//   }
//   @override
//   Widget build(BuildContext context) {
//   return Scaffold(
//     backgroundColor: Colors.blueGrey[50],
    
//     body:SingleChildScrollView(
//       child:Column(
//         children:<Widget>[
//          _buildTop(),
//          Container(
//            padding: EdgeInsets.only(top:16),
//            height:MediaQuery.of(context).size.height / 2,
//            child: ListView(
//              padding: EdgeInsets.zero,
//              shrinkWrap: true,
//              children: <Widget>[
//                Container(
//                  padding: EdgeInsets.only(left:16,right:8),
//                  margin:EdgeInsets.only(left: 24,right: 24,bottom: 16),
//                  height:MediaQuery.of(context).size.height /2.3,
//                  decoration: BoxDecoration(
//                    borderRadius: BorderRadius.circular(16),
//                    color:Colors.white,
//                  ),
//                 child: Column(
//                   children:<Widget>[
//                     Expanded(
//                        flex:2,
//                        child: Row(
//                          crossAxisAlignment: CrossAxisAlignment.center,
//                          children: <Widget>[
//                            Container(
//                              height:38,
//                              width: 38,
//                              decoration: BoxDecoration(
//                                shape: BoxShape.circle,
//                                border:Border.all(color: Colors.red[200],
//                                width: 2
//                                )
//                              ),
//                               child: Center(
//                                 child: Icon(Icons.school,color:Colors.green[200]),
//                               ),
//                            ),
//                          SizedBox(width: 8,),
//                          Column(
//                            mainAxisAlignment: MainAxisAlignment.center,

//                            crossAxisAlignment: CrossAxisAlignment.start,
//                            children: <Widget>[
//                              Text("Ibn el jazar School",
//                              style: TextStyle(
//                                color: Colors.indigo[300],
//                                fontWeight: FontWeight.bold
//                              ),
//                              ),
//                              Text("1 hour ago",
//                               style: TextStyle(
//                                color: Colors.indigo[300],
//                                fontWeight: FontWeight.bold,
//                                fontSize: 12
//                              ),
//                              )
//                            ],
//                          ),
//                          Spacer(),
//                          Icon(Icons.more_vert,size: 34,)

//                          ],
//                        ),
//                     ),
//                     Expanded(
//                        flex:5,
//                        child: Container(
//                          decoration:BoxDecoration(
//                            borderRadius: BorderRadius.circular(16),
//                            image:DecorationImage(
//                              image:NetworkImage("https://images.unsplash.com/photo-1585980243496-fe29a36bd382?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=818&q=80"),
//                              fit:BoxFit.cover,
//                               )
                              
//                          )
//                        ),
//                     ),
//                     Expanded(
//                        flex:2,
//                        child:Padding(
//                         padding:const EdgeInsets.only(top:16) ,
                      
//                        child:Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
//                        style: TextStyle(
//                          fontSize: 10,
//                          color:Colors.indigo[300],
//                          letterSpacing: 1.2
//                        ),
//                         ),
//                        ),
//                     )
//                   ]
//                 ),
             
//                ),
//                 Container(
//                  height:MediaQuery.of(context).size.height /2.5,
//                ),
//              ],
             
//              ),
//          )


//         ]

//       )

    
//     ),

//   );
//   }
// }











