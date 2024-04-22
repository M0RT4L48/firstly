import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tarjetas_animadas/widgets/background_sliver.dart';
import 'package:tarjetas_animadas/widgets/body_sliver.dart';
import 'package:tarjetas_animadas/widgets/button_back.dart';
import 'package:tarjetas_animadas/widgets/cover_photo.dart';
import 'package:tarjetas_animadas/widgets/data_cut_rectangle.dart';
import 'package:tarjetas_animadas/widgets/cut_rectangle.dart';
import 'package:tarjetas_animadas/widgets/favorite_circle.dart';

// Define un widget StatefulWidget para la pantalla principal
class HomeSliverChallenge extends StatefulWidget {
  const HomeSliverChallenge({Key? key}) : super(key: key);

  @override
  _HomeSliverChallengeState createState() => _HomeSliverChallengeState();
}

// Define el estado del widget StatefulWidget
class _HomeSliverChallengeState extends State<HomeSliverChallenge> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Encabezado personalizado que se desplaza
          SliverPersistentHeader(
            delegate: _AppBarNetflix(
              maxExtended: size.height * .35,
              minExtended: kToolbarHeight,
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

// Define el encabezado personalizado que se desplaza con el contenido
class _AppBarNetflix extends SliverPersistentHeaderDelegate {
  const _AppBarNetflix({
    required this.maxExtended,
    required this.minExtended,
    required this.size,
  });

  final double maxExtended;
  final double minExtended;
  final Size size;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final percent = shrinkOffset / maxExtended;
    final uploadlimit = 13 / 100;
    final valueback = (1 - percent - 0.77).clamp(0.0, uploadlimit);
    final fixrotation = pow(percent, 1.5).toDouble();

    final card = _CoverCard(
      size: size,
      percent: percent,
      uploadlimit: uploadlimit,
      valueback: valueback,
    );

    final bottomsliverbar = _CustomBottomSliverBar(
      size: size,
      fixrotation: fixrotation,
      percent: percent,
    );

    return Container(
      child: Stack(
        children: [
          BackgroundSliver(),
          bottomsliverbar,
          if (percent > uploadlimit) ...[
            card,
            bottomsliverbar,
          ] else ...[
            bottomsliverbar,
            card,
          ],
          ButtonBack(size: size, percent: percent),
          FavoriteCircle(size: size, percent: percent),
        ],
      ),
    );
  }

  @override
  double get maxExtent => maxExtended;

  @override
  double get minExtent => minExtended;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

// Define el widget para mostrar la imagen de portada con una rotación dinámica
class _CoverCard extends StatelessWidget {
  const _CoverCard({
    Key? key,
    required this.size,
    required this.percent,
    required this.uploadlimit,
    required this.valueback,
  }) : super(key: key);

  final Size size;
  final double percent;
  final double uploadlimit;
  final double valueback;
  final double angleForCard = 6.5;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: size.height * 0.15,
      left: size.width / 24,
      child: Transform(
        alignment: Alignment.topRight,
        transform: Matrix4.identity()
          ..rotateZ(percent > uploadlimit
              ? (valueback * angleForCard)
              : percent * angleForCard),
        child: CoverPhoto(size: size),
      ),
    );
  }
}

// Define el widget para la barra inferior personalizada
class _CustomBottomSliverBar extends StatelessWidget {
  final Size size;
  final double fixrotation;
  final double percent;

  _CustomBottomSliverBar({
    required this.size,
    required this.fixrotation,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: (-size.width * fixrotation.clamp(0, 0.35)).toDouble(),
      right: 0,
      child: _CustomBottomSliver(
        size: size,
        percent: percent,
      ),
    );
  }
}

// Define el widget para la barra inferior personalizada
class _CustomBottomSliver extends StatelessWidget {
  const _CustomBottomSliver({
    required this.size,
    required this.percent,
  });

  final Size size;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.12,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(
            painter: CutRectangle(),
          ),
          DataCutRectangle(size: size, percent: percent),
        ],
      ),
    );
  }
}
