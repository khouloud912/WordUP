import 'package:designcompetition/body.dart';
import 'package:flutter/material.dart';

class Apply extends StatelessWidget {
  final String id;
  Apply({Key key, @required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(id1:id),
    );
  }
}