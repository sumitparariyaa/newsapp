import 'package:flutter/material.dart';
import 'package:newsapp/states/carousel_provider.dart';
import 'package:provider/provider.dart';

class CustomIndicator extends StatelessWidget {
  final int length;

  const CustomIndicator({super.key,
    required this.length,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CarouselProvider>(
        builder: (context,carouselIndex,_){
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              length, (index) => Container(
              width: 8, height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: carouselIndex.index == index ? Colors.transparent : Colors.orange,
                border: Border.all(color: Colors.orange, width: 1.5),
              ),
            ),
            ),
          );
        }
    );
  }
}