
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({Key? key}) : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    
    return Card(
      child: Column(
children: [
  Padding(
    padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
    child: SizedBox(
      width: double.infinity,
      child: Text('Sign in for the best experiance')),
  ),

  CupertinoButton(
    child:Container(
      alignment: Alignment.center,
      height: 50,
      width: double.infinity,
      child: Text('Sign 8'),
      color: Colors.orange,
    ), 
    onPressed:(){}),

    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment:Alignment.centerLeft,
        child: Text('Create an account')),
    ),

],
        
      ),
    );
  }
}