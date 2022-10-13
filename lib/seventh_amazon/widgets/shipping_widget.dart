import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ShippingWidget extends StatefulWidget {
  const ShippingWidget({Key? key}) : super(key: key);

  @override
  State<ShippingWidget> createState() => _ShippingWidgetState();
}

class _ShippingWidgetState extends State<ShippingWidget> {
  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      height: 120,
    //  width: double.infinity,
      child: Row(
        children: [
        const   Expanded(
            flex: 5,
            child: ColoredBox(
            color: Colors.white,
            child: Center(
            child: Padding(padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('We ship 45 mln products'),)
            ),
            ),
            ),
            Expanded(
              flex: 7,
              child: ColoredBox(color: Colors.white,
              child: ClipRRect(
                borderRadius: BorderRadius.horizontal(left: Radius.circular(75)),
                child: Image.asset('assets/images/image_1.1.jpeg',
                fit: BoxFit.cover,
                height: 400,),
                
              ),
              ))
        ],
      ),
    );
  }
}