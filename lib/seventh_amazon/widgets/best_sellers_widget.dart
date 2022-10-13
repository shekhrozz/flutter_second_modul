

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BestSillersWidget extends StatefulWidget {
  const BestSillersWidget({Key? key}) : super(key: key);

  @override
  State<BestSillersWidget> createState() => _BestSillersWidgetState();
}

class _BestSillersWidgetState extends State<BestSillersWidget> {
  
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 10),
              child: Text('Best seellers in Elecronics',
              style: TextStyle(fontSize: 18,
              fontWeight: FontWeight.w500),),
            ),
            GridView.count(crossAxisCount: 2,

            padding: EdgeInsets.all(15),
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
               itemCard(image: 'assets/images/item_6.jpeg'),
                 itemCard(image: 'assets/images/item_7.jpeg'),
                   itemCard(image: 'assets/images/item_4.jpeg'),
                 itemCard(image: 'assets/images/item_3.jpeg'),
                 itemCard(image: 'assets/images/item_5.jpeg'),
                  itemCard(image: 'assets/images/item_2.jpeg'),
                

            ],
            )
             
          ],
        ),
      ),
    );
  }Widget itemCard({required String? image}){
    return Card(
      elevation: .0,
      margin: EdgeInsets.zero,
      child: Image.asset(image!,
      fit: BoxFit.cover,),
    );
  }
}