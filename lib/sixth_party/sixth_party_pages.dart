import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SixthPage extends StatefulWidget {
  const SixthPage({Key? key}) : super(key: key);

  @override
  State<SixthPage> createState() => _SixthPageState();

}

class _SixthPageState extends State<SixthPage>with SingleTickerProviderStateMixin{

 late MediaQueryData _mediaQueryData;
  @override
   void didChangeDependencies() {
   _mediaQueryData=MediaQuery.of(context);
     super.didChangeDependencies();
    }
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: body,
     );
   }
   Widget get body{
      return Stack(
       fit: StackFit.expand,
       children: [
          backgroundWidget
         ],
      );
    }
    
  Widget get backgroundWidget=>SizedBox(
  height: _mediaQueryData.size.height,
  width: _mediaQueryData.size.width,
  child: Image.asset('assets/images/im_party.jpeg',
  fit: BoxFit.cover,),
  );
}