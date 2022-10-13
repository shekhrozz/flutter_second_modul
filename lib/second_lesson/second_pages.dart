
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.amber[900],
      appBar: AppBar(backgroundColor: Colors.amber[900],
     centerTitle: true,
        title: const  Text('Apple Poducts'),
        elevation: .0,
        bottomOpacity: .0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
             height: 5,
             width: 40,
             decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:Colors.amber[400] ),
             child: Center(child: Text('1',style: TextStyle(color: Colors.white,fontSize: 20),)), 
            ),
          )
        ],
      ),
      drawer: Drawer(),
body:
ListView(
  children: [
     Padding(
  padding:EdgeInsets.all(20), 
  child: Container(
    height: 250,
    width: double.infinity,
    decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/robot.jpg',),fit: BoxFit.cover),
  borderRadius: BorderRadius.circular(30)
  ),

    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('LifeStyle sale',style: TextStyle(fontSize: 30,color: Colors.white),),
          Divider(
            thickness: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 30,
              child: 
            ElevatedButton(onPressed: (){}, child:Text('Show Now') )),
          )
        ],
      ),
    ),
  ),
  ),
   Padding(
  padding:EdgeInsets.all(20), 
  child: Container(
    alignment: Alignment.topRight,
    height: 250,
    width: double.infinity,
    decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/comp.jpg',),fit: BoxFit.cover),
    borderRadius: BorderRadius.circular(30)),

    child: Icon(Icons.heart_broken,color: Colors.red,size: 70,),
  ),
  ),

   Padding(
  padding:EdgeInsets.all(20), 
  child: Container(
    height: 250,
    width: double.infinity,
    decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/robot.jpg',),fit: BoxFit.cover),
    borderRadius: BorderRadius.circular(30)),
  ),),
  ],
),
floatingActionButton: FloatingActionButton(onPressed: (){
  Navigator.pushNamed(context, '/third');
  
},
child: Icon(Icons.arrow_forward),),
    );
    
  }
}