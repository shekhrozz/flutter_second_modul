import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_second_modul/fourth/fourth_pages.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  int _counter=0;
  @override
  final List<Product>_favouriteProductList=[];
  @override
  void initState() {
  _favouriteProductList.addAll([
    Product(image:'assets/images/image_1.jpeg', isFavourite:false),
    Product(image:'assets/images/image_2.jpg', isFavourite:false),
    Product(image:'assets/images/image_4.jpg', isFavourite:false),
    Product(image:'assets/images/image_5.jpg', isFavourite:false),
    Product(image:'assets/images/image_1.jpeg', isFavourite:false),
    Product(image:'assets/images/image_2.jpg', isFavourite:false),
    Product(image:'assets/images/image_4.jpg', isFavourite:false),
    Product(image:'assets/images/image_5.jpg', isFavourite:false),

  ]
  );
    
    super.initState();
  }


  Widget build(BuildContext context) {
    return LayoutBuilder(builder:(context, constraints) {
      if(constraints.maxWidth<600){
        return mobileview;
      }else{
        return Row(
          children: [
            Drawer(
              child: Column(
                children: [
                  DrawerHeader(
                    child: Container(
                      color: Colors.white,
                      alignment: FractionalOffset.center,
                      child: Text('Drawer',style: TextStyle(color: Colors.black),)
                    ))
                ],
              ),
            ),
            Expanded(child: mobileview)
          ],
        );
      }
    },
    );
  }
 Widget get mobileview=>Scaffold(
  backgroundColor: Theme.of(context).backgroundColor,
  appBar: AppBar(
    title: Text('Apple Products'),
    elevation: 0,
    bottomOpacity: 0,
    actions: [counterWidget],
  ),
  drawer: Drawer(
    child: Column(
      children: [
        DrawerHeader(child:
         Container(color: Colors.white,
         alignment: FractionalOffset.center,
         child: const Text('Drawer',style: TextStyle(color: Colors.black),),))
      ],
    ),
  ),
   body: SizedBox(
        child: body,
      ),

      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pushNamed(context, 'fiveth');
      }),

 );








Widget _productWidget(
  {required String? image,required bool? isSelected,required int index}){

return InkWell(
  onTap: (){
    if(_favouriteProductList[index].favourite){
      _counter--;
    }else{
      _counter++;
    }
    _favouriteProductList[index].favourite=!_favouriteProductList[index].favourite;
    setState(() {
      
    }

    );
  },
  child: Card(
    shape: RoundedRectangleBorder(
      
      borderRadius: BorderRadius.circular(20)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
          decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 5,color: Colors.orange),
            image:DecorationImage(image: AssetImage(image!,)) ),
                  child: ClipRRect(  
             // child: Image.asset(image!,fit:  BoxFit.cover,),
            ),
          ),

          Positioned(
            bottom: 10,
            right: 10,
            child:Icon(isSelected! ?Icons.star:Icons.star_border,
            size: 40,
            color: Colors.yellow,))

        
        ],
      ),
  ),
);
}



  //action appbar widget
Widget get counterWidget=>Padding(
  padding:const EdgeInsets.symmetric(vertical: 1,horizontal: 5),
  child:Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      
      color: const Color(0xFF424242),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        _counter.toString(),
      ),
    ),
  ),
  );  


// body widget
  Widget get body=> SafeArea(child: SingleChildScrollView(
    
    child: Column(
    children: [
      Padding(padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Container(
        height: 220,
       // alignment: FractionalOffset.bottomCenter,
        decoration: BoxDecoration(
          border: Border.all(width: 5,color: Colors.black),
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(image: AssetImage('assets/images/image_3.png'),
          fit: BoxFit.cover)
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
           // mainAxisSize: MainAxisSize.min,
            children: [
              Text('Lifestyle Sale',style:Theme.of(context).textTheme.bodyLarge),
              SizedBox(height: 30,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.20),
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){},
                   child: const Text('Show now')),
                ),
              )

            ],
          ),
        ),
      ),
      ),
      AnimationLimiter(child: GridView.builder(
        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _favouriteProductList.length,
          padding: const EdgeInsets.symmetric(horizontal: 15),
           itemBuilder:(context, index) => 
        AnimationConfiguration.staggeredGrid(
          position: index,
           columnCount:5,
           duration: Duration(seconds:2),
           child:ScaleAnimation(
            child: _productWidget(
              image:_favouriteProductList[index].image, 
              isSelected: _favouriteProductList[index].isFavourite,
               index: index))),))


    ],
  ),
  )
  );
}