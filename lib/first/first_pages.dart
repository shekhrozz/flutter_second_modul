
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage>with TickerProviderStateMixin {
late AnimationController? _animationController;
late AnimationController? _animationControllerOne;
late ColorTween?_colorTween;
late Animation<Color?>?_animation;
late Animation<Offset?>_animationOfset;
late Animation<double>_animationfade;
late Tween<Offset?>_offset;
late MediaQueryData?_mediaQueryData;

@override
  void initState() {
    _animationControllerOne=AnimationController(vsync: this,
    duration: Duration(seconds: 5));
    _offset=Tween(begin: const Offset(0,-200),end: const Offset(0, 0));
    _animationOfset=_offset.animate(CurvedAnimation(parent: _animationControllerOne!, curve: Curves.easeIn));
    _animationfade=Tween(begin: .0,end: 1.0).animate(CurvedAnimation(
      parent: _animationControllerOne!, curve:const Interval(.8,1 ,curve:Curves.bounceInOut )));
      _animationControllerOne!.repeat();

      _animationController=AnimationController(vsync: this,duration: Duration(seconds: 2));
      _colorTween=ColorTween(begin: Colors.red,end: Colors.blue); 
      _animation=_colorTween!.animate(CurvedAnimation(parent:_animationController!,
       curve:Curves.easeIn,
       )
       );
    _animationController!.repeat(reverse:true,period: const Duration(seconds:3),);
    super.initState();

  }

@override
  void didChangeDependencies() {
    _mediaQueryData=MediaQuery.of(context);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
     
     return Scaffold(
      body: Stack(
        children: [
          _backgroundWidget,_foregroundWidget
        ],
      ),
    floatingActionButton: FloatingActionButton(onPressed: (){

      Navigator.pushNamed(context, '/second');
    }),

     );
  }
Widget get _foregroundWidget{
  return Column(
    children: [
      Container(
   //color: Colors.red,
       height: _mediaQueryData!.size.height*0.30,
        width: _mediaQueryData!.size.width,
       padding: const EdgeInsets.only(left: 20,top: 30),
       transform:Matrix4.translationValues(0, 28, 0),
      // decoration: const BoxDecoration(color: Colors.transparent),
       child:AnimatedBuilder(
        animation: _animationOfset, 
        builder:(context, child) {
          return Transform.translate(offset: _animationOfset.value!,
         child: const Text.rich(
        TextSpan(text: 'Login\n\n',
        style: TextStyle(fontSize: 30,color: Colors.white),
        children:[
          TextSpan(
            text: 'Welcome Back',style: TextStyle(fontSize: 18,color: Colors.white)
          )
        ]
         )
       ),
        );
        },)
      ),
       Expanded(
            child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(60)),
          child: ColoredBox(
            color: Colors.white,
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(
                    top: _mediaQueryData!.size.height*0.05,
                    left: _mediaQueryData!.size.width*0.1 ,
                      right: _mediaQueryData!.size.width*0.1),
           
                child: Card(
                  elevation: 10,
                 // color: Colors.orange,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    
                    child: Column(
                      children: [
                        _myTextField(hintText: 'Email', obsure: true),
                        const Divider(
                          thickness: 5,
                          color: Colors.grey,
                        ),
                          _myTextField(hintText: 'Password', obsure: false),
                         
                       
                      ],
                    ),
                  ),
                ),
              ),SizedBox(
                height: 20,
              ),
                Padding(
                  padding:EdgeInsets.symmetric(
                    horizontal: _mediaQueryData!.size.width*0.2,
                  ),
                  
                  child: SizedBox(
                    width: double.infinity,
                          child: _button(text: 'Login', onPressed:(){}, color:Colors.greenAccent),
                           ),
                ),
                Padding(padding: EdgeInsets.only(top: 20,bottom: 20),
                child: Text('Login with SNS',style: TextStyle(color: Colors.grey,fontSize: 15)
                ),
                ),
                Row(
                  children: [
                     Spacer(
                        flex: 1,
                       ),
                    Expanded(
                      flex: 3,
                      child:_button(text: 'Facebook', onPressed:(){}, color:Colors.blue)
                       ),
                       Spacer(
                        flex: 1,
                       ),
                  Expanded(
                    flex: 3,
                  
                          child:_button(text: 'Github', onPressed:(){}, color:Colors.black) ),
                           Spacer(
                        flex: 1,
                       ),
                  ]
                )

            ]
            )
    
          )
            )
       )
      
    ],
  );
}
Widget _button({required String? text,required VoidCallback? onPressed,required Color color}){
  return CupertinoButton(
    padding: const EdgeInsets.only(top:15,bottom: 15),
    child: Text(text!),
     onPressed: onPressed,
     color: color,);
    
}



Widget _myTextField({required String? hintText,required bool? obsure}){
  return TextField(
      obscureText: obsure!,
      decoration: InputDecoration(
        hintText: hintText!,
        border: const OutlineInputBorder(borderSide: BorderSide.none)
      ),
  );
}



  Widget get _backgroundWidget{
   const Color baseColor = Color(0xFF1B5E20);
   return AnimatedBuilder(
    animation: _animation!,
     builder:(context, child) {
       return DecoratedBox(
    decoration: BoxDecoration(
      color: _animation!.value!,
    //  color: Colors.green,
     // gradient: LinearGradient(
       // begin: Alignment.topLeft,
       // end: Alignment.bottomRight,
       // colors: [
       // baseColor.withOpacity(0.9),
       // baseColor.withOpacity(0.8),
         //baseColor.withOpacity(0.7),
          //baseColor.withOpacity(0.6),
           //baseColor.withOpacity(0.5),
            //baseColor.withOpacity(0.4),
             //baseColor.withOpacity(0.3),
             // baseColor.withOpacity(0.2),
               //baseColor.withOpacity(0.1),
//]
  //    )
    ),
    position: DecorationPosition.foreground,
    child: SizedBox(
     height: _mediaQueryData!.size.height,
      width: _mediaQueryData!.size.width,
    ),

    );
     },
     );
  
  }
}