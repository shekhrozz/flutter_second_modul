


import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DealOfTheDayWidget extends StatefulWidget {
  const DealOfTheDayWidget({Key? key}) : super(key: key);

  @override
  State<DealOfTheDayWidget> createState() => _DealOfTheDayWidgetState();
}

class _DealOfTheDayWidgetState extends State<DealOfTheDayWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
     // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Text('Deal of the day',style: TextStyle(
              fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PhysicalModel(color:Colors.transparent,
            shadowColor: Colors.blue,
            elevation: 10,
            child: Image.asset('assets/images/item_7.jpeg',
            height: 200,
            fit: BoxFit.cover,
            width: double.infinity,),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Up to 31% off APC UPS Battery Back'),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(r'$10.99-$79.9'),
          ),  
        ],
      ),
    );
  }
}