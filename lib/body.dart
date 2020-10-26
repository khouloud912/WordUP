
import 'package:designcompetition/background.dart';
import 'package:designcompetition/models/application.dart';
import 'package:designcompetition/rounded_button.dart';
import 'package:designcompetition/rounded_input_field.dart';
import 'package:flutter/material.dart';
import "package:flutter_svg/flutter_svg.dart";
import 'package:cloud_firestore/cloud_firestore.dart';

class Body extends StatefulWidget {
  final String id1;
  Body({Key key, @required this.id1}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  
final db= Firestore.instance;
 static String get id1 => id1;

  Application app=new Application(id1, null, null,null);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Apply",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
             SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "Your full Name",
              onChanged: (value) {
                setState(() => app.name  = value
                );
                
              },
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                setState(() => app.email  = value);
              },
            ),
            RoundedInputField(
              hintText: "Your School",
              onChanged: (value) {
                 setState(() => app.school  = value);
              },
            ),
            
            RoundedButton(
              
              text: "Apply",
              press: () async{
                
                await db.collection("application").add(
                  {
                    
                    'name':app.name,
                    'email':app.email,
                    'school':app.school,
                   // 'id':app.id
                  }
                );
               
              },
            ),
            SizedBox(height: size.height * 0.03),
            
            
           
          ],
        ),
      ),
    );
  }
}

