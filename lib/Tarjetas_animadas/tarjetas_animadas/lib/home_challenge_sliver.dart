
import 'package:flutter/material.dart';

class HomeSliverChallenge extends StatefulWidget {
  const HomeSliverChallenge({Key? key}) : super(key: key);

  @override
  _HomeSliverChallengeState createState() => _HomeSliverChallengeState();
}

class _HomeSliverChallengeState extends State<HomeSliverChallenge> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(delegate: _AppBarNetflix(
            minExtended: kToolbarHeight,
            maxExtended: size.height * .35,
            size: size,
          ),
          ),
          SliverToBoxAdapter(
            child: Body(size: size),
          ), 
        ], 
      ),
    ); 
  }
}


class _AppBarNetflix extends SliverPersistentHeaderDelegate{
  const _AppBarNetflix(this.maxExtended, this.minExtended, this.size);
  final double maxExtended;
  final double minExtended;
  final Size size;
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final percent = shrinkOffset / maxExtended;
    final uploadlimit = 13 / 100;
    final valueback = (1 - percent - 0.77).clamp(0, uploadlimit);
    

    final card = _CoverCard(
          Size: size, 
          percent : percent,
          uploadlimit : uploadlimit,
          valueback : valueback
        );

   return Container(
    child: Stack(
      children: [
        BackgroundSliver(), card
        
      ],
    ),
   );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => maxExtended;

  @override
  // TODO: implement minExtent
  double get minExtent => minExtended;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => 
  false;

}

class _CoverCard extends StatelessWidget{
const _ CoverCard ({Key key, this.size, this.percent, required this.uploadlimit, required this.valueback,}): super (key: key);
  final Size size;
  final double percent;
  final double uploadlimit;
  final num valueback;
  final double angleForCard = 6.5;
  
  @override
  Widget build(BuildContext context) {
   return Positioned(
    top: size.height * 0.15,
    left: size.width / 24,
    child: Transform(
    alignment: Alignment.topRight,
    transform: Matrix4.identity()
    ..rotateZ(
      percent > uploadlimit
      ? (valueback * angleForCard)
      : percent * angleForCard)
      percent * angleForCard),
    child: CoverPhoto(size: size),
    ),
   );
  }
}