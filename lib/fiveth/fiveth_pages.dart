
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_second_modul/model/hotel_model.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class FivethPage extends StatefulWidget {
  const FivethPage({Key? key}) : super(key: key);

  @override
  State<FivethPage> createState() => _FivethPageState();
}

class _FivethPageState extends State<FivethPage> {
  
  @override
  Widget build(BuildContext context) {
    final List<Hotel>_list=[
       Hotel(image: 'assets/images/ic_hotel3.jpg', title: 'Hotel'),
       Hotel(image: 'assets/images/ic_hotel4.jpg', title: 'Hotel'),
        Hotel(image: 'assets/images/ic_hotel3.jpg', title: 'Hotel'),
       Hotel(image: 'assets/images/ic_hotel4.jpg', title: 'Hotel'),
        Hotel(image: 'assets/images/ic_hotel3.jpg', title: 'Hotel'),
       Hotel(image: 'assets/images/ic_hotel4.jpg', title: 'Hotel')
    ];

    
    return Material(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
        SliverAppBar( 
          stretch: true,
          floating: true,
          pinned: true,
          snap: true,
          backgroundColor:Colors.white,
     expandedHeight: 200,
     
     flexibleSpace: FlexibleSpaceBar(
      centerTitle: true,
      title: Padding(padding:EdgeInsets.symmetric(horizontal: 10),
      child: CupertinoTextField(
        placeholder: '  Search for hotel',style: TextStyle(fontSize:15),
        prefix: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.search,size: 20,),
        ),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
        color: Colors.white),
      )
      ),

      stretchModes: [
        StretchMode.blurBackground,
        StretchMode.fadeTitle,
        StretchMode.zoomBackground,
      ],
       background: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset( 'assets/images/ic_header.jpg',
          colorBlendMode: BlendMode.darken,
          fit: BoxFit.cover,),

          Positioned(
            bottom: 100,
            left: 20,
            right: 20,
               child: Column(
                   children: [
                     Positioned(child: SizedBox(
                       width: MediaQuery.of(context).size.width,
                       child: Text('What kind hotel do you need ?',
                       style:TextStyle(color: Colors.white,
                       fontSize: 25,
                       fontWeight: FontWeight.bold,
                       ) ,textAlign:TextAlign.center,),)
                       )
             
                   ],
                 ),
             ),

          
        ],
      ),
     ),
        ),
SliverPadding(padding: EdgeInsets.symmetric(
  vertical: 20,
  horizontal: 20,
  ),
  sliver: SliverToBoxAdapter(
    child: Row(
      children: [
        Text('Best hotels',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
      ],
    ),
  ),
  ),
  SliverToBoxAdapter(
             child: SizedBox(
              height: 190,
              child: AnimationLimiter(
                child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: _list.length,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final Hotel hotel = _list[index];
                      return AnimationConfiguration.staggeredList(
                        duration: const Duration(seconds: 1),
                        position: index,
                        child: ScaleAnimation(
                          delay: const Duration(milliseconds: 200),
                          child: AspectRatio(
                            aspectRatio: 2.1 / 1.4,
                            child: Card(
                             // color: Colors.transparent,
                              margin: EdgeInsets.zero,
                              elevation: .0,
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                alignment: FractionalOffset.bottomLeft,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        image: AssetImage(hotel.image),
                                        colorFilter: ColorFilter.mode(
                                            Colors.black.withOpacity(0.3),
                                            BlendMode.darken),
                                        fit: BoxFit.cover)),
                                child: Text(
                                  '${hotel.title} ${index + 1}',
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ),
          
SliverPadding(padding: EdgeInsets.symmetric(
  vertical: 20,
  horizontal: 20,
  ),
  sliver: SliverToBoxAdapter(
    child: Row(
      children: [
        Text('Luxury hotels',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
      ],
    ),
  ),
  ),

         SliverToBoxAdapter(
            child: AnimationLimiter(
              child: SizedBox(
                height: 190,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder:(context, index) {
                   final Hotel hotel=_list[index];
                    return AnimationConfiguration.staggeredList(
                      duration: Duration(seconds: 3),
                      position: index,
                      child: FadeInAnimation(
                        child: AspectRatio(
                          aspectRatio: 4/3  ,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              color: Colors.transparent,
                              margin: EdgeInsets.zero,
                              elevation: .0,
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: AssetImage(hotel.image),
                                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3),
                                     BlendMode.darken,
                                     ),
                                     fit: BoxFit.cover)
                                ),
                                child: Text('${hotel.title} ${index+1}',
                                style: TextStyle(fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                                ),
                              ),
                                  
                             ),
                          ),
                          ),
                      ),
                    );
                  },
                   separatorBuilder:(context, index) => SizedBox(width: 5,),
                    itemCount:_list.length),
              ),
            ),
          ),
          
       
          SliverList(delegate:SliverChildBuilderDelegate(((context, index) => 
          Card(
            color: Colors.green,
            child: FloatingActionButton(onPressed: (){
              Navigator.pushNamed(context, '/amazon');
            })
          )
        ),
        childCount: 1
        ),

        ),
      
        ],
  
        ),
      
    );
  }
}

