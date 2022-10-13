import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late PageController _pageController;
  late int? _currentIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

          backgroundColor: Colors.black,
          body: Stack(
            fit: StackFit.expand,
            children: [
              SizedBox(
                width: double.infinity,
                child:IntroCardWidget(
                  image: 'assets/images/image_1_png',
                   subtitle:'Learn from experts',
                    title: 'Select from top instructors around the world'),
              )
            ],
            
          ),
        

    );
  }
}
class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({Key? key,
  required int? currentIndex,
  
  }) :_currentIndex=currentIndex , super(key: key);

  final int? _currentIndex;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(duration: Duration(milliseconds: 500),
          height: 5,
          width: _currentIndex==0 ?20 :5,
          curve: Curves.ease,
          decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(2.5),
          ),
          ),
          const SizedBox(
            width: 5,
          ),
          AnimatedContainer(
            duration:const Duration(milliseconds: 500),
            curve: Curves.ease,
            height: 5,
            width: _currentIndex==2?20:5,
            decoration: BoxDecoration(color: Colors.green,
            borderRadius: BorderRadius.circular(2.5),
            ), )
        ],
      )
    );
    
  }
}



class IntroCardWidget extends StatelessWidget {

  final String? image;
  final String title;
  final String subtitle;
  const IntroCardWidget({Key? key,
  required this.image,
  required this.subtitle,
  required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) { 

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image!,
        width: 300,),

        Text(title,
        style: TextStyle(
          color: Colors.green,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        ),
        Padding(padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width*0.2,
        
        ),
        child: Text(subtitle,style: TextStyle(
          color: Colors.grey,
          fontSize: 16,
          fontWeight:FontWeight.w500
        ),
        ),
        )
        
      ],
    );
    
  }
}