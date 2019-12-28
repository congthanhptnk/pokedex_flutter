import 'package:flutter/material.dart';
import 'package:pokedex_flutter/widgets/main_card.dart';

class ScrollCard extends StatelessWidget {
  final int currentIndex;
  final double currentPage;
  final MainCard card;

  ScrollCard({this.currentIndex, this.currentPage, this.card});

  @override
  Widget build(BuildContext context) {
    double relativePos = currentIndex - currentPage;
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Transform(
        transform: Matrix4.identity()
          // ..setEntry(3, 2, 0.003)
          ..scale((1 - relativePos.abs()).clamp(0.2, 0.6) + 0.4),
        // ..rotateZ(relativePos),
        alignment:
            relativePos >= 0 ? Alignment.centerLeft : Alignment.centerRight,
        child: card,
      ),
    );
  }
}
