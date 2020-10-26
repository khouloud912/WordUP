import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:designcompetition/Home.dart';
import 'package:designcompetition/apply.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class details extends StatelessWidget {
  final DocumentSnapshot news;
  details({Key key, @required this.news, DocumentSnapshot todo}) : super(key: key);

  
  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:Container(
        child:SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width:double.infinity,
                height:400.0,
                child:Stack(children: [
                  Positioned(
                    top:0,
                    left:0,
                    right:0,
                    bottom:60.0,
                    child:Container(
                      color:Colors.grey[200],
                      child:Column(
                        children: [
                         
                          Container(
                            width:double.infinity,
                            height:335.0,
                            child: Container(
                              width: 400.0,
                              height:400.0,
                              child:Row(
                                  children: <Widget>[
                                    IconButton(
                                      icon:Icon(Icons.arrow_back_ios,color: Colors.white,),
                                      iconSize: 30.0,
                                      onPressed: () {
                                        Navigator.push(
                                           context,
                                           MaterialPageRoute(builder:(context)=>HomePage()),
                              ); 
                                      },
                                    )
                                    ]
                                    ),
                            
                              decoration: BoxDecoration(
                                 image:DecorationImage(
                                image: NetworkImage("https://images.unsplash.com/photo-1491142981871-bd39912152bf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80"),
                                fit:BoxFit.cover,

                              )

                              ),
                             

                            ),
                      
                          )
  
                        ],
                      )
                    
                  ),
                  ),
                  Positioned(
                    top:270.0,
                    left:20.0,
                    right:20.0,
                    bottom:0,
                     child: Card(
                      elevation:5.0,
                      shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0)
                      ),
                  child:Padding(
                   // padding:EdgeInsets.all(10.0) ,
                   padding: EdgeInsets.only(left:16,right:8),
                 //  margin:EdgeInsets.only(left: 24,right: 24,bottom: 16),

                    
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
                             Text(news['school'],
                             style: TextStyle(
                               color: Colors.indigo[300],
                               fontWeight: FontWeight.bold,
                               fontSize: 20,
                             ),
                             ),
                    
                           ],
                         ),


                        
                         ],
                       ),
                    ),
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
                                child: Icon(Icons.date_range,color:Colors.green[200]),
                              ),
                           ),
                         SizedBox(width: 8,),
                         Column(
                           mainAxisAlignment: MainAxisAlignment.center,

                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: <Widget>[
                             Text(news['date'],
                             style: TextStyle(
                               color: Colors.indigo[300],
                               fontWeight: FontWeight.normal,
                               fontSize: 20,
                             ),
                             ),
                    
                           ],
                         ),


                        
                         ],
                       ),
                    ),
                    
                    
          
                  ]
                ),
                  
                    )
                  
                  )
                  )
                ]
                ),

                

              ),
              Container(
                width:double.infinity,
                child:Column(
                  children: [
                    SizedBox(height: 12.0),
                    ListTile(
                      leading: CircleAvatar(
                        radius:25,
                        backgroundImage: NetworkImage("https://images.unsplash.com/photo-1491142981871-bd39912152bf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80"),

                       // backgroundImage: ,
                      ),
                      title: Text(news['title'],style: TextStyle(fontSize:18 ),),
                      subtitle: Text("competition"),
                      trailing: Text("22 May 2020"),
                    ),
                    SizedBox(height:15.0),
                    Padding(
                       padding:EdgeInsets.symmetric(horizontal:18.0),
                       child:Text(news['description'])

                    )
                   

                  ],
                )
              

              ),
             

            ],
              
          ),
        )
      ),
      bottomNavigationBar: Container(
          width:double.infinity,
          height:120.0,
          padding:EdgeInsets.symmetric(horizontal:18.0,vertical:25.0),
          decoration:BoxDecoration(
            color:Colors.grey[200],
            borderRadius:BorderRadius.only(
              topLeft:Radius.circular(35.0),
              topRight:Radius.circular(35.0)
            )
          
          ),
          child: Row(
            children: [
              Expanded(
                flex:1,
                child:Card(
                  elevation: 6.0,
                  color:Colors.blue[200],
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)
                  ),
                child: Center(
                  child:Icon(
                    FontAwesomeIcons.heart,
                    color: Colors.white,
                  
                  )
                ),
                
                )
              ),
              SizedBox(width:15.0),
              Expanded(
                flex: 2,
                child:InkWell(
                  child: Card(
                  elevation: 6.0,
                  color:Colors.blue[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)
                  ),
                 
                
                  child:Center(
                    child:Text(
                      "Apply",
                      style:TextStyle(
                        color:Colors.white,
                        fontStyle: FontStyle.italic,
                        fontSize: 20
                        
                        ) ,
                    )
                  ),
                 
                ),
                onTap: (){
                  Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => Apply(id:news['uid']),
        ));

                },

                )
                
               
              )
           
            ],),
       
       
        )
    
    
    
    
    );
  }
}

/*

 children:[
              Container(
                width:double.infinity,
                height:400.0,
                child:Stack(children: [
                  (
                    top:0,
                    left:0,
                    right:0,
                    bottom:60.0,
                    child:Container(
                      color:Colors.grey[200],
                      child:[
                        AppBar(
                          backgroundColor: Colors.grey[200],
                          elevation: 0,
                          leading: IconButton(
                            icon:Icon(Icons.arrow_back_ios),
                            iconSize: 30.0,
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder:(context)=>HomePage()),
                              );                      
                              }
                              
                  ) 
                        
                          
                          
                          )
                      ]

                    )
                  ),
                  Positioned(
                    top:270.0,
                    left:20.0,
                    right:20.0,
                    bottom:0,
                    child: Card(
                      elevation:5.0,
                      shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0)
                      ),
                      
                 
                    ),
                  )

                ],)
              )
            ]
*/