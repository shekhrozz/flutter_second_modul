import 'package:flutter/cupertino.dart';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_second_modul/seventh_amazon/consts/consts.dart';
import 'package:flutter_second_modul/seventh_amazon/widgets/best_sellers_widget.dart';
import 'package:flutter_second_modul/seventh_amazon/widgets/button_widget.dart';
import 'package:flutter_second_modul/seventh_amazon/widgets/deal_of_day_widget.dart';
import 'package:flutter_second_modul/seventh_amazon/widgets/shipping_widget.dart';

class SeventhPage extends StatefulWidget {
  const SeventhPage({Key? key}) : super(key: key);

  @override
  State<SeventhPage> createState() => _SeventhPageState();
}

class _SeventhPageState extends State<SeventhPage> {

  @override
  Widget build(BuildContext context) {
    final ScrollController _controller=ScrollController();
   // double _angle=0;
    void rotateContainer(){
      _controller.addListener(() {
        if (kDebugMode) {
         // _angle=_controller.position.pixels;
          setState(() {
            
          }
          );
        }
      });
    }
    setState(() {
      rotateContainer();
    });

    return Scaffold(
      backgroundColor: AppConsts.backgroundGrey,
      appBar: AppBar(
        backgroundColor: AppConsts.primaryColorAmazon,
        elevation: .0,
        bottomOpacity: .0,
        title: Image.asset('assets/images/amazon_logo.png',
        width: 100,),

        actions: [
          Icon(Icons.mic),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.shopping_cart_outlined),

          SizedBox(
            width: 10,
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 80,
              width: double.infinity,
              color:AppConsts.primaryColorAmazon,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
            fillColor:Colors.white,
            filled: true,
            hintText: 'What are you looking for', 
             prefixIcon: Icon(Icons.search,color:AppConsts.primaryColorAmazon,),
                    suffixIcon: Icon(Icons.camera_enhance_outlined,color: AppConsts.primaryColorAmazon,),
            
                    border: OutlineInputBorder( 
                      borderRadius: BorderRadius.circular(5),
                  
                    ),
                    
                  ),
            
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: _controller,
               physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                  
                ),
                child: Column(
                  children: [
                    locationWidget,
                    ShippingWidget(),
                    SizedBox(height: 10,),
                    ButtonWidget(),
                    SizedBox(height: 10,),
                    DealOfTheDayWidget(), 
                     Transform.rotate(angle: pi/4,
                  child: DealOfTheDayWidget(),
                ),  
                  SizedBox(
                      height: 10,
                    ),
                    BestSillersWidget(),
                
                  ],
                ),
              ),
            )
          ],
        )
        ),
    );
  }
  Widget get locationWidget{
    return const Card(
      margin: EdgeInsets.zero,
      child: ListTile(
        minLeadingWidth: 5,
        horizontalTitleGap: 5,
        tileColor: AppConsts.locationColor,
        leading: Icon(Icons.location_on,color: Colors.white,),
        title: Text('Deliver to Korea,Republic of',style: TextStyle(fontSize: 15,color: Colors.white),
        )
      ),
    );
  }
}